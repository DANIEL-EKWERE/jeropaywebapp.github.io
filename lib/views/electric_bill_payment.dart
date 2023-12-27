import 'dart:ui';

import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/backend/provider/purchase_provider/purchases_provider.dart';
import 'package:databank/backend/provider/user_details/user_details.dart';
// import 'package:databank/widget/button.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/fab.dart';
import '../widget/textField.dart';

class ElectricBillPayment extends StatefulWidget {
  const ElectricBillPayment(
      {super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  State<ElectricBillPayment> createState() => _ElectricBillPaymentState();
}

class _ElectricBillPaymentState extends State<ElectricBillPayment> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _meterTypeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();


  var username;
  var baln;
  var balance;


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _phoneController.dispose();
    _numberController.dispose();
  }


  void username1() {
    final x = gatherUserName();
    setState(() {
      username = x;
    });
  }

  Future<String> gatherUserName() async {
    final usernamex = await DataBaseProvider().getUserName();
    setState(() {
      username = usernamex;
    });
    print("user name is $username method");
    return usernamex;
  }

  // Future<void> userProfile() async {
  //   final image = await UserDetails().getUserProfileImage();
  //   setState(() {
  //     proImg = image;
  //   });
  // }

// final balance =
  Future<void> gatherBalance() async {
    final balancex = await UserDetails().getUserAccountBalanace();
    setState(() {
      balance = balancex;
    });
    print("balance is $balance method");
    // return balancex;
  }

  Future<void> Balance() {
    final bal = gatherBalance();
    setState(() {
      balance = bal;
    });
    return balance;
  }

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    WidgetsBinding.instance.addPostFrameCallback((_) {
      baln = Provider.of<UserDetails>(context, listen: false);
      baln.getUserAccountBalanace();
    });
    Balance();
    gatherBalance();
    username1();
    gatherUserName();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: fab(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Container(
            width: SizeConfig.blockSizeHorizontal! * 6,
            height: SizeConfig.blockSizeVertical! * 6,
            //    margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                    color: kBrown.withOpacity(0.10),
                    spreadRadius: -1.0,
                    blurRadius: 9.0,
                    offset: const Offset(0, 5),
                  ),
                ]),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.chevron_left),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: kWhite,
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: kGrey,
            backgroundImage: AssetImage('assets/images/pic-2.png'),
          ),
          const SizedBox(
            width: 24,
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff6A6A6A),
            Color.fromARGB(255, 63, 62, 62),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(255, 30, 29, 31)
            statusBarIconBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        //  padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: SizeConfig.blockSizeVertical! * 25,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff6A6A6A),
                              Color(0xff373737),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 18,
                            child: Text(
                              'Hello,\n$username.',
                              style: kEncodeSansRegular.copyWith(
                                color: kWhite,
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 18,
                            child: Text(
                              'Available Balance',
                              style: kEncodeSansRegular.copyWith(
                                color: kWhite,
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            right: 18,
                            child: Text(
                              '#$balance',
                              style: kEncodeSansRegular.copyWith(
                                color: kWhite,
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 18,
                            child: Image.asset(
                              'assets/images/style.png',
                              width: SizeConfig.blockSizeHorizontal! * 18,
                              height: SizeConfig.blockSizeVertical! * 15,
                              scale: 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            right: -5,
                            child: Image.asset(
                              'assets/images/styles2.png',
                              width: SizeConfig.blockSizeHorizontal! * 20,
                              height: SizeConfig.blockSizeVertical! * 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          margin: const EdgeInsets.only(top: 70, bottom: 70),
                          height: SizeConfig.blockSizeVertical! * 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: kWhite,
                            boxShadow: [
                              BoxShadow(
                                color: kBrown.withOpacity(0.3),
                                spreadRadius: -4.0,
                                blurRadius: 19.0,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 30, bottom: 20),
                              ),
                              // const SizedBox(
                              //   height: 50,
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Electric Bill Payment',
                                    style: kEncodeSansSemiBold.copyWith(
                                        color: kBlack,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.5),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'please select from the list of varieties to make purchase for your electric bill payment',
                                  style: kEncodeSansRegular.copyWith(
                                      color: kBlack,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              2.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 5, color: kBlack),
                                    shape: BoxShape.circle),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: kGrey,
                                  backgroundImage: AssetImage(
                                    widget.image,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: textField('-- Meter Type', 'Meter Type',
                                    _meterTypeController),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: textFieldNumber('-- Meter Number',
                                    ' Meter Number', _controller, 'x'),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: textFieldNumber('-- Amount', 'Amount',
                                    _amountController, 'x'),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: textFieldPhoneNumber('-- Customer Phone',
                                    'Customer Phone', _phoneController),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Consumer<PurchaseProvider>(
                                builder: (context, value, child) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    if (value.regMessage != '') {
                                      successMessage(
                                          message: value.regMessage,
                                          x: value.color,
                                          context: context);

                                      value.clear();
                                    }
                                  });
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xff373737),
                                                    Color(0xff6A6A6A),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                )),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                if (_controller.text == '' ||
                                                    _meterTypeController.text ==
                                                        '' ||
                                                    _amountController.text ==
                                                        '' ||
                                                    _phoneController.text == '') {
                                                  warning(
                                                      message:
                                                          'fields can\'t be empty',
                                                      context: context);
                                                } else {
                                                  showDialog<bool>(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Confirm Purchase'),
                                                          content: Text(
                                                              'your about to validate and make purchase of ${_meterTypeController.text}  for #${_amountController.text}'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                value.validateMeterNumber(
                                                                    number:
                                                                        _controller
                                                                            .text
                                                                            .trim(),
                                                                    type: _meterTypeController
                                                                        .text
                                                                        .trim(),
                                                                    disco: widget
                                                                        .name,
                                                                    amount:
                                                                        _amountController
                                                                            .text
                                                                            .trim(),
                                                                    context:
                                                                        context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                }
                                                // () async {
                                                     
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  foregroundColor: kWhite,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  )),
                                              child: value.isLoading
                                                  ? const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Loading please wait...',
                                                          style: TextStyle(
                                                              color: kWhite),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      'VALIDATE AND PURCHASE',
                                                      style: TextStyle(
                                                          fontSize: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              1.5,
                                                          color: kWhite),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
