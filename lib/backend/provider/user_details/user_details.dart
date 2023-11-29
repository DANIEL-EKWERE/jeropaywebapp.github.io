import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:databank/backend/constant.dart';
import 'package:flutter/material.dart';

import '../database/db_provider.dart';

class UserDetails extends ChangeNotifier {
  static String baseUrl = AppUrl.baseUrl;
  String? image;
  // setter
  bool _isLoading = false;
  String _reqMessage = '';
  String _balance = "no network";
  Color? _color;

  // getter
  bool get isLoading => _isLoading;
  String get reqMessage => _reqMessage;
  String get balance => _balance;
  Color? get color => _color;

  Future<String> getUserAccountBalanace() async {
    print('calling balance');
    _isLoading = true;
    notifyListeners();
    final String url = '$baseUrl/admin/wallet-per-user/';
    notifyListeners();
    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    print(access);

    try {
      http.Response request =
          await http.get(Uri.parse(url), headers: reqHeader);
      print(request.statusCode);
      if (request.statusCode == 200) {
        final resp = json.decode(request.body);
        final balance = resp['balance'].toString();
        print(balance);
        _isLoading = false;
        _reqMessage = 'wallet Retrieved and Refreshed';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
        return balance;
      } else {
        //  final resp = json.decode(request.body);
        _isLoading = false;
        _reqMessage = 'something went wrong';
        _color = const Color(0xfff33225);
        notifyListeners();
        return balance;
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      _color = const Color(0xfff33225);
      notifyListeners();
      return _balance;
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'error $e';
      _color = const Color(0xfff33225);
      notifyListeners();
      return _balance;
    }
  }

// {
//     "status": 200,
//     "response body": {
//         "status": true,
//         "service": "CREATE_VIRTUAL_ACCOUNT",
//         "business": "064A4A647B0E4C3D8D83F68985FA31A9",
//         "banks": [
//             {
//                 "bankCode": "120001",
//                 "bankName": "9Payment Service Bank",
//                 "accountNumber": "5121627127",
//                 "accountName": "DATABANK-Daniel Ekwere",
//                 "trackingReference": "UBKJ41WDPH42F823079YVD35"
//             }
//         ]
//     }
// }

  Future getUserAccountDetails() async {
    print('calling acct details method');
    String url = '$baseUrl/reserve-acct-for-user/';
    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };
    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        final req = json.decode(response.body);
        final x = req['response body']!['banks'][0];
        final bankName = x['bankName'];
        final accountNumber = x['accountNumber'];
        final accountName = x['accountName'];

        DataBaseProvider().saveAcctName(accountName);
        DataBaseProvider().saveAcctNumber(accountNumber);
        DataBaseProvider().saveBankName(bankName);
        _reqMessage = 'generated vitual account';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
      } else {
        _reqMessage =
            'unable to generate vitual account ${response.statusCode}';
        _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _reqMessage = 'internet connection not available';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _reqMessage = 'an error occurred $e';
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<String> getUserProfileImage() async {
    try {
      final access = await DataBaseProvider().getToken();
      Map<String, String>? reqHeader = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access',
      };
      final url = '$baseUrl/user/create/profile/';
      http.Response request =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (request.statusCode == 200 || request == 201) {
        final res = json.decode(request.body);
        image = res['profileImage'];
        DataBaseProvider().saveProfileImage(File(image!));

        notifyListeners();
       // return image!;
      } else {
        throw Exception('Failed to load data ${request.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data ${e.toString()} ');
    }
     return image!;
  }

  Future<bool> createOrUpdateDeviceTokenAndPlatform(
      {required platform, required token, BuildContext? context}) async {
    print('calling sending device token and platform method');
    String url = '$baseUrl/fcm-connector/';
    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };
    final body = {
      'Device id': platform,
      'Device type': token,
    };
    try {
      print(
          'calling sending device token and platform method - in the try block');
      http.Response response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
            'calling sending device token and platform method - codes executed successfully');
        _reqMessage = 'token and device retrieved';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
        return true;
      } else {
        print(
            'calling sending device token and platform method - somwthing went wrong');
        _reqMessage = 'token and device not retrieved';
        _color = const Color(0xfff33225);
        notifyListeners();
        return false;
      }
    } on SocketException catch (_) {
      print(
          'calling sending device token and platform method - networks issues');
      _reqMessage = 'internet connetion not available';
      _color = const Color(0xfff33225);
      notifyListeners();
      return false;
    } catch (e) {
      print('calling sending device token and platform method - catch block');
      _reqMessage = 'An error Occurred (TandD) $e';
      _color = const Color(0xfff33225);
      notifyListeners();
      return false;
    }
  }

  void clear() {
    _reqMessage = '';
    _color = null;
    notifyListeners();
  }
}
