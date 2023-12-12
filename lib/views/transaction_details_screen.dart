import 'package:flutter/material.dart';
import 'package:databank/backend/models/api_models.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final SingleTransaction singleTransaction;

  TransactionDetailsScreen({required this.singleTransaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Receipt'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 40,
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
                        singleTransaction.data.detail,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // Add more rows to display other transaction data
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Date and Time:'),
                    Text(singleTransaction.data.dateAndTime),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Old Balance:'),
                    Text(singleTransaction.data.oldBalance),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('New Balance:'),
                    Text(singleTransaction.data.newBalance),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Phone:'),
                    Text(singleTransaction.data.phoneNumber),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Status:'),
                    Text(singleTransaction.data.status),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Amount:'),
                    Text(singleTransaction.data.amount),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Type:'),
                    Text(singleTransaction.data.type),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
