import 'dart:io';
import 'dart:convert';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/widget/receipt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:databank/backend/constant.dart';
import 'package:databank/views/transaction_details_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:databank/backend/models/api_models.dart';

class TransactionsProvider extends ChangeNotifier {
  String baseUrl = AppUrl.baseUrl;
  // List<AllTransactions>? allTransactions;
  AllTransactions2 allTran2 =
      AllTransactions2(status: '', totalAmount: 0.0, data: []);

  AllTransactions2 allTran =
      AllTransactions2(status: '', totalAmount: 0.0, data: []);
  // setter
  List<Datum2> _transactions = [];

  List<Datum2> get transaction => _transactions;
  bool _isLoading = false;
  String _reqMessage = '';
  AllTransactions2 allTransac =
      AllTransactions2(status: '', totalAmount: 0.0, data: []);
  SingleTransaction singleTransaction = SingleTransaction(
    status: '',
    data: Data1(
        id: '',
        detail: '',
        dateAndTime: '',
        oldBalance: '',
        newBalance: '',
        phoneNumber: '',
        status: '',
        type: '',
        amount: ''),
  );

  RecentTransactions recentTransacts =
      RecentTransactions(status: '', transactions: []);

  // getter
  // List<Datum1> get transactions => _transactions;
  bool get isLoading => _isLoading;
  String get reqMessage => _reqMessage;

  void updateTransactions(List<Datum2> newTransactions) {
    _transactions = newTransactions;
    print(_transactions);
    notifyListeners();
  }

// TODO: the code below is what am using for my transaction history

  Future<AllTransactions2> fetchTransactionsFromAPI(
      {required String selectedDate}) async {
    print('calling transactions');
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
        print('the whole body ${response.body}');
        final allTransac = json.decode(response.body);
        print('======================');
        print('NOT FROM MODEL $allTransac');
        final lastMonthTransac = json.decode(response.body);
        print('NOT FROM MODEL 2 $lastMonthTransac');
        print('======================');
        AllTransactions2 allTransactions =
            allTransactionsFromJson2(response.body);
        print('======================');
        print(allTransactions.data);
        print('FROM MODEL $allTransactions');
        print(allTransactions.status);
        _reqMessage = lastMonthTransac['status'];
        notifyListeners();
        return allTransactions;
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
        // return allTransactions;
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
      throw Exception('Failed to make the request: $e');
    }

    throw Exception('Failed to load data');
  }

// TODO: the code above is what am using for my transaction history

  Future<RecentTransactions> recentTransactions() async {
    print('callimg recent');
    print('calling recent transactions');
    String url = '$baseUrl/Recent-transactions/';
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
        final responseBody = jsonDecode(response.body);
        print('from models===== $responseBody');
        recentTransacts = RecentTransactions.fromJson(responseBody);
        print('not from models===== $recentTransacts');
        _reqMessage = responseBody['status'];
        print(recentTransacts.status);
        notifyListeners();
        return recentTransacts;
      } else {
        print(response.body);
        _isLoading = false;
        _reqMessage = 'error loading this receipt ${response.statusCode}';
        notifyListeners();
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'An Error Occured $e';
      throw Exception('Failed to make the request: $e');
    }

    throw Exception('Failed to load data');
  }

  void allTransaction() async {
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
        final allTransactions = allTransactionsFromJson2(allTransac);
        print(allTransac);
        print(allTransactions);
        // showModalBottomSheet(
        //     showDragHandle: true,
        //     isDismissible: false,
        //     isScrollControlled: true,
        //     // anchorPoint: const Offset(5, 50),
        //     useSafeArea: true,
        //     context: context!,
        //     builder: (context) => Receipt(
        //           details: allTransactions.detail,
        //           date_and_time: dateAndTime.toIso8601String(),
        //           old_balance: allTransactions.oldBalance,
        //           new_balance: allTransactions.newBalance,
        //           phone_number: allTransactions.phoneNumber,
        //           status: allTransactions.status,
        //           type: allTransactions.type,
        //           amout: allTransactions.amount,
        //         ));
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

  Future<SingleTransaction> singleTransactions(
      {required String trans_uuid, required BuildContext? context}) async {
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
        // print(response.body);
        final jsonString = json.decode(response.body);
        print(jsonString);
        singleTransaction = singleTransactionFromJson(response.body);
        _reqMessage = jsonString['status'];
 
        _reqMessage = singleTransaction.status;


        Navigator.push(
                                                                  context!,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            TransactionDetailsScreen(
                                                                      singleTransaction:
                                                                          singleTransaction,
                                                                    ),
                                                                  ),
                                                                );
        // Navigator.of(context!).push(
        //                 CupertinoPageRoute(
        //                   builder: (context) =>  Receipt(details: singleTransaction.data.detail,date_and_time: singleTransaction.data.dateAndTime,old_balance: singleTransaction.data.oldBalance,new_balance: singleTransaction.data.newBalance,amout: singleTransaction.data.amount,phone_number: singleTransaction.data.phoneNumber,status: singleTransaction.data.status,type: singleTransaction.data.type,),
        //                 ),
        //               );
        // showModalBottomSheet(
        //     showDragHandle: true,
        //     isDismissible: false,
        //     isScrollControlled: true,

        //     // anchorPoint: const Offset(5, 50),
        //     useSafeArea: true,
        //     context: context!,
        //     builder: (context) => SingleChildScrollView(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 20),
        //             child: Container(
        //               width: double.infinity,
        //               height: MediaQuery.of(context).size.height * 40,
        //               // color:
        //               //     kYellow,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text('Transaction Receipt'),
        //                   Divider(),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Details:'),
        //                         FittedBox(
        //                             child: Text(
        //                           singleTransaction.data.detail,
        //                           style: TextStyle(
        //                               fontSize:
        //                                   MediaQuery.of(context).size.width *
        //                                       1.5,
        //                               fontWeight: FontWeight.bold),
        //                         ))
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Date and Time:'),
        //                         Text(singleTransaction.data.dateAndTime)
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Old Balance:'),
        //                         Text(singleTransaction.data.oldBalance)
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('New Balance:'),
        //                         Text(singleTransaction.data.newBalance)
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Phone:'),
        //                         Text(singleTransaction.data.phoneNumber)
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Status:'),
        //                         Text(singleTransaction.data.status)
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Amount:'),
        //                         Text(singleTransaction.data.amount)
        //                       ]),
        //                   Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         const Text('Type:'),
        //                         Text(singleTransaction.data.type)
        //                       ]),
        //                 ],
        //               ),

        //             ),
        //           ),
        //         ));

        notifyListeners();

        showModalBottomSheet(
            context: context!,
            builder: (context) => Container(color: Colors.red));
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
    return singleTransaction;
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

  void clear() {
    _reqMessage = '';

    notifyListeners();
  }
}
