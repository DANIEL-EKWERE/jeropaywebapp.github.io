import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:databank/widget/textField.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.name, this.image});
  final String? name;
  final String? image;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
                    '${widget.name} ATM - Payment',
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 5),
                child: Text(
                  'Amount',
                  style: kEncodeSansSemiBold.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                ),
              ),
            ),
            SizedBox(height: sizeVertical * 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_balance_wallet_sharp,
                    size: 30,
                    color: kGrey,
                  ),
                  SizedBox(width: sizeVertical * 1),
                  Expanded(
                    child:
                        textFieldNumber('Amount', 'Amount', _controller, 'x'),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeVertical * 1),
            Text(
              'Amount must be greater than or equals #300',
              style: kEncodeSansRegular.copyWith(
                  color: Colors.red,
                  fontSize: SizeConfig.blockSizeHorizontal! * 1.5),
            ),
            //  SizedBox(height: sizeVertical * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 0),
                        child: Text(
                          'Amount to Pay + Charge',
                          style: kEncodeSansSemiBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.2),
                        ),
                      ),
                    ),
                    // SizedBox(height: sizeVertical * 1),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 5),
                        child: Text(
                          _controller.text,
                          style: kEncodeSansSemiBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Watch video',
                            style: kEncodeSansSemiBold.copyWith(
                                color: kYellow,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 2.2),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: sizeVertical * 1),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24.0, top: 0),
                        child: Text(
                          '-#30.00',
                          style: kEncodeSansSemiBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: sizeVertical * 1),
            
            button(
              text1:'Continue With Payment',
              isLoading1:false,
              tap:(){}),

            SizedBox(height: sizeVertical * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: sizeVertical * 5,
                      height: sizeVertical * 5,
                      child: Image(
                        width: sizeVertical * 5,
                        height: sizeVertical * 5,
                        image: AssetImage(
                          widget.image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: sizeVertical * 1),
                    Text(widget.name!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
