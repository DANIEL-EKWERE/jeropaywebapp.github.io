import 'package:flutter/material.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import 'button.dart';

class Receipt extends StatefulWidget {
  const Receipt(
      {super.key,
      required this.details,
      required this.date_and_time,
      required this.old_balance,
      required this.new_balance,
      required this.amout,
      required this.phone_number,
      required this.status,
      required this.type});

  final String? details;
  final String? date_and_time;
  final String? old_balance;
  final String? new_balance;
  final String? phone_number;
  final String? status;
  final String? amout;
  final String? type;

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    return Container(
      color: const Color(0xff757375),
      child: Container(
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Purchase Receipt',
                    style: kEncodeSansSemiBold.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 5),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.cancel,
                      color: kGrey,
                    ),
                  ),
                ),
                SizedBox(width: sizeVertical * 1),
              ],
            ),
            const Divider(),
            SizedBox(height: sizeVertical * 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [const Text('Details:'), Text(widget.details!)]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Date and Time:'),
                      Text(widget.date_and_time!)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Old Balance:'),
                      Text(widget.old_balance!)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('New Balance:'),
                      Text(widget.new_balance!)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Phone:'),
                      Text(widget.phone_number!)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [const Text('Status:'), Text(widget.status!)]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Amount:'),
                      Text(widget.amout!)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [const Text('Type:'), Text(widget.type!)]),
              ],
            ),
            SizedBox(height: sizeVertical * 1),
            Expanded(
              child: Row(
                children: [
                  button(text1: 'Go Home', isLoading1: false, tap: () {}),
                  button(
                      text1: 'Perform Another Trans.',
                      isLoading1: false,
                      tap: () {}),
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 2),
          ],
        ),
      ),
    );
  }
}
