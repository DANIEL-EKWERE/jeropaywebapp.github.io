import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  String _transactionPin = '';

  String _confirmTransactionPin = '';

  String _recommended_by = '';

  String _reqMessage = '';

  Color? _color;

  bool _isLoading = false;

  String _token = '';

  String _location = '';


  String _state = '';

  String _userName = '';

  String _userId = '';

  String _profileId = '';

  String _acctName = '';

  String _acctNumber = '';

  String _bankName = '';

  String _profileImage = '';

  String _phone = '';

  String _email = '';

  String _first_name = '';

  String _last_name = '';

  String get recommended_by => _recommended_by;

  String get token => _token;

  String get location => _location;

  String get state => _state;

  String get userName => _userName;

  String get userId => _userId;

  String get profileId => _profileId;

  String get acctNumber => _acctNumber;

  String get acctName => _acctName;

  String get bankName => _bankName;

  String get profileImage => _profileImage;

  String get phone => _phone;

  String get email => _email;

  String get first_name => _first_name;

  String get last_name => _last_name;

  bool get isLoading => _isLoading;

  Color? get color => _color;

  String get reqMessage => _reqMessage;

  String get transactionPin => _transactionPin;

  String get confirmTransactionPin => _confirmTransactionPin;

  void saveToken(String token) async {
    SharedPreferences value = await _pref;
    value.setString('token', token);
  }

  Future<bool> saveTransactionPin(String transactionPin) async {
    SharedPreferences value = await _pref;
    if (await value.setString('transactionPin', transactionPin)) {
      return true;
    }
    return false;
  }

  void saveRecommendedBy(String recommended_by) async {
    SharedPreferences value = await _pref;
    value.setString('recommended_by', recommended_by);
  }

  void saveLocation(String location) async {
    SharedPreferences value = await _pref;
    value.setString('location', location);
  }

  void saveState(String state) async {
    SharedPreferences value = await _pref;
    value.setString('state', state);
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

  void saveEmail(String email) async {
    SharedPreferences value = await _pref;
    value.setString('email', email);
  }

  void saveFirstName(String first_name) async {
    SharedPreferences value = await _pref;
    value.setString('first_name', first_name);
  }

  void saveLastName(String last_name) async {
    SharedPreferences value = await _pref;
    value.setString('last_name', last_name);
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

  Future<String> getTransactionPin() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('transactionPin')) {
      String data = value.getString('transactionPin')!;
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
      _phone = data;
      notifyListeners();
      return data;
    } else {
      _phone = '';
      notifyListeners();
      return '';
    }
  }


  Future<String> getLocation() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('location')) {
      String data = value.getString('location')!;
      _phone = data;
      notifyListeners();
      return data;
    } else {
      _phone = '';
      notifyListeners();
      return '';
    }
  }


  Future<String> getState() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('state')) {
      String data = value.getString('state')!;
      _phone = data;
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

  Future<String> getRecommendedBy() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('recommended_by')) {
      String data = value.getString('recommended_by')!;
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

  Future<String> getEmail() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('email')) {
      String data = value.getString('email')!;
      _email = data;
      notifyListeners();
      return data;
    } else {
      _email = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getFirstName() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('first_name')) {
      String data = value.getString('first_name')!;
      _first_name = data;
      notifyListeners();
      return data;
    } else {
      _first_name = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getLastName() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('last_name')) {
      String data = value.getString('last_name')!;
      _profileImage = data;
      notifyListeners();
      return data;
    } else {
      _profileImage = '';
      notifyListeners();
      return '';
    }
  }

  Future updateUserP(BuildContext? context) async {
    _isLoading = true;
    notifyListeners();
    final value = await _pref;
    value.clear();
    notifyListeners();
    _isLoading = false;
    _reqMessage = 'Log Out Successfull';
    _color = _color = const Color.fromARGB(255, 15, 175, 20);
    notifyListeners();
    // Navigator.of(context!)
    //     .pushNamedAndRemoveUntil("/OnboardingPage", (route) => false);
  }

  Future logOut(BuildContext? context) async {
    _isLoading = true;
    notifyListeners();
    final value = await _pref;
    value.clear();
    notifyListeners();
    _isLoading = false;
    _reqMessage = 'Log Out Successfull';
    _color = _color = const Color.fromARGB(255, 15, 175, 20);
    notifyListeners();
    Navigator.of(context!)
        .pushNamedAndRemoveUntil("/OnboardingPage", (route) => false);
  }

  void clear() {
    _reqMessage = '';
    _color = null;
    notifyListeners();
  }
}
