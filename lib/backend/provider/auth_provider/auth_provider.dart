import 'dart:io';
import 'dart:convert';
import 'package:databank/backend/constant.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/backend/provider/user_details/user_details.dart';
// import 'package:databank/views/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
// import 'package:databank/firebase_options.dart';
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
  bool _hasProfile = false;

  bool get hasProfile => _hasProfile;
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
      if (request.statusCode == 200 || request == 201) {
        _hasProfile = true;
        final res = json.decode(request.body);
        final image = res['profileImage'];
        DataBaseProvider().saveProfileImage(image);
        notifyListeners();
      } else {
        throw Exception('Failed to load data ${request.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data ${e.toString()} ');
    }
    return _hasProfile;
  }

  // update password

  Future<void> changePassword(
      {required String old_password, required String new_password}) async {
    _isLoading = true;
    try {
      final access = await DataBaseProvider().getToken();
      Map<String, String>? reqHeader = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access',
      };

      final body = {
        'old_password': old_password,
        'new_password': new_password,
      };
      final url = '$requestBaseUrl/user/change-password/';
      http.Response request = await http.post(Uri.parse(url),
          headers: reqHeader, body: json.encode(body));
      if (request.statusCode == 200) {
        _isLoading = false;

        final res = json.decode(request.body);
        final image = res['message'];
        DataBaseProvider().saveProfileImage(image);
        notifyListeners();
      } else if (request.statusCode == 400) {
        _isLoading = false;
        final res = json.decode(request.body);
        final image = res['old_password'];
        _reqMessage = image;
        notifyListeners();
        throw Exception('Failed to load data ${request.statusCode}');
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res;
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'somthing went wrong ${e.toString()}';
      notifyListeners();
      throw Exception('Failed to load data ${e.toString()} ');
    }
    //return _hasProfile;
  }

  // login user

  void loginUser(
      {required String? username,
      required String? password,
      required BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();
    String url = '$requestBaseUrl/user/login-user/';
    print('calling login in');
    // final isProfileCreated = await queryUserProfile();
    final body = {
      "username": username,
      "password": password,
    };
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
    };

    try {
      print('calling login in try block');
      http.Response res = await http.post(Uri.parse(url),
          headers: reqHeader, body: json.encode(body));
      print(res.body);
      print(res.statusCode);
      _reqMessage = '${res.body}';
      if (res.statusCode == 200) {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = 'Login Successfully!!!';
        _color = const Color.fromARGB(255, 15, 175, 20);
        //  print(isProfileCreated);
        final deviceToken = await FirebaseMessaging.instance.getToken();
        final platform = 'android';
        print(deviceToken);
        print(platform);
        await UserDetails().createOrUpdateDeviceTokenAndPlatform(
            platform: 'android', token: deviceToken);
        notifyListeners();
        final String token = req['token'].toString();
        final String userId = req['user_id'].toString();
        final String username = req['username'].toString();
        final String profileId = req['profile_id'].toString();
        final String phone = req['phone_number'].toString();
        final String email = req['email'].toString();
        final String first_name = req['first_name'].toString();
        final String last_name = req['last_name'].toString();

        print(token);
        print(userId);
        print(username);
        print(phone);
        print(email);
        print(first_name);
        print(last_name);
        DataBaseProvider().saveToken(token);
        DataBaseProvider().saveUserId(userId);
        DataBaseProvider().saveUserName(username);
        DataBaseProvider().saveProfileId(profileId);
        DataBaseProvider().saveEmail(email);
        DataBaseProvider().saveFirstName(first_name);
        DataBaseProvider().saveLastName(last_name);
        DataBaseProvider().getPhone().then((phone1) {
          if (phone1.isEmpty) {
            DataBaseProvider().savePhoneNumber(phone);
          }
        });

        // DataBaseProvider().getProfileId().then((value) {
        //   print('profle id $value');
        //   if (value.isEmpty) {
        //     // if (isProfileCreated) {
        //     //   Navigator.of(context!)
        //     //       .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
        //     // }
        //   } else {
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
        //   }
        // });
        notifyListeners();
      } else if (res.statusCode == 201) {
        final req = json.decode(res.body);
        final String token = req['token'].toString();
        DataBaseProvider().saveToken(token);
        _isLoading = false;
        _reqMessage = 'create profile to continue';
        _color = const Color(0xfff33225);
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/CreatUserProfile", (route) => false);
        notifyListeners();
        print(req);
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
  //  _reqMessage = 'access token $access';
    notifyListeners();
    try {
      var res = http.MultipartRequest('POST', Uri.parse(url));

      // Set the headers
      res.headers.addAll(reqHeader);

      res.fields['location'] = location;
      res.fields['phone'] = phone;
      res.fields['state'] = state;

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
        _isLoading = false;
        _reqMessage = 'Profile Created Successfully';
        _color = const Color.fromARGB(255, 15, 175, 20);
        await DataBaseProvider().saveProfileId(phone);
        await UserDetails().getUserAccountDetails();
        notifyListeners();
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
      } else if (response.statusCode == 500) {
        var req = await response.stream.bytesToString();
        var res = json.decode(req);
        _reqMessage = res['message'];
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/App_Layout", (route) => false);
        notifyListeners();
      } else if (response.statusCode == 401) {
        _isLoading = false;
        var req = await response.stream.bytesToString();
        var res = json.decode(req);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        // Handle unauthorized access (e.g., redirect to login screen)
        // Example: Navigator.pushNamed(context, '/login');
        Navigator.of(context!)
            .pushNamedAndRemoveUntil("/Login", (route) => false);

        notifyListeners();
      } else {
        _isLoading = false;
        var responseBody = await response.stream.bytesToString();
        var responseJson = json.decode(responseBody);

        // Check if 'body' property exists in the response
        var bodyValue = responseJson['body'] ?? 'No body found';

        _reqMessage =
            'Error Creating Profile ${response.statusCode} $bodyValue';
        _color = const Color(0xfff33225);
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
