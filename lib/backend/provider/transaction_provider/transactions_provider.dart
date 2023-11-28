import 'dart:io';
import 'dart:convert';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:http/http.dart' as http;
import 'package:databank/backend/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:databank/backend/models/api_models.dart';

class TransactionsProvider extends ChangeNotifier {
  String baseUrl = AppUrl.baseUrl;

  // setter
  List<AllTransactions> _transactions = [];
  bool _isLoading = false;
  String _reqMessage = '';

  // getter
List<AllTransactions> get transactions => _transactions;
  bool get isLoading => _isLoading;
  String get reqMessage => _reqMessage;




void updateTransactions(List<AllTransactions> newTransactions) {
    _transactions = newTransactions;
    notifyListeners();
  }






void fetchTransactionsFromAPI({required String selectedDate}) async {
    String url = '$baseUrl/transactions/$selectedDate/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        print(response.body);
        final lastMonthTransac = json.decode(response.body);
        print(lastMonthTransac);
        _reqMessage = lastMonthTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }












  void allTransactions() async {
    String url = '$baseUrl/transactions/all/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'all transaction retrieved';
        print(response.body);
        final allTransac = json.decode(response.body);
        final allTransactions = allTransactionsFromJson(allTransac);
        print(allTransac);
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading history ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void singleTransactions({required String trans_uuid}) async {
    String url = '$baseUrl/transaction/$trans_uuid/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        print(response.body);
        final singleTransac = json.decode(response.body);
        print(singleTransac);
        _reqMessage = singleTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void todayTransactions() async {
    String url = '$baseUrl/transactions/today/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        final todayTransac = json.decode(response.body);
        _reqMessage = todayTransac['status'];
        print(response.body);
        print(todayTransac);
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void yesterdayTransactions() async {
    String url = '$baseUrl/transactions/yesterday/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;

        print(response.body);
        final yesTransac = json.decode(response.body);
        print(yesTransac);
        _reqMessage = yesTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void lastWeekTransactions() async {
    String url = '$baseUrl/transactions/last-week/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        print(response.body);
        final lastWeekTransac = json.decode(response.body);
        print(lastWeekTransac);
        _reqMessage = lastWeekTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void thisWeekTransactions() async {
    String url = '$baseUrl/transactions/this-week/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        print(response.body);
        final thisWeekTransac = json.decode(response.body);
        print(thisWeekTransac);
        _reqMessage = thisWeekTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void lastMonthTransactions({required String trans_uuid}) async {
    String url = '$baseUrl/transactions/last-month/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        print(response.body);
        final lastMonthTransac = json.decode(response.body);
        print(lastMonthTransac);
        _reqMessage = lastMonthTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void thisMonthTransactions({required String trans_uuid}) async {
    String url = '$baseUrl/transactions/this-month/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        print(response.body);
        final thisMonthTransac = json.decode(response.body);
        print(thisMonthTransac);
        _reqMessage = thisMonthTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void byRangeTransactions(
      {required String start_date, required String end_date}) async {
    String url = '$baseUrl/transactions/$start_date/$end_date/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        print(response.body);
        final byRangeTransac = json.decode(response.body);
        print(byRangeTransac);
        _isLoading = byRangeTransac['status'];
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }

  void filterPhoneNumberFromTransactions() async {
    String url = '$baseUrl/transactions/phone-numbers/';
    _isLoading = true;
    notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        _isLoading = false;
        _reqMessage = 'transaction retrieved';
        List<dynamic> phoneList = [];
        print(response.body);
        phoneList = json.decode(response.body) as List;
        print(phoneList);
        notifyListeners();
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
    }
  }
}
