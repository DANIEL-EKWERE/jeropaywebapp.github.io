import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/button.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';

class ManualFunding extends StatefulWidget {
  const ManualFunding({super.key});

  @override
  State<ManualFunding> createState() => _ManualFundingState();
}

class _ManualFundingState extends State<ManualFunding> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: sizeVertical * 25,
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
                      height: sizeVertical * 2,
                    ),
                    const Icon(
                      Icons.wallet,
                      color: Colors.green,
                      size: 40,
                    ),
                    SizedBox(
                      height: sizeVertical * 1,
                    ),
                    const Text(
                      'Send money to the designated account, then send payment prove to the us, and you\'ll be credited as soon as we verify your payment. \n\n thanks for using DataBank🤝!!! ',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeVertical * 3,
              ),
              const Text(
                  'PLEASE NOTE,THE MINIMUM WALLET FUNDING VIA MANUAL FUNDING/TRANSFER/DEPOSIT IS #3000.'),
              SizedBox(
                height: sizeVertical * 3,
              ),
              button(text1:'Send Payment Prove',isLoading1:false, tap:(){}),
              SizedBox(
                height: sizeVertical * 3,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                width: double.infinity,
                height: sizeVertical * 29,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.home_filled,
                          color: kGrey,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Bank Name: ',
                              style: kEncodeSansMedium.copyWith(
                                  color: kGrey,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Opay',
                                  style: kEncodeSansBold.copyWith(
                                      color: kGrey,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              2.8),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeVertical * 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: kGrey,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Acct Name: ',
                              style: kEncodeSansMedium.copyWith(
                                  color: kGrey,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Daniel Ekwere',
                                  style: kEncodeSansBold.copyWith(
                                      color: kGrey,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              2.8),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.confirmation_number,
                          color: kGrey,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Acct No.: ',
                              style: kEncodeSansMedium.copyWith(
                                  color: kGrey,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '7034194111',
                                  style: kEncodeSansBold.copyWith(
                                      color: kGrey,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              2.8),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 2.5,
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
    );
  }
}
