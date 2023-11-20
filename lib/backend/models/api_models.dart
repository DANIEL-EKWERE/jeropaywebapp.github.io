// import 'package:meta/meta.dart';
import 'dart:convert';
// FOR LISTING ALL TRANSACTIONS

// {
//     "status": "success",
//     "total_amount": 1587.0,
//     "data": [
//         {
//             "id": "9a6d150c-2615-448c-8caa-0d75ac7ff0a4",
//             "detail": "You have purchased 200.00 airtime from MTN",
//             "date_and_time": "Oct. 27, 2023",
//             "old_balance": "7613.00",
//             "new_balance": "7413.00",
//             "phone_number": "07012345678",
//             "status": "Success",
//             "amount": "200.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "f5489dd1-6181-44d9-8263-c66d72c3d4c3",
//             "detail": "You have purchased 2GB Data from MTN",
//             "date_and_time": "Oct. 27, 2023",
//             "old_balance": "8073.00",
//             "new_balance": "7613.00",
//             "phone_number": "07013116710",
//             "status": "Success",
//             "amount": "460.00",
//             "type": "Data"
//         },
//         {
//             "id": "a4243260-8b98-47c3-a304-f2ec43be5449",
//             "detail": "You have purchased 100.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "673.00",
//             "new_balance": "573.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "100.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "07c8ea40-169a-4a81-89dd-7228a5e2115e",
//             "detail": "You have purchased 100.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "773.00",
//             "new_balance": "673.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "100.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "bf841c01-2070-4f89-a15c-d6ca9aca0198",
//             "detail": "You have purchased 101.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "874.00",
//             "new_balance": "773.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "3b39777b-cc1b-455c-94a7-24d05a8b0ece",
//             "detail": "You have purchased 101.00 airtime from GLO",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "975.00",
//             "new_balance": "874.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "c3cd85ef-2258-4870-a897-d4ec1f9e5e2b",
//             "detail": "You have purchased 101.00 airtime from AIRTEL",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1076.00",
//             "new_balance": "975.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "e0621c6b-5df3-4ee3-a339-d8665fa63861",
//             "detail": "You have purchased 101.00 airtime from AIRTEL1",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1177.00",
//             "new_balance": "1076.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "77a19e7b-59ab-4d53-8a70-7211f84f8afd",
//             "detail": "You have purchased 101.00 airtime from AIRTEL1",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1278.00",
//             "new_balance": "1177.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "e6b428d9-3199-4b70-853c-45c84146d33a",
//             "detail": "You have purchased 101.00 airtime from AIRTEL",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1379.00",
//             "new_balance": "1278.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "9cadd38a-b2d5-4a98-9508-89d8ac050f61",
//             "detail": "You have purchased 101.00 airtime from GLO",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1480.00",
//             "new_balance": "1379.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "ad5b0f39-caec-42ac-bda7-d680b252c4cf",
//             "detail": "You have purchased 10.00 airtime from GLO",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1490.00",
//             "new_balance": "1480.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "10.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "708c9ecf-607f-4cde-bc9c-ebb40f341ac9",
//             "detail": "You have purchased 10.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1500.00",
//             "new_balance": "1490.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "10.00",
//             "type": "Airtime"
//         }
//     ]
// }

// FOR AIRTIME PURCHASE / POST - http://127.0.0.1:4000/api/purchase/airtime1/

// {
//     "status": "success",
//     "data": {
//         "id": "005e2434-493c-429d-8a47-14acb42c5db7",
//         "detail": "You have purchased 200.00 airtime from MTN",
//         "date_and_time": "2023-11-11T15:19:14.313568Z",
//         "old_balance": "7413.00",
//         "new_balance": "7213.00",
//         "phone_number": "07012345678",
//         "status": "Success",
//         "amount": "200.00",
//         "type": "Airtime"
//     }
// }

// FOR DATA PURCHASE / POST - http://127.0.0.1:4000/api/purchase/data1/0bcff8f3-38e2-4fc8-b4ec-27ccd4292591/

// {
//     "status": "success",
//     "message": {
//         "id": "842bf3af-e36f-4e30-8058-ea0d686af17f",
//         "detail": "You have purchased 2GB Data from MTN",
//         "date_and_time": "2023-11-11T15:22:10.191570Z",
//         "old_balance": "7213.00",
//         "new_balance": "6753.00",
//         "phone_number": "07013116710",
//         "status": "Success",
//         "amount": "460.00",
//         "type": "Data"
//     }
// }

// FOR LISTING DATA PLANS FOR A PARTICULAR NETWORK / GET - http://127.0.0.1:4000/api/data-plans/mtn

