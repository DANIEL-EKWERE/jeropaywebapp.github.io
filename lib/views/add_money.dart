import 'package:databank/customizations/size_config.dart';
import 'package:databank/views/payvessel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../customizations/app_style.dart';
import 'Manual_funding.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
        elevation: 0,
        shadowColor: const Color.fromARGB(255, 235, 227, 227).withOpacity(0.1),
        backgroundColor:
            const Color.fromARGB(0, 255, 255, 255).withOpacity(0.9),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text('Notification Centre'),
                        content: Text(
                            'You currently do not have any notifications for now, please check back later!!!'),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: Text('ok'),
                          )
                        ]);
                  });
            },
            icon: const Icon(
              Icons.notifications,
              color: kBlack,
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
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: sizeVertical * 3,
          ),
          // const Image(
          //     image: AssetImage('assets/images/add money svg.png'),
          //     fit: BoxFit.cover),
          // SizedBox(
          //   height: sizeVertical * 3,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add money to your wallet',
                style: kEncodeSansSemiBold.copyWith(
                    color: kGrey,
                    fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 74.0),
                child: Text(
                  'Select from these list of options and add money to your wallet',
                  style: kEncodeSansRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizeVertical * 3,
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const BouncingScrollPhysics(),
          //   itemCount: payment.length,
          //   itemBuilder: (context, index) {
          //     Payment pay = payment[index];

          //   },
          // )

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).push(
          //         CupertinoPageRoute(
          //           builder: (context) => const MonnifyAccts(),
          //         ),
          //       );
          //     },
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 24,
          //           ),
          //           width: double.infinity,
          //           height: SizeConfig.blockSizeVertical! * 13,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: kWhite,
          //               boxShadow: [
          //                 BoxShadow(
          //                   blurRadius: 10,
          //                   spreadRadius: 2,
          //                   color: kGrey.withOpacity(0.2),
          //                   offset: const Offset(0, 5),
          //                 )
          //               ]),
          //           child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 SizedBox(
          //                   width: sizeVertical * 5,
          //                   height: sizeVertical * 5,
          //                   child: const Image(
          //                     image: AssetImage(
          //                         'assets/images/Monnify - logo.png'),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: sizeVertical * 3,
          //                 ),
          //                 const Text('Monnify'),
          //               ]),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const Payvessel(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical! * 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: kGrey.withOpacity(0.2),
                            offset: const Offset(0, 5),
                          )
                        ]),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: sizeVertical * 5,
                            height: sizeVertical * 5,
                            child: const Image(
                              image: AssetImage('assets/images/payvessel.png'),
                            ),
                          ),
                          SizedBox(
                            width: sizeVertical * 3,
                          ),
                          const Text('Payvessel'),
                        ]),
                  ),
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          //   child: GestureDetector(
          //     onTap: () {
          //       showModalBottomSheet(
          //           //  showDragHandle: true,
          //           isDismissible: false,
          //           isScrollControlled: true,
          //           // anchorPoint: const Offset(5, 50),
          //           useSafeArea: true,
          //           context: context,
          //           builder: (context) => const PaymentScreen(
          //                 name: 'PayStack',
          //                 image: 'assets/images/paystack.png',
          //               ));
          //     },
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 24,
          //           ),
          //           width: double.infinity,
          //           height: SizeConfig.blockSizeVertical! * 13,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: kWhite,
          //               boxShadow: [
          //                 BoxShadow(
          //                   blurRadius: 10,
          //                   spreadRadius: 2,
          //                   color: kGrey.withOpacity(0.2),
          //                   offset: const Offset(0, 5),
          //                 )
          //               ]),
          //           child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 SizedBox(
          //                   width: sizeVertical * 5,
          //                   height: sizeVertical * 5,
          //                   child: const Image(
          //                     image: AssetImage('assets/images/paystack.png'),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: sizeVertical * 3,
          //                 ),
          //                 const Text('PayStack'),
          //               ]),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const ManualFunding(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical! * 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: kGrey.withOpacity(0.2),
                            offset: const Offset(0, 5),
                          )
                        ]),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wallet,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: sizeVertical * 3,
                          ),
                          const Text('Manual Funding'),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
