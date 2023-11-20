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
  double _balance = 0.0;
  Color? _color;

  // getter
  bool get isLoading => _isLoading;
  String get reqMessage => _reqMessage;
  double get balance => _balance;
  Color? get color => _color;

  Future getUserAccountBalanace() async {
    _isLoading = false;
    final String url = '$baseUrl/admin/wallet-per-user/';
    notifyListeners();
    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (request.statusCode == 200) {
        final resp = json.decode(request.body);
        final balance = resp['balance'];
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

  void getUserAccountDetails() async {
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
        _reqMessage = 'unable to generate vitual account';
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

  void createOrUpdateDeviceTokenAndPlatform(
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
      }
    } on SocketException catch (_) {
      _reqMessage = 'internet connetion not available';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _reqMessage = 'An error Occurred (TandD) $e';
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }
}