// {
//     "status": "success",
//     "data": [
//         {
//             "id": "75116019-5d5e-4e1f-b19d-9deebbe79181",
//             "amount": "230.00",
//             "network": "MTN",
//             "plan_type": "SME",
//             "bandwidth": "1GB",
//             "network_id": "1",
//             "reseller_amount": "225.00"
//         },
//         {
//             "id": "0bcff8f3-38e2-4fc8-b4ec-27ccd4292591",
//             "amount": "460.00",
//             "network": "MTN",
//             "plan_type": "SME",
//             "bandwidth": "2GB",
//             "network_id": "1",
//             "reseller_amount": "450.00"
//         }
//     ]
// }

//FOR TRANSACTION LAST MONTH (today+yesterday,this week+last week,this month+last month) / GET - http://127.0.0.1:4000/api/transactions/last-month/

// {
//     "status": "success",
//     "total_amount": 1587.0,
//     "data": [
//         {
//             "id": "9a6d150c-2615-448c-8caa-0d75ac7ff0a4",
//             "detail": "You have purchased 200.00 airtime from MTN",
//             "date_and_time": "Oct. 27, 2023",
//             "old_balance": "7613.00",
//             "new_balance": "7413.00",
//             "phone_number": "07012345678",
//             "status": "Success",
//             "amount": "200.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "f5489dd1-6181-44d9-8263-c66d72c3d4c3",
//             "detail": "You have purchased 2GB Data from MTN",
//             "date_and_time": "Oct. 27, 2023",
//             "old_balance": "8073.00",
//             "new_balance": "7613.00",
//             "phone_number": "07013116710",
//             "status": "Success",
//             "amount": "460.00",
//             "type": "Data"
//         },
//         {
//             "id": "a4243260-8b98-47c3-a304-f2ec43be5449",
//             "detail": "You have purchased 100.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "673.00",
//             "new_balance": "573.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "100.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "07c8ea40-169a-4a81-89dd-7228a5e2115e",
//             "detail": "You have purchased 100.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "773.00",
//             "new_balance": "673.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "100.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "bf841c01-2070-4f89-a15c-d6ca9aca0198",
//             "detail": "You have purchased 101.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "874.00",
//             "new_balance": "773.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "3b39777b-cc1b-455c-94a7-24d05a8b0ece",
//             "detail": "You have purchased 101.00 airtime from GLO",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "975.00",
//             "new_balance": "874.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "c3cd85ef-2258-4870-a897-d4ec1f9e5e2b",
//             "detail": "You have purchased 101.00 airtime from AIRTEL",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1076.00",
//             "new_balance": "975.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "e0621c6b-5df3-4ee3-a339-d8665fa63861",
//             "detail": "You have purchased 101.00 airtime from AIRTEL1",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1177.00",
//             "new_balance": "1076.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "77a19e7b-59ab-4d53-8a70-7211f84f8afd",
//             "detail": "You have purchased 101.00 airtime from AIRTEL1",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1278.00",
//             "new_balance": "1177.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "e6b428d9-3199-4b70-853c-45c84146d33a",
//             "detail": "You have purchased 101.00 airtime from AIRTEL",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1379.00",
//             "new_balance": "1278.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "9cadd38a-b2d5-4a98-9508-89d8ac050f61",
//             "detail": "You have purchased 101.00 airtime from GLO",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1480.00",
//             "new_balance": "1379.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "101.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "ad5b0f39-caec-42ac-bda7-d680b252c4cf",
//             "detail": "You have purchased 10.00 airtime from GLO",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1490.00",
//             "new_balance": "1480.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "10.00",
//             "type": "Airtime"
//         },
//         {
//             "id": "708c9ecf-607f-4cde-bc9c-ebb40f341ac9",
//             "detail": "You have purchased 10.00 airtime from MTN",
//             "date_and_time": "Oct. 18, 2023",
//             "old_balance": "1500.00",
//             "new_balance": "1490.00",
//             "phone_number": "07034194111",
//             "status": "Success",
//             "amount": "10.00",
//             "type": "Airtime"
//         }
//     ]
// }

// FOR SINGLE TRANSACTION / POST - http://127.0.0.1:4000/api/transaction/9a6d150c-2615-448c-8caa-0d75ac7ff0a4/

// {
//     "status": "success",
//     "data": {
//         "id": "9a6d150c-2615-448c-8caa-0d75ac7ff0a4",
//         "detail": "You have purchased 200.00 airtime from MTN",
//         "date_and_time": "10/27/2023, 12:05:21",
//         "old_balance": "7613.00",
//         "new_balance": "7413.00",
//         "phone_number": "07012345678",
//         "status": "Success",
//         "amount": "200.00",
//         "type": "Airtime"
//     }
// }

// FOR LISTING DEPOSITS / GET -  http://127.0.0.1:4000/api/display-deposit-records/

