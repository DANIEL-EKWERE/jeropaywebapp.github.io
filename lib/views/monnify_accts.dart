import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';

class MonnifyAccts extends StatefulWidget {
  const MonnifyAccts({super.key});

  @override
  State<MonnifyAccts> createState() => _MonnifyAcctsState();
}

enum MenuAction { info }

class _MonnifyAcctsState extends State<MonnifyAccts> {
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
                height: sizeVertical * 35,
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
                    SizedBox(
                        width: sizeHorizontal * 5,
                        height: sizeHorizontal * 5,
                        child: Image.asset('assets/images/Monnify - logo.png')),
                    SizedBox(
                      height: sizeVertical * 2,
                    ),
                    const Text(
                      'Send money to one of these accounts, and you\'ll be credited automatically. \n thanks for using DataBank, with love from monnify!!! \n\n a Transaction fee however for Automatic Funding is #50 you can wactch a short video ads to pay #30 instead!',
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
                  'Select Acct to fund and start using the DATABANK app'),
              SizedBox(
                height: sizeVertical * 3,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Watch ADS -#20'),
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  color: kGrey,
                  onPressed: () {
                    showInfoDialogue(context);
                  },
                ),
              ]),
              SizedBox(
                height: sizeVertical * 3,
              ),
              Container(
                width: double.infinity,
                height: sizeVertical * 50,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
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

  Future<bool?> showInfoDialogue(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const Text(
                'By watching a short vidoe ads you have the previleged to pay a transaction fee of #30 only, this priviledge last only for 4hours, then you can watch again!'),
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
