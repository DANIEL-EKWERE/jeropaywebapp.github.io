import 'package:databank/customizations/app_style.dart';
import 'package:databank/views/send_proof.dart';
import 'package:flutter/cupertino.dart';
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
                      'Send money to the designated account, then send payment prove to the us, and you\'ll be credited as soon as we verify your payment. \n\n thanks for using Jero Pay🤝!!! ',
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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     Color(0xff373737),
                          //     Color.fromARGB(255, 135, 135, 135),
                          //   ],
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          // )
                          color: purple
                          ),
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => SendPaymentProofToAdmin(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: kWhite,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text(
                          'Send Payment Prove',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                              color: kWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                         color: purple
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Bank Name: ',
                              style: kEncodeSansMedium.copyWith(
                                 color: purple,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Opay',
                                  style: kEncodeSansBold.copyWith(
                                     color: purple,
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
                          color: purple,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Acct Name: ',
                              style: kEncodeSansMedium.copyWith(
                                  color: purple,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'EFE JERO',
                                  style: kEncodeSansBold.copyWith(
                                      color: purple,
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
                          color: purple,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Acct No.: ',
                              style: kEncodeSansMedium.copyWith(
                                  color: purple,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '7013715767',
                                  style: kEncodeSansBold.copyWith(
                                      color: purple,
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
