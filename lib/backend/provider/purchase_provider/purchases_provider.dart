import 'dart:convert';
import 'dart:io';
import 'package:databank/backend/models/api_models.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/views/log_in.dart';
import 'package:databank/widget/receipt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:databank/backend/constant.dart';
import 'package:flutter/cupertino.dart';

// 923cdea0-feec-4e3a-9e2e-e0edc76c8aec giting mtn
class PurchaseProvider extends ChangeNotifier {
  final baseUrl = AppUrl.baseUrl;

// setters

  String _reqMessage = '';
  bool _isLoading = false;
  Color? _color;

  // getter

  String get regMessage => _reqMessage;
  bool get isLoading => _isLoading;
  Color? get color => _color;
  // Message message = Message(amount: '',id: '', dateAndTime: DateTime.now(),detail: '', oldBalance: '',newBalance:'',phoneNumber: '',status: '',type:'');
  AirtimePurchaseModel airtimePurchaseModel = AirtimePurchaseModel(
      data: Data(
          id: '',
          detail: '',
          dateAndTime: DateTime.now(),
          oldBalance: '',
          newBalance: '',
          phoneNumber: '',
          status: '',
          type: '',
          amount: ''),
      status: '');

  DataPurchaseModel dataPurchaseModel = DataPurchaseModel(
    status: '',
    message: Message(
        amount: '',
        id: '',
        dateAndTime: '',
        detail: '',
        oldBalance: '',
        newBalance: '',
        phoneNumber: '',
        status: '',
        type: ''),
  );
  get dateAndTime => null;
  Future<void> PurchaseData(
      {required String dataId,
      required String phone_number,
      required BuildContext? context}) async {
    String url = '$baseUrl/purchase/data/$dataId/';
    _isLoading = true;
    notifyListeners();
    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };
    print(dataId);
    final body = {
      'phone_number': phone_number,
    };

    try {
      http.Response response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);
      if (response.statusCode == 200 || response.statusCode == 201) {
        _isLoading = false;
        var res = json.decode(response.body);
        print(res);
        print(response.statusCode);
        dataPurchaseModel = dataPurchaseModelFromJson(response.body);
        _reqMessage = 'your purchase was successful';
        print(dataPurchaseModel);
        _color = const Color.fromARGB(255, 15, 175, 20);
        // showModalBottomSheet(
        //     showDragHandle: true,
        //     isDismissible: false,
        //     isScrollControlled: true,
        //     // anchorPoint: const Offset(5, 50),
        //     useSafeArea: true,
        //     context: context!,
        //     builder: (context) => Receipt(
        //           details: dataPurchaseModel.message.detail,
        //           date_and_time: dataPurchaseModel.message.dateAndTime,
        //           old_balance: dataPurchaseModel.message.oldBalance,
        //           new_balance: dataPurchaseModel.message.newBalance,
        //           phone_number: dataPurchaseModel.message.phoneNumber,
        //           status: dataPurchaseModel.message.status,
        //           type: dataPurchaseModel.message.type,
        //           amout: dataPurchaseModel.message.amount,
        //         ));

        showModalBottomSheet(
            showDragHandle: true,
            isDismissible: false,
            isScrollControlled: true,
            useSafeArea: true,
            context: context!,
            builder: (context) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 50,
                      // color:
                      //     kYellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Transaction Receipt'),
                          Divider(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Details:'),
                                FittedBox(
                                    child: Text(
                                  dataPurchaseModel.message.detail,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              1.5,
                                      fontWeight: FontWeight.bold),
                                ))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Date and Time:'),
                                Text(
                                    dataPurchaseModel.message.dateAndTime)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Old Balance:'),
                                Text(dataPurchaseModel.message.oldBalance)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('New Balance:'),
                                Text(dataPurchaseModel.message.newBalance)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Phone:'),
                                Text(dataPurchaseModel.message.phoneNumber)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Status:'),
                                Text(dataPurchaseModel.message.status)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Amount:'),
                                Text(dataPurchaseModel.message.amount)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Type:'),
                                Text(dataPurchaseModel.message.type)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ));

