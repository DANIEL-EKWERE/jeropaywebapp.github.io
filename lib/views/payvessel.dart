import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../customizations/size_config.dart';

class Payvessel extends StatefulWidget {
  const Payvessel({super.key});

  @override
  State<Payvessel> createState() => _PayvesselState();
}

enum MenuAction { info }

class _PayvesselState extends State<Payvessel> {
  dynamic accountNumber;
  dynamic accountName;
  dynamic bankName;
  @override
  void initState() {
    super.initState();
    getUserAccountDetails();
  }

  Future<void> getUserAccountDetails() async {
    final acctNum = await DataBaseProvider().getAcctNumber();
    final acctName = await DataBaseProvider().getAcctName();
    final bName = await DataBaseProvider().getBankName();

    setState(() {
      accountNumber = acctNum;
      accountName = acctName;
      bankName = bName;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => getUserAccountDetails(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: sizeVertical * 20,
                  decoration: BoxDecoration(
                    color: kYellow.withOpacity(0.6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: sizeVertical * 1,
                      ),
                      SizedBox(
                          width: sizeHorizontal * 5,
                          height: sizeHorizontal * 5,
                          child: Image.asset('assets/images/payvessel.png')),
                      SizedBox(
                        height: sizeVertical * 2,
                      ),
                      const Text(
                        'Send money to this accounts, and you\'ll be credited automatically. \n thanks for using DataBank, with love from Payvessel!!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizeVertical * 3,
                ),
                const Text('Account to fund and start using the DATABANK app'),
                SizedBox(
                  height: sizeVertical * 3,
                ),
                // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //   TextButton.icon(
                //     onPressed: () {},
                //     icon: const Icon(Icons.play_arrow),
                //     label: const Text('Watch ADS -#25'),
                //   ),
                //   IconButton(
                //     icon: const Icon(Icons.info_outline),
                //     color: kGrey,
                //     onPressed: () {
                //       showInfoDialogue(context);
                //     },
                //   ),
                // ]),
                // SizedBox(
                //   height: sizeVertical * 3,
                // ),
                Container(
                  width: double.infinity,
                  height: sizeVertical * 25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splash (1).png'),
                        colorFilter: ColorFilter.mode(
                          Color(0xff6A6A6A),
                          BlendMode.modulate,
                        ),
                        fit: BoxFit.cover),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 27, 20, 20),
                        Color(0xff6A6A6A),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Virtual Account',
                                    style: kEncodeSansBold.copyWith(
                                        color: kWhite,
                                        fontSize: sizeVertical * 1.5)),
                                Text(bankName,
                                    style: kEncodeSansBold.copyWith(
                                        color: kWhite,
                                        fontSize: sizeVertical * 1.5))
                              ],
                            ),
                            SizedBox(
                              height: sizeVertical * 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // const Text('Account Number'),
                                  // Text(accountNumber)

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: kLightGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Row(children: [
                                      Text(accountNumber,
                                          style: kEncodeSansRegular.copyWith(
                                              color: kGrey,
                                              fontSize: sizeVertical * 1.5)),
                                      IconButton(
                                          onPressed: () {
                                            ClipboardData data = ClipboardData(
                                                text: accountNumber);

                                            Clipboard.setData(data);

                                            successMessage(
                                                context: context,
                                                message:
                                                    "Account copied to Clip Board!!!");
                                          },
                                          icon: Icon(Icons.copy))
                                    ]),
                                  ),
                                  
                                ],
                              ),
                            ),
                            SizedBox(
                              height: sizeVertical * 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //const Text('Bank Name'),
                                  Text(accountName,
                                      style: kEncodeSansBold.copyWith(
                                          color: kWhite,
                                          fontSize: sizeVertical * 1.5)),
                                          Text('Charge: 1%',
                                    style: kEncodeSansBold.copyWith(
                                        color: kWhite,
                                        fontSize: sizeVertical * 1.5)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizeVertical * 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> showInfoDialogue(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const Text(
                'By watching a short vidoe ads you have the previleged to pay a transaction fee of #25 only, this priviledge last only for 4hours, then you can watch again!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
}
