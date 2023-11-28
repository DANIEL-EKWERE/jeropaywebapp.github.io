import 'dart:io';
import 'dart:convert';
import 'package:databank/backend/constant.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/backend/provider/user_details/user_details.dart';
// import 'package:databank/views/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:databank/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:databank/views/log_in.dart';
import 'package:path/path.dart';

// import '../../../views/create_profile.dart';

class AuthenticationProvider extends ChangeNotifier {
  final requestBaseUrl = AppUrl.baseUrl;
// setter
  bool _isLoading = false;
  String _reqMessage = '';
  Color? _color;

  Color? get color => _color;
  bool get isLoading => _isLoading;
  String get reqMessage => _reqMessage;

// register user

// WARNING: Icons with alpha channel are not allowed in the Apple App Store.
// Set "remove_alpha_ios: true" to remove it.
  void RegisterUser(
      {required String? username,
      required String? email,
      required String? first_name,
      required String? last_name,
      required String? password,
      required BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();
    String url = '$requestBaseUrl/user/create-account/';

    final body = {
      "username": username,
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "password": password,
    };
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
    };
    try {
      http.Response res = await http.post(Uri.parse(url),
          headers: reqHeader, body: json.encode(body));

      if (res.statusCode == 201 || res.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'Account Created Successfully';
        _color = const Color.fromARGB(255, 15, 175, 20);

        notifyListeners();
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/Login", (route) => false);
      } else {
        final req = json.decode(res.body);
        _isLoading = false;
        final message = req['data'];
        final status = req['status'];
        _reqMessage = '$status \n $message';
        _color = const Color(0xfff33225);
        notifyListeners();
        print(req);
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      if (e is SocketException) {
        _isLoading = false;
        _reqMessage = 'please try again network issues ${e.toString()}';
        _color = const Color(0xfff33225);
        notifyListeners();
      } else if (e is http.ClientException) {
        _isLoading = false;
        _reqMessage = 'please try again server error: ${e.toString()}';
        _color = const Color(0xfff33225);
        notifyListeners();
      } else {
        _isLoading = false;
        _reqMessage = 'please try again ${e.toString()}';
        _color = const Color(0xfff33225);
        notifyListeners();
        print(e);
      }
      _isLoading = false;
      _reqMessage = 'please try again ${e.toString()}';
      _color = const Color(0xfff33225);
      notifyListeners();
      print(e);
    }
  }

  Future<bool> queryUserProfile() async {
    try {
      final access = await DataBaseProvider().getToken();
      Map<String, String>? reqHeader = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access',
      };
      final url = '$requestBaseUrl/user/create/profile/';
      http.Response request =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (request.statusCode == 200  || request == 201) {
        final res = json.decode(request.body);
        final image = res['profileImage'];
        DataBaseProvider().saveProfileImage(image);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
    
  }

  // login user

  void loginUser(
      {required String? username,
      required String? password,
      required BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();
    String url = '$requestBaseUrl/user/login-user/';
    final isProfileCreated = await queryUserProfile();
    final body = {
      "username": username,
      "password": password,
    };
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
    };

    try {
      http.Response res = await http.post(Uri.parse(url),
          headers: reqHeader, body: json.encode(body));
      print(res.body);
      print(res.statusCode);
      _reqMessage = '${res.body}';
      if (res.statusCode == 201 || res.statusCode == 200) {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = 'Login Successfully!!!';
        _color = const Color.fromARGB(255, 15, 175, 20);
        print(isProfileCreated);
        final deviceToken = await FirebaseMessaging.instance.getToken();
        final platform = await DefaultFirebaseOptions.currentPlatform;
       await UserDetails().createOrUpdateDeviceTokenAndPlatform(
              platform: platform, token: deviceToken);
        notifyListeners();
        final String token = req['token'].toString();
        final String userId = req['user_id'].toString();
        final String username = req['username'].toString();

        print(token);
        print(userId);
        print(username);
        DataBaseProvider().saveToken(token);
        DataBaseProvider().saveUserId(userId);
        DataBaseProvider().saveUserName(username);
        DataBaseProvider().getProfileId().then((value) {
          print('profle id $value');
          if (value.isEmpty) {
            if (isProfileCreated) {
              Navigator.of(context!)
                  .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
            }
            Navigator.of(context!)
                .pushNamedAndRemoveUntil("/CreatUserProfile", (route) => false);
                
          } else {
            Navigator.of(context!)
                .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
          }
        });
        notifyListeners();
      } else {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = req['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        print(req);
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'please try again ${e.toString()}';
      _color = const Color(0xfff33225);
      notifyListeners();
      print(e.toString());
    }
  }

  // profile creation

  void CreateUserProfile(
      {required String location,
      required String phone,
      required String state,
      File? profile_picture,
      required BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();
    String url = '$requestBaseUrl/user/create/profile/';
    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };
    try {
      var res = http.MultipartRequest('POST', Uri.parse(url));

      // Set the headers
      res.headers.addAll(reqHeader);

      res.fields['location'] = location;
      res.fields['phone'] = phone;
      res.fields['state'] = state;

      // if (profile_picture != null) {
      //   res.files.add(http.MultipartFile.fromBytes(
      //     'profile_picture',
      //     await profile_picture.readAsBytes(),
      //     filename: 'profile_picture.png',
      //   ));
      // }

      final pickedFileToFile = File(profile_picture!.path);
      final imageStream =
          http.ByteStream(Stream.castFrom(pickedFileToFile.openRead()));
      final lenght = await pickedFileToFile.length();
      final imageUpload = http.MultipartFile(
          'profile_picture', imageStream, lenght,
          filename: basename(pickedFileToFile.path));
      res.files.add(imageUpload);
      var response = await res.send();
      if (response.statusCode == 201 || response.statusCode == 200) {
        //  final req = json.decode(res);
        _isLoading = false;
        _reqMessage = 'Profile Created Successfully';
        _color = const Color.fromARGB(255, 15, 175, 20);
        await DataBaseProvider().saveProfileId(phone);
        await UserDetails().getUserAccountDetails();
        notifyListeners();

        // Navigator.push(context!,
        //     MaterialPageRoute(builder: (context) => const AppLayout()));
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
      } else if(response.statusCode == 500){
        var req = await response.stream.bytesToString();
       var res =  json.decode(req);
        _reqMessage = res['message'];
        Navigator.of(context!)
                .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
        notifyListeners();
        
      }else{
        _isLoading = false;
        _reqMessage = 'Error Creating Profile ${response.statusCode}';
        const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'please try again $e';
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  void clear() {
    _reqMessage = '';
    _color = null;
    notifyListeners();
  }
}