// [
//     {
//         "id": "a080cc9a-9eee-4897-928e-d1eb0cc8404d",
//         "amount": "2000.00",
//         "date_and_time": "2023-10-17T10:36:02.517071Z",
//         "wallet": "518dcb23-6947-48b3-a661-78d236bafafc"
//     },
//     {
//         "id": "800e9167-68ae-4fa4-bd05-3789055b7370",
//         "amount": "2000.00",
//         "date_and_time": "2023-10-17T10:37:05.973957Z",
//         "wallet": "518dcb23-6947-48b3-a661-78d236bafafc"
//     },
//     {
//         "id": "7c2c79f3-d2f0-4a20-9d99-2d8bc8bdb418",
//         "amount": "-2000.00",
//         "date_and_time": "2023-10-17T10:42:08.726851Z",
//         "wallet": "518dcb23-6947-48b3-a661-78d236bafafc"
//     },
//     {
//         "id": "bda76b06-2f51-4d0d-b1c3-536b339711ec",
//         "amount": "1000.00",
//         "date_and_time": "2023-10-17T13:01:59.474628Z",
//         "wallet": "18300842-b71b-4b30-bc3a-ead27c968f33"
//     },
//     {
//         "id": "02814f16-9b2b-444e-b4da-8596a342928c",
//         "amount": "200.00",
//         "date_and_time": "2023-10-17T17:04:41.564954Z",
//         "wallet": "18300842-b71b-4b30-bc3a-ead27c968f33"
//     },
//     {
//         "id": "94240d93-0045-434f-a59c-6d0ac2e66d20",
//         "amount": "200.00",
//         "date_and_time": "2023-10-17T17:04:53.863176Z",
//         "wallet": "18300842-b71b-4b30-bc3a-ead27c968f33"
//     },
//     {
//         "id": "c9d6ee53-906f-4878-9d53-a6f1aa67464a",
//         "amount": "1000.00",
//         "date_and_time": "2023-10-17T17:05:16.577083Z",
//         "wallet": "518dcb23-6947-48b3-a661-78d236bafafc"
//     },
//     {
//         "id": "32f33787-00fd-4181-a656-0a10d7475633",
//         "amount": "100.00",
//         "date_and_time": "2023-10-17T17:05:38.430681Z",
//         "wallet": "a464d692-00c4-473f-866a-5af786be4077"
//     },
//     {
//         "id": "84c8b1e2-1fc8-4203-bcb5-9f6f98197598",
//         "amount": "100.00",
//         "date_and_time": "2023-10-17T17:05:48.438683Z",
//         "wallet": "a464d692-00c4-473f-866a-5af786be4077"
//     },
//     {
//         "id": "a58a39d2-46f6-4f39-8180-867af0708885",
//         "amount": "2000.00",
//         "date_and_time": "2023-10-17T17:05:59.164684Z",
//         "wallet": "a464d692-00c4-473f-866a-5af786be4077"
//     },
//     {
//         "id": "2ab3f5b0-77e3-49b3-a3e1-4f2a1aca7fe9",
//         "amount": "500.00",
//         "date_and_time": "2023-10-18T09:06:11.154291Z",
//         "wallet": "39a37f35-46a7-47a4-bbfd-1dee5bfeb69a"
//     },
//     {
//         "id": "21bbf23d-fbf3-48c2-90f9-6bfbd20118d0",
//         "amount": "1500.00",
//         "date_and_time": "2023-10-18T09:06:58.170979Z",
//         "wallet": "a5b724de-e45d-4c81-97ca-9cd71d2af1ca"
//     },
//     {
//         "id": "aadd1284-60a6-415a-b772-c7c63a38f745",
//         "amount": "1000.00",
//         "date_and_time": "2023-10-18T09:07:26.972138Z",
//         "wallet": "a00e2bc3-8085-4b6c-9dbb-f7ede98d682e"
//     },
//     {
//         "id": "6056fd00-7ca7-4144-a4c9-f9273bed362b",
//         "amount": "5000.00",
//         "date_and_time": "2023-10-18T10:58:25.166169Z",
//         "wallet": "a5b724de-e45d-4c81-97ca-9cd71d2af1ca"
//     },
//     {
//         "id": "c09253d5-a8c7-4de4-8127-1084f982a1d5",
//         "amount": "500.00",
//         "date_and_time": "2023-10-23T13:18:27.051460Z",
//         "wallet": "a5b724de-e45d-4c81-97ca-9cd71d2af1ca"
//     },
//     {
//         "id": "d3797a63-3763-452e-a517-3e40422612f9",
//         "amount": "2000.00",
//         "date_and_time": "2023-10-23T13:29:45.934048Z",
//         "wallet": "a5b724de-e45d-4c81-97ca-9cd71d2af1ca"
//     }
// ]

// FOR SINGLE DEPOSIT / GET - http://127.0.0.1:4000/api/DisplayDepositRecordsPerUserView/a080cc9a-9eee-4897-928e-d1eb0cc8404d/

