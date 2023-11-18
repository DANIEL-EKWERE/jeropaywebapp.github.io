import 'dart:convert';
import 'dart:io';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/widget/receipt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:databank/backend/constant.dart';
import 'package:flutter/cupertino.dart';

import '../../models/api_models.dart';

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

    final body = {
      'phone_number': phone_number,
    };

    try {
      http.Response req = await http.post(Uri.parse(url),
          body: json.encode(body), headers: reqHeader);
      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        final res = json.decode(req.body);
        final dataPurchaseModel = DataPurchase.fromJson(res);
        _reqMessage = 'your purchase was successful';
        _color = const Color.fromARGB(255, 15, 175, 20);
        showModalBottomSheet(
            showDragHandle: true,
            isDismissible: false,
            isScrollControlled: true,
            // anchorPoint: const Offset(5, 50),
            useSafeArea: true,
            context: context!,
            builder: (context) => Receipt(
                  details: dataPurchaseModel.message!.details,
                  date_and_time: dataPurchaseModel.message!.date_and_time,
                  old_balance: dataPurchaseModel.message!.old_balance,
                  new_balance: dataPurchaseModel.message!.new_balance,
                  phone_number: dataPurchaseModel.message!.phone_number,
                  status: dataPurchaseModel.message!.status,
                  type: dataPurchaseModel.message!.type,
                  amout: dataPurchaseModel.message!.amount,
                ));

        notifyListeners();
      } else {
        _isLoading = false;
        final res = json.decode(req.body);
        final dataPurchaseModel = DataPurchase.fromJson(res);
        _reqMessage = dataPurchaseModel.message.toString();
        _color = const Color(0xfff33225);
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
        final airtimePurchaseModel =
            DataPurchase.fromJson(json.decode(request.body));
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
                  details: airtimePurchaseModel.message!.details,
                  date_and_time: airtimePurchaseModel.message!.date_and_time,
                  old_balance: airtimePurchaseModel.message!.old_balance,
                  new_balance: airtimePurchaseModel.message!.new_balance,
                  phone_number: airtimePurchaseModel.message!.phone_number,
                  status: airtimePurchaseModel.message!.status,
                  type: airtimePurchaseModel.message!.type,
                  amout: airtimePurchaseModel.message!.amount,
                ));

        notifyListeners();
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
            DataPurchase.fromJson(json.decode(request.body));
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
                  details: electricityPurchaseModel.message!.details,
                  date_and_time:
                      electricityPurchaseModel.message!.date_and_time,
                  old_balance: electricityPurchaseModel.message!.old_balance,
                  new_balance: electricityPurchaseModel.message!.new_balance,
                  phone_number: electricityPurchaseModel.message!.phone_number,
                  status: electricityPurchaseModel.message!.status,
                  type: electricityPurchaseModel.message!.type,
                  amout: electricityPurchaseModel.message!.amount,
                ));

        notifyListeners();
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
      required exam_name,
      required quantity,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/purchase/exam-epin/';
    notifyListeners();
    final body = {
      'network,': network,
      'exam_name': exam_name,
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
            DataPurchase.fromJson(json.decode(request.body));
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
                  details: electricityPurchaseModel.message!.details,
                  date_and_time:
                      electricityPurchaseModel.message!.date_and_time,
                  old_balance: electricityPurchaseModel.message!.old_balance,
                  new_balance: electricityPurchaseModel.message!.new_balance,
                  phone_number: electricityPurchaseModel.message!.phone_number,
                  status: electricityPurchaseModel.message!.status,
                  type: electricityPurchaseModel.message!.type,
                  amout: electricityPurchaseModel.message!.amount,
                ));

        notifyListeners();
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
      required String cable_provider,
      required String cable_uuid,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/cable-subscription/purchase/$cable_uuid/';
    notifyListeners();
    final body = {
      'iuc': iuc,
      'cable_provider': cable_provider,
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
            DataPurchase.fromJson(json.decode(request.body));
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
                  details: cablePurchaseModel.message!.details,
                  date_and_time: cablePurchaseModel.message!.date_and_time,
                  old_balance: cablePurchaseModel.message!.old_balance,
                  new_balance: cablePurchaseModel.message!.new_balance,
                  phone_number: cablePurchaseModel.message!.phone_number,
                  status: cablePurchaseModel.message!.status,
                  type: cablePurchaseModel.message!.type,
                  amout: cablePurchaseModel.message!.amount,
                ));

        notifyListeners();
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

  Future<void> validateCableNumber(
      {required String iuc,
      required String cable_provider,
      required String cable_uuid,
      required BuildContext? context}) async {
    _isLoading = true;
    String url = '$baseUrl/cable-subscription/validate/';
    notifyListeners();
    final body = {
      'iuc': iuc,
      'cable_provider': cable_provider,
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
            cable_provider: cable_provider,
            cable_uuid: cable_uuid,
            context: context);
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
