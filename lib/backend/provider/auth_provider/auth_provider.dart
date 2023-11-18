import 'dart:io';
import 'dart:convert';
import 'package:databank/backend/constant.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/backend/provider/user_details/user_details.dart';
import 'package:databank/views/app_layout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:databank/views/log_in.dart';

import '../../../views/create_profile.dart';

class AuthenticationProvider extends ChangeNotifier {
  final requestBaseUrl = AppUrl.baseUrl;
// setter
  bool _isLoading = false;
  String _reqMessage = '';
  Color? _color;
  // Color _red = const Color(0xfff33225);
  // Color _green = const Color.fromARGB(255, 15, 175, 20);
// getter

  Color get color => _color!;
  // Color get red => _red;
  // Color get green => _green;
  bool get isLoading => _isLoading;
  String get reqMessage => _reqMessage;

// register user

  void RegisterUser(
      {required String username,
      required email,
      required String first_name,
      required String last_name,
      required password,
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

    try {
      http.Response res =
          await http.post(Uri.parse(url), body: json.encode(body));

      if (res.statusCode == 201 || res.statusCode == 200) {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = 'Account Created Successfully';
        _color = const Color.fromARGB(255, 15, 175, 20);

        notifyListeners();
        Navigator.of(context!).push(CupertinoPageRoute(
          builder: (context) => const LoginScreen(),
        ));

        print(req);
      } else {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = req['status'];
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
      _reqMessage = 'please try again';
      _color = const Color(0xfff33225);
      notifyListeners();
      print(e);
    }
  }

  // login user

  void LoginUser(
      {required String username,
      required password,
      required BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();
    String url = '$requestBaseUrl/user/login-user/';

    final body = {
      "username": username,
      "password": password,
    };

    try {
      http.Response res =
          await http.post(Uri.parse(url), body: json.encode(body));

      if (res.statusCode == 201 || res.statusCode == 200) {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = 'Login Successfully!!!';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
        print(req);
        final token = req['token'];
        final userId = req['userId'];
        final username = req['username'];
        DataBaseProvider().saveToken(token);
        DataBaseProvider().saveUserId(userId);
        DataBaseProvider().saveUserName(username);
        DataBaseProvider().getProfileId().then((value) {
          if (value == '') {
            Navigator.of(context!).push(
              CupertinoPageRoute(
                builder: (context) => const CreatUserProfile(),
              ),
            );
          } else {
            Navigator.of(context!).push(
              CupertinoPageRoute(
                builder: (context) => const AppLayout(),
              ),
            );
          }
        });
      } else {
        final req = json.decode(res.body);
        _isLoading = false;
        _reqMessage = req['status'];
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
      _reqMessage = 'please try again';
      _color = const Color(0xfff33225);
      notifyListeners();
      print(e);
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

    try {
      var res = http.MultipartRequest('POST', Uri.parse(url));

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
      final imageStream = http.ByteStream.castFrom(pickedFileToFile.openRead());
      final lenght = await pickedFileToFile.length();
      final imageUpload = http.MultipartFile(
          'profile_picture', imageStream, lenght,
          filename:  (pickedFileToFile.path));
      res.files.add(imageUpload);
      var response = await res.send();
      if (response.statusCode == 201 || response.statusCode == 200) {
        // final req = json.decode(res);
        _isLoading = false;
        _reqMessage = 'Profile Created Successfully';
        _color = const Color.fromARGB(255, 15, 175, 20);
        DataBaseProvider().saveProfileId(phone);
        notifyListeners();
        UserDetails().getUserAccountDetails();
      } else {
        _isLoading = false;
        _reqMessage = 'Error Creating Profile ${response.statusCode}';
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
    notifyListeners();
  }
}