// [
//     {
//         "id": "a080cc9a-9eee-4897-928e-d1eb0cc8404d",
//         "amount": "2000.00",
//         "date_and_time": "2023-10-17T10:36:02.517071Z",
//         "wallet": "518dcb23-6947-48b3-a661-78d236bafafc"
//     }
// ]

// create model for the following
// 1. data purchase
// 2. airtime purchase
// 3.cable purchase
// 4. electric purchase
// 5. transaction
// 6. deposit record
// 7. wallet summary

// auth models

// class CreateAccountModel {
//   final String username;
//   final String password;

//   CreateAccountModel({required this.username, required this.password});
// }

// class LoginAccountModel {
//   final String username;
//   final String password;

//   LoginAccountModel({required this.username, required this.password});
// }

// class CreateProfileModel {
//   final String location;
//   final String phone;
//   final String state;
//   final String profile_picture;

//   CreateProfileModel(
//       {required this.location,
//       required this.phone,
//       required this.state,
//       required this.profile_picture});
// }

// // airtime purchase model

// List<Transaction> productsCategoryFromJson(String str) =>
//     List<Transaction>.from(
//         json.decode(str).map((x) => Transaction.fromJson(x)));

// String TransactionToJson(List<Transaction> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Transaction {
//   final String id;
//   final String details;
//   final String date_and_time;
//   final double old_balance;
//   final double new_balance;
//   final String phone_number;
//   final String status;
//   final double amount;
//   final String type;

//   Transaction(
//       {required this.id,
//       required this.details,
//       required this.date_and_time,
//       required this.old_balance,
//       required this.new_balance,
//       required this.phone_number,
//       required this.status,
//       required this.amount,
//       required this.type});

//   factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
//         id: json['id'],
//         details: json['details'],
//         date_and_time: json['date_and_time'],
//         old_balance: json['old_balance'],
//         new_balance: json['new_balance'],
//         phone_number: json['phone_number'],
//         status: json['status'],
//         amount: json['amout']?.toDouble(),
//         type: json['type'],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "details": details,
//         "date_and_time": date_and_time,
//         "old_balance": old_balance,
//         "new_balance": new_balance,
//         "phone_number": phone_number,
//         "status": status,
//         "amount": amount,
//         "type": type,
//       };
// }

// class AirtimePurchase {
//   final String network;
//   final double amount;
//   final String phone_number;

//   AirtimePurchase(
//       {required this.network,
//       required this.amount,
//       required this.phone_number});
// }

// List<Message> DataPurchaseFromJson(String str) =>
//                 List<Message>.from(
//                     json.decode(str).map((x) => Message.fromJson(x)));

//             String DataPurchaseToJson(List<Message> data) =>
//                 json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//             class DataPurchase{
//               final String? status;
//               Message? message;

//               DataPurchase({required this.status,required this.message});

//               factory DataPurchase.fromJson(Map<String, dynamic> Json) => DataPurchase(
//                   status: Json['status'],
//                   message: Message.fromJson(Json['message'])
//                   // Map<String, dynamic>.from(Json['messsage'].map((x))

//               );
//             }

//             class Message {
//               final String? id;
//               final String? details;
//               final String? date_and_time;
//               final String? old_balance;
//               final String? new_balance;
//               final String? phone_number;
//               final String? status;
//               final String? amount;
//               final String? type;

//               Message(
//                   {
//                     required this.id,
//                     required this.details,
//                     required this.date_and_time,
//                     required this.old_balance,
//                     required this.new_balance,
//                     required this.phone_number,
//                     required this.status,
//                     required this.amount,
//                     required this.type});

//               factory Message.fromJson(Map<String, dynamic> json) => Message(
//                 id: json['id'],
//                 details: json['details'],
//                 date_and_time: json['date_and_time'],
//                 old_balance: json['old_balance'],
//                 new_balance: json['new_balance'],
//                 phone_number: json['phone_number'],
//                 status: json['status'],
//                 amount: json['amount'],
//                 type: json['type'],
//               );

//               Map<String, dynamic> toJson() => {
//                 "id": id,
//                 "details": details,
//                 "date_and_time": date_and_time,
//                 "old_balance": old_balance,
//                 "new_balance": new_balance,
//                 "phone_number": phone_number,
//                 "status": status,
//                 "amount": amount,
//                 "type": type,
//               };
//             }

// List<DepositRecord> DepositRecordFromJson(String str) =>
//     List<DepositRecord>.from(
//         json.decode(str).map((x) => Transaction.fromJson(x)));

// String DepositRecordToJson(List<DepositRecord> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class DepositRecord {
//   final String id;
//   final double amount;
//   final String date_and_time;
//   final String wallet;

//   DepositRecord(
//       {required this.id,
//       required this.amount,
//       required this.date_and_time,
//       required this.wallet});

