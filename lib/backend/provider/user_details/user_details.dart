import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:databank/backend/constant.dart';
import 'package:flutter/material.dart';

import '../database/db_provider.dart';

class UserDetails extends ChangeNotifier {
  static String baseUrl = AppUrl.baseUrl;

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
        final bankName = req['bankName'];
        final accountNumber = req['accountNumber'];
        final accountName = req['accountName'];

        DataBaseProvider().saveAcctName(accountName);
        DataBaseProvider().saveAcctNumber(accountNumber);
        DataBaseProvider().saveBankName(bankName);
        _reqMessage = 'generated vitual account';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
      } else {
        _reqMessage = 'unable to generate vitual account ${response.statusCode}';
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

  Future<bool> createOrUpdateDeviceTokenAndPlatform(
      {required platform, required token, BuildContext? context}) async {
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
      http.Response response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (response.statusCode == 200) {
        _reqMessage = 'token and device retrieved';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
        return true;
      } else {
        _reqMessage = 'token and device not retrieved';
        _color = const Color(0xfff33225);
        notifyListeners();
        return false;
      }
    } on SocketException catch (_) {
      _reqMessage = 'internet connetion not available';
      _color = const Color(0xfff33225);
      notifyListeners();
      return false;
    } catch (e) {
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
