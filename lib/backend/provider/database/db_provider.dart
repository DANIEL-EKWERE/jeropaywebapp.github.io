import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../views/onboarding_page.dart';

class DataBaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  String _token = '';

  String _userName = '';

  String _userId = '';

  String _profileId = '';

  String _acctName = '';

  String _acctNumber = '';

  String _bankName = '';

  String _profileImage = '';

  String _phone = '';

  String get token => _token;

  String get userName => _userName;

  String get userId => _userId;

  String get profileId => _profileId;

  String get acctNumber => _acctNumber;

  String get acctName => _acctName;

  String get bankName => _bankName;

  String get profileImage => _profileImage;

  String get phone => _phone;

  void saveToken(String token) async {
    SharedPreferences value = await _pref;
    value.setString('token', token);
  }

  void saveUserName(String userName) async {
    SharedPreferences value = await _pref;
    value.setString('userName', userName);
  }

  void saveUserId(String userId) async {
    SharedPreferences value = await _pref;
    value.setString('userId', userId);
  }

  Future saveProfileId(String profileId) async {
    SharedPreferences value = await _pref;
    value.setString('profileId', profileId);
  }

  void saveAcctNumber(String acctNumber) async {
    SharedPreferences value = await _pref;
    value.setString('acctNumber', acctNumber);
  }

  void saveAcctName(String acctName) async {
    SharedPreferences value = await _pref;
    value.setString('acctName', acctName);
  }

  void saveBankName(String bankName) async {
    SharedPreferences value = await _pref;
    value.setString('bankName', bankName);
  }

  void saveProfileImage(File? image) async {
    SharedPreferences value = await _pref;
    value.setString('image', image as String);
  }


   void savePhoneNumber(String phone) async {
    SharedPreferences value = await _pref;
    value.setString('phone', phone);
  }

  Future<String> getToken() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

   Future<String> getPhone() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('phone')) {
      String data = value.getString('phone')!;
      _phone= data;
      notifyListeners();
      return data;
    } else {
      _phone = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserId() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('userId')) {
      String data = value.getString('userId')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserName() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('userName')) {
      String data = value.getString('userName')!;
      _userName = data;
      notifyListeners();
      return data;
    } else {
      _userName = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getProfileId() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('profileId')) {
      String data = value.getString('profileId')!;
      _profileId = data;
      notifyListeners();
      return data;
    } else {
      _profileId = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getAcctNumber() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('acctNumber')) {
      String data = value.getString('acctNumber')!;
      _acctNumber = data;
      notifyListeners();
      return data;
    } else {
      _acctNumber = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getAcctName() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('acctName')) {
      String data = value.getString('acctName')!;
      _acctName = data;
      notifyListeners();
      return data;
    } else {
      _acctName = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getBankName() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('bankName')) {
      String data = value.getString('bankName')!;
      _bankName = data;
      notifyListeners();
      return data;
    } else {
      _bankName = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getProfileImage() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('image')) {
      String data = value.getString('image')!;
      _profileImage = data;
      notifyListeners();
      return data;
    } else {
      _profileImage = '';
      notifyListeners();
      return '';
    }
  }

  void logOut(BuildContext? context) async {
    final value = await _pref;
    value.clear();
    notifyListeners();
    Navigator.of(context!).push(
      CupertinoPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }
}
