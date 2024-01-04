import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../customizations/size_config.dart';
import 'package:databank/customizations/app_style.dart';

import '../model/electric_bill.dart';
import '../widget/fab.dart';
import 'electric_bill_payment.dart';

class ElectricExpanded extends StatefulWidget {
  const ElectricExpanded({super.key});

  @override
  State<ElectricExpanded> createState() => _ElectricExpandedState();
}

class _ElectricExpandedState extends State<ElectricExpanded> {
  final List<ElectricBills> opeSvg1 = <ElectricBills>[
    ElectricBills(image: 'assets/images/AEDC.png', name: 'Abuja Electric'),
    ElectricBills(image: 'assets/images/EEDC.png', name: 'Enugu Electric'),
    ElectricBills(image: 'assets/images/EKEDC.png', name: 'Eko Electric'),
    ElectricBills(image: 'assets/images/IBEDC.png', name: 'Ibandan Electric'),
    ElectricBills(image: 'assets/images/IKEDC.png', name: 'Ikeja Electric'),
    ElectricBills(image: 'assets/images/JED.png', name: 'Jos Electric'),
    ElectricBills(image: 'assets/images/KAEDCO.png', name: 'Kaduna Electric'),
    ElectricBills(image: 'assets/images/PHED.png', name: 'Port Harcourt Electric'),
    ElectricBills(image: 'assets/images/KAEDCO (1).png', name: 'Benin Electric'),
    ElectricBills(image: 'assets/images/KAEDCO (1).png', name: 'Yola Electric'),
    ElectricBills(image: 'assets/images/KAEDCO (1).png', name: 'Kano Electric'),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: fab(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal! * 6,
                      height: SizeConfig.blockSizeVertical! * 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kWhite,
                          boxShadow: [
                            BoxShadow(
                              color: kBrown.withOpacity(0.10),
                              spreadRadius: -1.0,
                              blurRadius: 9.0,
                              offset: const Offset(0, 5),
                            )
                          ]),
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 49,
              ),
              Text('Electricity Bill',
                  style: kEncodeSansSemiBold.copyWith(
                    color: kDarkBrown,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  )),
              const SizedBox(
                height: 18,
              ),
              Text(
                  'List of various power supplying company in nigeria for bill payments',
                  style: kEncodeSansSemiBold.copyWith(
                    color: kBlack,
                    fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                  )),
              const SizedBox(
                height: 34,
              ),
              ListView.builder(
                  itemCount: opeSvg1.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final bill1 = opeSvg1[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) =>
                              ElectricBillPayment(image: bill1.image, name: bill1.name),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        padding: const EdgeInsets.symmetric(horizontal: 29),
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                color: kBrown.withOpacity(0.10),
                                spreadRadius: 0.0,
                                blurRadius: 12.0,
                                offset: const Offset(0, 5),
                              )
                            ]),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(bill1.image),
                                  width: SizeConfig.blockSizeHorizontal! * 15,
                                  height: SizeConfig.blockSizeVertical! * 15,
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                Text(
                                  bill1.name,
                                  style: kEncodeSansSemiBold.copyWith(
                                    color: kBlack,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 1.5,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