//   factory DepositRecord.fromJson(Map<String, dynamic> json) => DepositRecord(
//         id: json['id'],
//         date_and_time: json['date_and_time'],
//         amount: json['amout']?.toDouble(),
//         wallet: json['wallet'],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "date_and_time": date_and_time,
//         "amount": amount,
//         'wallet': wallet,
//       };
// }

// // ignore: non_constant_identifier_names
// List<CableSubscription1> CableSubscriptionFromJson(String str) =>
//     List<CableSubscription1>.from(
//         json.decode(str).map((x) => CableSubscription1.fromJson(x)));

// // ignore: non_constant_identifier_names
// String CableSubscriptionToJson(List<CableSubscription1> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CableSubscription1 {
//   final String iuc;
//   final String cable_provider;

//   CableSubscription1({required this.iuc, required this.cable_provider});

//   factory CableSubscription1.fromJson(Map<String, dynamic> json) =>
//       CableSubscription1(
//         iuc: json['iuc'],
//         cable_provider: json['cable_provider'],
//       );

//   Map<String, dynamic> toJson() => {
//         "iuc": iuc,
//         "cable_provder": cable_provider,
//       };
// }

// List<ElectricBillPayment> ElectricBillPaymentFromJson(String str) =>
//     List<ElectricBillPayment>.from(
//         json.decode(str).map((x) => Transaction.fromJson(x)));

// String ElectricBillPaymentToJson(List<ElectricBillPayment> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ElectricBillPayment {
//   final String number;
//   final String type;
//   final String disco;
//   final double amount;

//   ElectricBillPayment(
//       {required this.number,
//       required this.type,
//       required this.disco,
//       required this.amount});

//   factory ElectricBillPayment.fromJson(Map<String, dynamic> json) =>
//       ElectricBillPayment(
//         number: json['number'],
//         type: json['type'],
//         disco: json['disco'],
//         amount: json['amount'],
//       );

//   Map<String, dynamic> toJson() => {
//         "number": number,
//         "type": type,
//         "disco": disco,
//         "amount": amount,
//       };
// }

// List<ValidateElectricBill> ValidateElectricBillFromJson(String str) =>
//     List<ValidateElectricBill>.from(
//         json.decode(str).map((x) => Transaction.fromJson(x)));

// String ValidateElectricBillToJson(List<ValidateElectricBill> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ValidateElectricBill {
//   final String number;
//   final String type;
//   final String disco;

//   ValidateElectricBill(
//       {required this.number, required this.type, required this.disco});

//   factory ValidateElectricBill.fromJson(Map<String, dynamic> json) =>
//       ValidateElectricBill(
//         number: json['number'],
//         type: json['type'],
//         disco: json['disco'],
//       );

//   Map<String, dynamic> toJson() => {
//         "number": number,
//         "type": type,
//         "disco": disco,
//       };
// }

// // ignore: non_constant_identifier_names
// List<ValidateCableNumber> ValidateCableNumberFromJson(String str) =>
//     List<ValidateCableNumber>.from(
//         json.decode(str).map((x) => ValidateCableNumber.fromJson(x)));

// // ignore: non_constant_identifier_names
// String ValidateCableNumberToJson(List<ValidateCableNumber> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ValidateCableNumber {
//   final String iuc;
//   final String cable_provider;

//   ValidateCableNumber({required this.iuc, required this.cable_provider});

//   factory ValidateCableNumber.fromJson(Map<String, dynamic> json) =>
//       ValidateCableNumber(
//         iuc: json['iuc'],
//         cable_provider: json['cable_provider'],
//       );

//   Map<String, dynamic> toJson() => {
//         "iuc": iuc,
//         "cable_provder": cable_provider,
//       };
// }

// // ignore: non_constant_identifier_names
// List<UpdatePassWord> UpdatePassWordFromJson(String str) =>
//     List<UpdatePassWord>.from(
//         json.decode(str).map((x) => UpdatePassWord.fromJson(x)));

// // ignore: non_constant_identifier_names
// String UpdatePassWordToJson(List<ValidateCableNumber> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UpdatePassWord {
//   // ignore: non_constant_identifier_names
//   final String old_password;
//   // ignore: non_constant_identifier_names
//   final String new_password;

//   // ignore: non_constant_identifier_names
//   UpdatePassWord({required this.old_password,required this.new_password});

//   factory UpdatePassWord.fromJson(Map<String, dynamic> json) =>
//       UpdatePassWord(
//         old_password: json['old_password'],
//         new_password: json['new_password'],
//       );

//   Map<String, dynamic> toJson() => {
//         "old_password": new_password,
//         "new_password": new_password,
//       };

// }