        notifyListeners();
      } else if (response.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(response.body);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else if (response.statusCode == 404) {
        final res = json.decode(response.body);
        _isLoading = false;
        _reqMessage =
            '${res['details']['phone_number'][0]} ${response.statusCode}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      } else if (response.statusCode == 400) {
        final res = json.decode(response.body);
        _isLoading = false;
        _reqMessage = res['message']['error'][0];
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      } else {
        _isLoading = false;
        _reqMessage =
            'something went wrong ${response.statusCode} ${response.body}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available ';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = 'something went wrong $e';
      print(e);
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<void> AirtimePurchase(
      {required network,
      required amount,
      required phone_number,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/purchase/airtime/';
    notifyListeners();
    final body = {
      'network': network,
      'amount': amount,
      'phone_number': phone_number,
    };

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (request.statusCode == 200 || request.statusCode == 201) {
        _isLoading = false;
        airtimePurchaseModel = airtimePurchaseFromJson(request.body);
        _reqMessage = 'purchase successful';
        _color = const Color.fromARGB(255, 15, 175, 20);

        showModalBottomSheet(
            showDragHandle: true,
            isDismissible: false,
            isScrollControlled: true,
            useSafeArea: true,
            context: context!,
            builder: (context) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 50,
                      // color:
                      //     kYellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Transaction Receipt'),
                          Divider(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Details:'),
                                FittedBox(
                                    child: Text(
                                  airtimePurchaseModel.message!.details,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              1.5,
                                      fontWeight: FontWeight.bold),
                                ))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Date and Time:'),
                                Text(
                                    airtimePurchaseModel.message!.date_and_time)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Old Balance:'),
                                Text(airtimePurchaseModel.message!.old_balance)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('New Balance:'),
                                Text(airtimePurchaseModel.message!.new_balance)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Phone:'),
                                Text(airtimePurchaseModel.message!.phone_number)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Status:'),
                                Text(airtimePurchaseModel.message!.status)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Amount:'),
                                Text(airtimePurchaseModel.message!.amount)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Type:'),
                                Text(airtimePurchaseModel.message!.type)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ));

        // showModalBottomSheet(
        //     showDragHandle: true,
        //     isDismissible: false,
        //     isScrollControlled: true,
        //     // anchorPoint: const Offset(5, 50),
        //     useSafeArea: true,
        //     context: context!,
        //     builder: (context) => Receipt(
        //           details: airtimePurchaseModel.message!.details,
        //           date_and_time: airtimePurchaseModel.message!.date_and_time,
        //           old_balance: airtimePurchaseModel.message!.old_balance,
        //           new_balance: airtimePurchaseModel.message!.new_balance,
        //           phone_number: airtimePurchaseModel.message!.phone_number,
        //           status: airtimePurchaseModel.message!.status,
        //           type: airtimePurchaseModel.message!.type,
        //           amout: airtimePurchaseModel.message!.amount,
        //         ));

        notifyListeners();
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res['message']['error'][0];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else if (request.statusCode == 404) {
        final res = json.decode(request.body);
        _isLoading = false;
        _reqMessage = res['details']['phone_number'][0];
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      } else if (request.statusCode == 400) {
        final res = json.decode(request.body);
        _isLoading = false;
        _reqMessage = res['message']['error'][0];
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      } else {
        _isLoading = false;
        _reqMessage = 'something went wrong';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available ';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = "something went wrong $e";
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<void> electricSub(
      {required number,
      required type,
      required disco,
      required amount,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/electric-bill/purchase/';
    notifyListeners();
    final body = {
      'number': number,
      'type': type,
      'disco': disco,
      'amount': amount,
    };

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (request.statusCode == 200 || request.statusCode == 201) {
        _isLoading = false;
        final electricityPurchaseModel =
            ElectricSubscription.fromJson(json.decode(request.body));
        _reqMessage = 'purchase successful';
        _color = const Color.fromARGB(255, 15, 175, 20);

        showModalBottomSheet(
            showDragHandle: true,
            isDismissible: false,
            isScrollControlled: true,
            // anchorPoint: const Offset(5, 50),
            useSafeArea: true,
            context: context!,
            builder: (context) => Receipt(
                  details: electricityPurchaseModel.detail,
                  date_and_time: dateAndTime.toIso8601String(),
                  old_balance: electricityPurchaseModel.oldBalance,
                  new_balance: electricityPurchaseModel.newBalance,
                  phone_number: electricityPurchaseModel.phoneNumber,
                  status: electricityPurchaseModel.status,
                  type: electricityPurchaseModel.type,
                  amout: electricityPurchaseModel.amount,
                ));

        notifyListeners();
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else {
        _isLoading = false;
        _reqMessage = 'something went wrong ${request.statusCode}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available ';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = "something went wrong $e";
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<void> purchaseExamEPin(
      {required network,
      required examName,
      required quantity,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/purchase/exam-epin/';
    notifyListeners();
    final body = {
      'network,': network,
      'exam_name': examName,
      'quantity': quantity,
    };

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (request.statusCode == 200 || request.statusCode == 201) {
        _isLoading = false;
        final electricityPurchaseModel =
            ElectricSubscription.fromJson(json.decode(request.body));
        _reqMessage = 'E Pin purchase successful';
        _color = const Color.fromARGB(255, 15, 175, 20);

        showModalBottomSheet(
            showDragHandle: true,
            isDismissible: false,
            isScrollControlled: true,
            // anchorPoint: const Offset(5, 50),
            useSafeArea: true,
            context: context!,
            builder: (context) => Receipt(
                  details: electricityPurchaseModel.detail,
                  date_and_time: electricityPurchaseModel.date_and_time,
                  old_balance: electricityPurchaseModel.oldBalance,
                  new_balance: electricityPurchaseModel.newBalance,
                  phone_number: electricityPurchaseModel.phoneNumber,
                  status: electricityPurchaseModel.status,
                  type: electricityPurchaseModel.type,
                  amout: electricityPurchaseModel.amount,
                ));

        notifyListeners();
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else {
        _isLoading = false;
        _reqMessage = 'something went wrong ${request.statusCode}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available ';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = "something went wrong $e";
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<void> validateMeterNumber(
      {required number,
      required type,
      required disco,
      required amount,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/electric-bill/validate/';
    notifyListeners();
    final body = {
      'number': number,
      'type': type,
      'disco': disco,
    };

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (request.statusCode == 200 || request.statusCode == 201) {
        _isLoading = false;
        _reqMessage = 'validation successful';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();

        // call the electric sub function upoun validation

        electricSub(
            number: number,
            type: type,
            disco: disco,
            amount: amount,
            context: context);
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else {
        _isLoading = false;
        _reqMessage = 'something went wrong ${request.statusCode}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available ';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = "something went wrong $e";
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<void> cableSub(
      {required String iuc,
      required String cableProvider,
      required String cableUuid,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/cable-subscription/purchase/$cableUuid/';
    notifyListeners();
    final body = {
      'iuc': iuc,
      'cable_provider': cableProvider,
    };

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (request.statusCode == 200 || request.statusCode == 201) {
        _isLoading = false;
        final cablePurchaseModel =
            ElectricSubscription.fromJson(json.decode(request.body));
        _reqMessage = 'cable purchase successful';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();
        showModalBottomSheet(
            showDragHandle: true,
            isDismissible: false,
            isScrollControlled: true,
            // anchorPoint: const Offset(5, 50),
            useSafeArea: true,
            context: context!,
            builder: (context) => Receipt(
                  details: cablePurchaseModel.detail,
                  date_and_time: cablePurchaseModel.date_and_time,
                  old_balance: cablePurchaseModel.oldBalance,
                  new_balance: cablePurchaseModel.newBalance,
                  phone_number: cablePurchaseModel.phoneNumber,
                  status: cablePurchaseModel.status,
                  type: cablePurchaseModel.type,
                  amout: cablePurchaseModel.amount,
                ));

        notifyListeners();
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else {
        _isLoading = false;
        _reqMessage = 'something went wrong ${request.statusCode}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = "something went wrong $e";
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  Future<void> validateCableNumber(
      {required String iuc,
      required String cableProvider,
      required String cableUuid,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/cable-subscription/validate/';
    notifyListeners();
    final body = {
      'iuc': iuc,
      'cable_provider': cableProvider,
    };

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);

      if (request.statusCode == 200 || request.statusCode == 201) {
        _isLoading = false;
        _reqMessage =
            'cable number validation successful proceeding to payment';
        _color = const Color.fromARGB(255, 15, 175, 20);
        notifyListeners();

// call the cable subscription function upon validation

        cableSub(
            iuc: iuc,
            cableProvider: cableProvider,
            cableUuid: cableUuid,
            context: context);
      } else if (request.statusCode == 401) {
        _isLoading = false;
        final res = json.decode(request.body);
        _reqMessage = res['message'];
        _color = const Color(0xfff33225);
        notifyListeners();
        showDialog<bool>(
            context: context!,
            builder: (context) {
              return AlertDialog(
                title: const Text('Login'),
                content: const Text('Session Expired, login to continue!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      } else {
        _isLoading = false;
        _reqMessage = 'something went wrong ${request.statusCode}';
        _color = _color = const Color(0xfff33225);
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _reqMessage = 'internet connection is not available ';
      _color = const Color(0xfff33225);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _reqMessage = "something went wrong $e";
      _color = const Color(0xfff33225);
      notifyListeners();
    }
  }

  void clear() {
    _reqMessage = '';
    notifyListeners();
  }
}
