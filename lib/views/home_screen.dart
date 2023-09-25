import 'package:databank/customizations/app_style.dart';
import 'package:databank/views/add_money.dart';
import 'package:databank/views/airtime_top_up.dart';
import 'package:databank/views/cable_subscription.dart';
import 'package:databank/views/history.dart';
import 'package:databank/views/result_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../customizations/size_config.dart';
import '../model/electric_bill.dart';
import '../model/vtu_operations.dart';
import '../widget/drawer_widget.dart';
import 'animated_drawer.dart';
import 'data_pin.dart';
import 'data_top_up.dart';
import 'electric_bill_expanded.dart';
import 'electric_bill_payment.dart';
import 'onboarding_page.dart';
import 'recharge_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  final List<ElectricBills> opeSvg = <ElectricBills>[
    ElectricBills(image: 'assets/images/AEDC.png', name: 'AEDC'),
    ElectricBills(image: 'assets/images/EEDC.png', name: 'EEDC'),
    ElectricBills(image: 'assets/images/EKEDC.png', name: 'EKEDC'),
  ];

  final List<ElectricBills> opeSvg1 = <ElectricBills>[
    ElectricBills(image: 'assets/images/AEDC.png', name: 'AEDC'),
    ElectricBills(image: 'assets/images/EEDC.png', name: 'EEDC'),
    ElectricBills(image: 'assets/images/EKEDC.png', name: 'EKEDC'),
    ElectricBills(image: 'assets/images/IBEDC.png', name: 'IBEDC'),
    ElectricBills(image: 'assets/images/IKEDC.png', name: 'IKEDC'),
    ElectricBills(image: 'assets/images/JED.png', name: 'JED'),
    ElectricBills(image: 'assets/images/KAEDCO.png', name: 'KAEDCO'),
    ElectricBills(image: 'assets/images/PHED.png', name: 'PHED'),
    ElectricBills(image: 'assets/images/KAEDCO (1).png', name: 'KAEDCO (1)'),
  ];

  final List<VtuOperations> vtuOpe = [
    VtuOperations(
        svg: 'assets/images/data.jpg',
        name: 'Data TopUp',
        screen: const DataTopUp()),
    VtuOperations(
        svg: 'assets/images/contact-list.png',
        name: 'Airtime TopUp',
        screen: const AirtimeTopUp()),
    VtuOperations(
        svg: 'assets/images/recharge-card-printer.png',
        name: 'Recharge Card',
        screen: const RechargeCard()),
    VtuOperations(
        svg: 'assets/images/data-pin.png',
        name: 'Data Pin',
        screen: const DataPin()),
    VtuOperations(
        svg: 'assets/images/cable.jpg',
        name: 'Cable Subscription',
        screen: const CableSubscriptiopn()),
    VtuOperations(
        svg: 'assets/images/graduation-cap.png',
        name: 'Result Checker',
        screen: const ResultChecker()),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.99),
      appBar: AppBar(
        leading: DrawerMenueWidget(
          onClicked: openDrawer,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: kWhite),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff6A6A6A),
            Color.fromARGB(255, 79, 78, 78),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        elevation: 0,
        shadowColor: const Color.fromARGB(0, 255, 255, 255)..withOpacity(0.9),
        backgroundColor:
            const Color.fromARGB(0, 255, 255, 255).withOpacity(0.9),
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
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                width: double.infinity,
                height: SizeConfig.blockSizeVertical! * 55,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
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
                      top: 18,
                      left: 24,
                      child: Text(
                        'Hello,Daniel Ekwere',
                        style: kEncodeSansMedium.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.6),
                      ),
                    ),
                    Positioned(
                      top: 18,
                      right: 24,
                      child: Text(
                        DateFormat('dd MMM,yyyy.').format(currentTime),
                        style: kEncodeSansMedium.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.6),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: SizeConfig.blockSizeHorizontal! * 20,
                      // left: 115,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: '#',
                                      style: kEncodeSansBold.copyWith(
                                          color: kWhite,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  1.8),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '500.0',
                                          style: kEncodeSansBold.copyWith(
                                              color: kWhite,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.5),
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.remove_red_eye,
                                  color: kWhite,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          Text(
                            'Available Balance',
                            style: kEncodeSansRegular.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 1.5),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 170,
                      right: 24,
                      child: Text(
                        'DANIEL EKWERE',
                        style: kEncodeSansMedium.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.6),
                      ),
                    ),
                    Positioned(
                      top: 38,
                      left: 25,
                      child: Image.asset(
                        'assets/images/style.png',
                        width: SizeConfig.blockSizeHorizontal! * 20,
                        height: SizeConfig.blockSizeVertical! * 17,
                        scale: 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 195,
                      right: 24,
                      child: Text(
                        '50: charge',
                        style: kEncodeSansMedium.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.6),
                      ),
                    ),
                    Positioned(
                      top: 158,
                      left: 24,
                      child: Row(
                        children: [
                          Text(
                            'Acct No:1234567890.',
                            style: kEncodeSansMedium.copyWith(
                                color: kWhite,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 1.6),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy,
                              color: kWhite,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 195,
                      left: 24,
                      child: Text(
                        'GT Bank',
                        style: kEncodeSansMedium.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.6),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      right: -5,
                      child: Image.asset(
                        'assets/images/styles2.png',
                        width: SizeConfig.blockSizeHorizontal! * 20,
                        height: SizeConfig.blockSizeVertical! * 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 24,
                      left: 24,
                      bottom: 24,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0XffD9D9D9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          width: double.infinity,
                          height: SizeConfig.blockSizeVertical! * 15,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const AddMoney(),
                                        ));
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal! * 7,
                                        height:
                                            SizeConfig.blockSizeVertical! * 7,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kWhite,
                                        ),
                                        child: const Icon(
                                          Icons.account_balance_wallet_rounded,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'add Fund',
                                      style: kEncodeSansRegular.copyWith(
                                          color: kBrown,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.1),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => HistoryScreen(
                                            openDrawer: openDrawer,
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal! * 7,
                                        height:
                                            SizeConfig.blockSizeVertical! * 7,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kWhite,
                                        ),
                                        child: const Icon(
                                          Icons.history,
                                          color: kYellow,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'history',
                                      style: kEncodeSansRegular.copyWith(
                                          color: kBrown,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.1),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const OnboardingPage(),
                                        ));
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal! * 7,
                                        height:
                                            SizeConfig.blockSizeVertical! * 7,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kWhite,
                                        ),
                                        child: const Icon(
                                          Icons.support_agent_outlined,
                                          color: kBlue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Chat Us',
                                      style: kEncodeSansRegular.copyWith(
                                          color: kBrown,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Operations',
                  style: kEncodeSansBold.copyWith(
                      color: kBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5 / 3.6,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: vtuOpe.length,
                itemBuilder: (context, index) {
                  final bill = vtuOpe[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => bill.screen!)),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal! * 8,
                      height: SizeConfig.blockSizeVertical! * 15,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        boxShadow: [
                          BoxShadow(
                            color: kBrown.withOpacity(0.08),
                            spreadRadius: -4.0,
                            blurRadius: 19.0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 13,
                            height: SizeConfig.blockSizeVertical! * 12,
                            child: Image.asset(
                              bill.svg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Text(
                            bill.name,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    'Electric Bill',
                    style: kEncodeSansBold.copyWith(
                        color: kBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ElectricExpanded(),
                      ));
                    },
                    child: Text(
                      'See All',
                      style: kEncodeSansBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 1.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: opeSvg.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final bill1 = opeSvg[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ElectricBillPayment(image: bill1.image),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                  style: kEncodeSansRegular.copyWith(
                                    color: kBlack,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2.5,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}

final currentTime = DateTime.now();