// {
//     "status": "success",
//     "data": {
//         "id": "005e2434-493c-429d-8a47-14acb42c5db7",
//         "detail": "You have purchased 200.00 airtime from MTN",
//         "date_and_time": "2023-11-11T15:19:14.313568Z",
//         "old_balance": "7413.00",
//         "new_balance": "7213.00",
//         "phone_number": "07012345678",
//         "status": "Success",
//         "amount": "200.00",
//         "type": "Airtime"
//     }
// }

// To parse this JSON data, do
//
//     final dataPurchase = dataPurchaseFromJson(jsonString);

DataPurchase dataPurchaseFromJson(String str) =>
    DataPurchase.fromJson(json.decode(str));

String dataPurchaseToJson(DataPurchase data) => json.encode(data.toJson());

class DataPurchase {
  final String status;
  final Message message;

  DataPurchase({
    required this.status,
    required this.message,
  });

  factory DataPurchase.fromJson(Map<String, dynamic> json) => DataPurchase(
        status: json["status"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message.toJson(),
      };
}

class Message {
  final String id;
  final String detail;
  final DateTime dateAndTime;
  final String oldBalance;
  final String newBalance;
  final String phoneNumber;
  final String status;
  final String amount;
  final String type;

  Message({
    required this.id,
    required this.detail,
    required this.dateAndTime,
    required this.oldBalance,
    required this.newBalance,
    required this.phoneNumber,
    required this.status,
    required this.amount,
    required this.type,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        detail: json["detail"],
        dateAndTime: DateTime.parse(json["date_and_time"]),
        oldBalance: json["old_balance"],
        newBalance: json["new_balance"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        amount: json["amount"],
        type: json["type"],
      );

  get date_and_time => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "detail": detail,
        "date_and_time": dateAndTime.toIso8601String(),
        "old_balance": oldBalance,
        "new_balance": newBalance,
        "phone_number": phoneNumber,
        "status": status,
        "amount": amount,
        "type": type,
      };
}

// To parse this JSON data, do
//
//     final depositRecord = depositRecordFromJson(jsonString);

List<DepositRecord> depositRecordFromJson(String str) =>
    List<DepositRecord>.from(
        json.decode(str).map((x) => DepositRecord.fromJson(x)));

String depositRecordToJson(List<DepositRecord> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepositRecord {
  final String id;
  final String amount;
  final DateTime dateAndTime;
  final String wallet;

  DepositRecord({
    required this.id,
    required this.amount,
    required this.dateAndTime,
    required this.wallet,
  });

  factory DepositRecord.fromJson(Map<String, dynamic> json) => DepositRecord(
        id: json["id"],
        amount: json["amount"],
        dateAndTime: DateTime.parse(json["date_and_time"]),
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "date_and_time": dateAndTime.toIso8601String(),
        "wallet": wallet,
      };
}

// To parse this JSON data, do
//
//     final allTransactions = allTransactionsFromJson(jsonString);

AllTransactions allTransactionsFromJson(String str) =>
    AllTransactions.fromJson(json.decode(str));

String allTransactionsToJson(AllTransactions data) =>
    json.encode(data.toJson());

class AllTransactions {
  final String status;
  final int totalAmount;
  final List<Datum1> data;

  AllTransactions({
    required this.status,
    required this.totalAmount,
    required this.data,
  });

  factory AllTransactions.fromJson(Map<String, dynamic> json) =>
      AllTransactions(
        status: json["status"],
        totalAmount: json["total_amount"],
        data: List<Datum1>.from(json["data"].map((x) => Datum1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_amount": totalAmount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum1 {
  final String id;
  final String detail;
  final DateAndTime dateAndTime;
  final String oldBalance;
  final String newBalance;
  final String phoneNumber;
  final Status status;
  final String amount;
  final Type type;

  Datum1({
    required this.id,
    required this.detail,
    required this.dateAndTime,
    required this.oldBalance,
    required this.newBalance,
    required this.phoneNumber,
    required this.status,
    required this.amount,
    required this.type,
  });

  factory Datum1.fromJson(Map<String, dynamic> json) => Datum1(
        id: json["id"],
        detail: json["detail"],
        dateAndTime: dateAndTimeValues.map[json["date_and_time"]]!,
        oldBalance: json["old_balance"],
        newBalance: json["new_balance"],
        phoneNumber: json["phone_number"],
        status: statusValues.map[json["status"]]!,
        amount: json["amount"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "detail": detail,
        "date_and_time": dateAndTimeValues.reverse[dateAndTime],
        "old_balance": oldBalance,
        "new_balance": newBalance,
        "phone_number": phoneNumber,
        "status": statusValues.reverse[status],
        "amount": amount,
        "type": typeValues.reverse[type],
      };
}

enum DateAndTime { OCT_182023, OCT_272023 }

final dateAndTimeValues = EnumValues({
  "Oct. 18, 2023": DateAndTime.OCT_182023,
  "Oct. 27, 2023": DateAndTime.OCT_272023
});

enum Status { SUCCESS }

final statusValues = EnumValues({"Success": Status.SUCCESS});

enum Type { AIRTIME, DATA }

final typeValues = EnumValues({"Airtime": Type.AIRTIME, "Data": Type.DATA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final airtimePurchase = airtimePurchaseFromJson(jsonString);

AirtimePurchase airtimePurchaseFromJson(String str) =>
    AirtimePurchase.fromJson(json.decode(str));

String airtimePurchaseToJson(AirtimePurchase data) =>
    json.encode(data.toJson());

class AirtimePurchase {
  final String status;
  final Data data;

  AirtimePurchase({
    required this.status,
    required this.data,
  });

  factory AirtimePurchase.fromJson(Map<String, dynamic> json) =>
      AirtimePurchase(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  get message => null;

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  final String id;
  final String detail;
  final DateTime dateAndTime;
  final String oldBalance;
  final String newBalance;
  final String phoneNumber;
  final String status;
  final String amount;
  final String type;

  Data({
    required this.id,
    required this.detail,
    required this.dateAndTime,
    required this.oldBalance,
    required this.newBalance,
    required this.phoneNumber,
    required this.status,
    required this.amount,
    required this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        detail: json["detail"],
        dateAndTime: DateTime.parse(json["date_and_time"]),
        oldBalance: json["old_balance"],
        newBalance: json["new_balance"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        amount: json["amount"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "detail": detail,
        "date_and_time": dateAndTime.toIso8601String(),
        "old_balance": oldBalance,
        "new_balance": newBalance,
        "phone_number": phoneNumber,
        "status": status,
        "amount": amount,
        "type": type,
      };
}

// 'detail': f'You have purchased {amount}, {token}',
//             'old_balance': old_bal,
//             'new_balance': new_bal,
//             'phone_number': '',
//             'status': 'Success',
//             'amount': amount,
//             'type': 'Electricity'

List<ElectricSubscription> electricSubscriptionFromJson(String str) =>
    List<ElectricSubscription>.from(
        json.decode(str).map((x) => ElectricSubscription.fromJson(x)));

String electricSubscriptionToJson(List<ElectricSubscription> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ElectricSubscription {
  final String detail;
  final String oldBalance;
  final String newBalance;
  final String phoneNumber;
  final String status;
  final String amount;
  final String type;

  ElectricSubscription(
      {required this.detail,
      required this.oldBalance,
      required this.newBalance,
      required this.phoneNumber,
      required this.status,
      required this.amount,
      required this.type});

  factory ElectricSubscription.fromJson(Map<String, dynamic> json) =>
      ElectricSubscription(
        detail: json['detail'],
        oldBalance: json['old_balance'],
        newBalance: json['new_balance'],
        phoneNumber: json['phone_number'],
        status: json['status'],
        amount: json['amount'],
        type: json['type'],
      );

  get date_and_time => null;

  Map<String, dynamic> toJson() => {
    "detail":detail,
    "old_balance":oldBalance,
    "new_balance":newBalance,
    "phone_number":phoneNumber,
    "status":status,
    "amount":amount,
    "type":type,

  };
}

// To parse this JSON data, do
//
//     final dataPurchase = dataPurchaseFromJson(jsonString);

// DataPurchase dataPurchaseFromJson(String str) => DataPurchase.fromJson(json.decode(str));

// String dataPurchaseToJson(DataPurchase data) => json.encode(data.toJson());

// class DataPurchase {
//     final String status;
//     final Message message;

//     DataPurchase({
//         required this.status,
//         required this.message,
//     });

//     factory DataPurchase.fromJson(Map<String, dynamic> json) => DataPurchase(
//         status: json["status"],
//         message: Message.fromJson(json["message"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message.toJson(),
//     };
// }

// class Message {
//     final String id;
//     final String detail;
//     final DateTime dateAndTime;
//     final String oldBalance;
//     final String newBalance;
//     final String phoneNumber;
//     final String status;
//     final String amount;
//     final String type;

//     Message({
//         required this.id,
//         required this.detail,
//         required this.dateAndTime,
//         required this.oldBalance,
//         required this.newBalance,
//         required this.phoneNumber,
//         required this.status,
//         required this.amount,
//         required this.type,
//     });

//     factory Message.fromJson(Map<String, dynamic> json) => Message(
//         id: json["id"],
//         detail: json["detail"],
//         dateAndTime: DateTime.parse(json["date_and_time"]),
//         oldBalance: json["old_balance"],
//         newBalance: json["new_balance"],
//         phoneNumber: json["phone_number"],
//         status: json["status"],
//         amount: json["amount"],
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "detail": detail,
//         "date_and_time": dateAndTime.toIso8601String(),
//         "old_balance": oldBalance,
//         "new_balance": newBalance,
//         "phone_number": phoneNumber,
//         "status": status,
//         "amount": amount,
//         "type": type,
//     };
// }

// To parse this JSON data, do
//
//     final dataPlanListForPerticularNetwork = dataPlanListForPerticularNetworkFromJson(jsonString);

DataPlanListForPerticularNetwork dataPlanListForPerticularNetworkFromJson(
        String str) =>
    DataPlanListForPerticularNetwork.fromJson(json.decode(str));

String dataPlanListForPerticularNetworkToJson(
        DataPlanListForPerticularNetwork data) =>
    json.encode(data.toJson());

class DataPlanListForPerticularNetwork {
  final String status;
  final List<Datum> data;

  DataPlanListForPerticularNetwork({
    required this.status,
    required this.data,
  });

  factory DataPlanListForPerticularNetwork.fromJson(
          Map<String, dynamic> json) =>
      DataPlanListForPerticularNetwork(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String id;
  final String amount;
  final String network;
  final String planType;
  final String bandwidth;
  final String networkId;
  final String resellerAmount;

  Datum({
    required this.id,
    required this.amount,
    required this.network,
    required this.planType,
    required this.bandwidth,
    required this.networkId,
    required this.resellerAmount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        amount: json["amount"],
        network: json["network"],
        planType: json["plan_type"],
        bandwidth: json["bandwidth"],
        networkId: json["network_id"],
        resellerAmount: json["reseller_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "network": network,
        "plan_type": planType,
        "bandwidth": bandwidth,
        "network_id": networkId,
        "reseller_amount": resellerAmount,
      };
}

// To parse this JSON data, do
//
//     final singleDeposit = singleDepositFromJson(jsonString);

List<SingleDeposit> singleDepositFromJson(String str) =>
    List<SingleDeposit>.from(
        json.decode(str).map((x) => SingleDeposit.fromJson(x)));

String singleDepositToJson(List<SingleDeposit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleDeposit {
  final String id;
  final String amount;
  final DateTime dateAndTime;
  final String wallet;

  SingleDeposit({
    required this.id,
    required this.amount,
    required this.dateAndTime,
    required this.wallet,
  });

  factory SingleDeposit.fromJson(Map<String, dynamic> json) => SingleDeposit(
        id: json["id"],
        amount: json["amount"],
        dateAndTime: DateTime.parse(json["date_and_time"]),
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "date_and_time": dateAndTime.toIso8601String(),
        "wallet": wallet,
      };
}

// To parse this JSON data, do
//
//     final singleTransaction = singleTransactionFromJson(jsonString);

SingleTransaction singleTransactionFromJson(String str) =>
    SingleTransaction.fromJson(json.decode(str));

String singleTransactionToJson(SingleTransaction data) =>
    json.encode(data.toJson());

class SingleTransaction {
  final String status;
  final Data1 data;

  SingleTransaction({
    required this.status,
    required this.data,
  });

  factory SingleTransaction.fromJson(Map<String, dynamic> json) =>
      SingleTransaction(
        status: json["status"],
        data: Data1.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data1 {
  final String id;
  final String detail;
  final String dateAndTime;
  final String oldBalance;
  final String newBalance;
  final String phoneNumber;
  final String status;
  final String amount;
  final String type;

  Data1({
    required this.id,
    required this.detail,
    required this.dateAndTime,
    required this.oldBalance,
    required this.newBalance,
    required this.phoneNumber,
    required this.status,
    required this.amount,
    required this.type,
  });

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        id: json["id"],
        detail: json["detail"],
        dateAndTime: json["date_and_time"],
        oldBalance: json["old_balance"],
        newBalance: json["new_balance"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        amount: json["amount"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "detail": detail,
        "date_and_time": dateAndTime,
        "old_balance": oldBalance,
        "new_balance": newBalance,
        "phone_number": phoneNumber,
        "status": status,
        "amount": amount,
        "type": type,
      };
}

// To parse this JSON data, do
//
//     final singleDeposit = singleDepositFromJson(jsonString);

// List<SingleDeposit> singleDepositFromJson(String str) => List<SingleDeposit>.from(json.decode(str).map((x) => SingleDeposit.fromJson(x)));

// String singleDepositToJson(List<SingleDeposit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class SingleDeposit {
//     final String id;
//     final String amount;
//     final DateTime dateAndTime;
//     final String wallet;

//     SingleDeposit({
//         required this.id,
//         required this.amount,
//         required this.dateAndTime,
//         required this.wallet,
//     });

//     factory SingleDeposit.fromJson(Map<String, dynamic> json) => SingleDeposit(
//         id: json["id"],
//         amount: json["amount"],
//         dateAndTime: DateTime.parse(json["date_and_time"]),
//         wallet: json["wallet"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "amount": amount,
//         "date_and_time": dateAndTime.toIso8601String(),
//         "wallet": wallet,
//     };
// }
