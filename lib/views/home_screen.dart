// import 'package:animated_radial_menu/animated_radial_menu.dart';
// import 'package: marquee/marquee.dart';
// ignore_for_file: prefer_typing_uninitialized_variables
import '../widget/snackbar.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/firebase_options.dart';
import 'package:databank/views/add_money.dart';
import 'package:databank/views/airtime_top_up.dart';
import 'package:databank/views/app_layout.dart';
import 'package:databank/views/cable_subscription.dart';
import 'package:databank/views/history.dart';
import 'package:databank/views/result_checker.dart';
import 'package:databank/views/scan_to_load.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import '../backend/provider/user_details/user_details.dart';
import '../customizations/size_config.dart';
import '../model/electric_bill.dart';
import '../model/vtu_operations.dart';
import '../widget/drawer_widget.dart';
// import 'data_pin.dart';
import 'data_top_up.dart';
import 'electric_bill_expanded.dart';
import 'electric_bill_payment.dart';
// import 'log_in.dart';
import 'recharge_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        name: 'Recharge Card \n not available',
        screen: const RechargeCard()),
    VtuOperations(
        svg: 'assets/images/data-pin.png',
        name: 'Data Pin \n not available',
        // screen: const DataPin(),
        screen: AlertDialog(
          title: const Text('Currently Unavailable'),
          content: const Text(
              'the page your trying to access isn\'t available at the moment but we\'re working on it \n properbly will be available on the next release. Before then you can as well checkout our other services available at your disposal. \' With Love From Data Bank😍'),
          actions: [
            TextButton(
              onPressed: () {
                const AppLayout();
              },
              child: const Text('Ok'),
            ),
          ],
        )),
    VtuOperations(
        svg: 'assets/images/cable.jpg',
        name: 'Cable Subscription',
        screen: const CableSubscription()),
    VtuOperations(
        svg: 'assets/images/graduation-cap.png',
        name: 'Result Checker',
        screen: ResultChecker()),
    VtuOperations(
        svg: 'assets/images/data-pin.png',
        name: 'Scan to Load Card',
        screen: const ScanToLoad()),
    VtuOperations(
        svg: 'assets/images/metaverse.png',
        name: 'Airtime To Cash \n not available',
        screen: AlertDialog(
          title: const Text('Currently Unavailable'),
          content: const Text(
              'the page your trying to access isn\'t available at the moment but we\'re working on it \n properbly will be available on the next release. Before then you can as well checkout our other services available at your disposal. \' With Love From Data Bank😍'),
          actions: [
            TextButton(
              onPressed: () {
                const AppLayout();
              },
              child: const Text('Ok'),
            ),
          ],
        )),
    VtuOperations(
        svg: 'assets/images/metaverse.png',
        name: 'Bulk SMS \n not available',
        screen: AlertDialog(
          title: const Text('Currently Unavailable'),
          content: const Text(
              'the page your trying to access isn\'t available at the moment but we\'re working on it \n properbly will be available on the next release. Before then you can as well checkout our other services available at your disposal. \' With Love From Data Bank😍'),
          actions: [
            TextButton(
              onPressed: () {
                const AppLayout();
              },
              child: const Text('Ok'),
            ),
          ],
        )),
  ];

  bool _showBal = true;
  var username;
  var balance;
  var devicToken;
  var devicePlatform;
  void gatherData() async {
    username = await DataBaseProvider().getUserName();
    balance = await UserDetails().getUserAccountBalanace();
    print("balance is $balance check2");
    print("user name is $username check2");
  }

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    //  final balance1 = Provider.of<UserDetails>(context, listen: false);
    final balancex = gatherBalance();

    setState(() {
      balance = balancex;
    });

    final usernamex = gatherUserName();
    Balance();
    setState(() {
      username = usernamex;
    });

    final baln = Provider
        .of<UserDetails>(context, listen: false)
        .getUserAccountBalanace();
    // UserDetails().getUserAccountBalanace().then((balance) {
    //   print("balance is $balance check3.3");
    // });

    // setState(() {
    //   // username = await DataBaseProvider().getUserName();
    //   // balance = await UserDetails().getUserAccountBalanace();
    //   print("balance is $balance check2");
    // });
    // print("balance is $balance check3");

// to be uncommented when the dependency in installed!!!
    FirebaseMessaging.instance.getToken().then((token) {
      print('device token is $token check1');
      final platform = DefaultFirebaseOptions.currentPlatform;
      UserDetails().createOrUpdateDeviceTokenAndPlatform(
          platform: platform, token: token);
      print('device token is $token sent');
      sendTokenAndPlatform(platform, token);
    });

// uncomment the above code when the criterial are meant!!!
  }

  Future<String> gatherUserName() async {
    final usernamex = await DataBaseProvider().getUserName();
    // setState(() {
    //   username = usernamex;
    // });
    print("user name is $username method");
    return usernamex;
  }

// final balance =
  Future<String> gatherBalance() async {
    final balancex = await UserDetails().getUserAccountBalanace();
    // setState(() {
    //   balance = balancex;
    // });
    print("balance is $balance method");
    return balancex;
  }

  Future<void> Balance() {
    final bal = gatherBalance();
    setState(() {
      balance = bal;
    });
    return balance;
  }

  Future<bool> sendTokenAndPlatform(dynamic token, dynamic platform) async {
    return await UserDetails()
        .createOrUpdateDeviceTokenAndPlatform(platform: platform, token: token);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final baln = Provider.of<UserDetails>(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.99),
      appBar: AppBar(
        leading: DrawerMenueWidget(
          onClicked: widget.openDrawer,
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
              Icons.support_agent_outlined,
              color: kWhite,
            ),
          ),
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
          statusBarIconBrightness: Brightness.light,
          // statusBarColor: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return await Balance();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.blockSizeVertical! * 63,
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
                          'Hello,$username 👋',
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
                        top: 50,
                        right: SizeConfig.blockSizeHorizontal! * 10,
                        left: SizeConfig.blockSizeHorizontal! * 10,
                        child: Column(
                          children: [
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    color: kWhite,
                                    icon: _showBal
                                        ? const Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                          )
                                        : const Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        _showBal = !_showBal;
                                      });
                                    },
                                  ),
                                  // FutureBuilder<String>(
                                  //   future: balance.getUserAccountBalanace(),
                                  //   builder: (context, snapshot) {
                                  //     if (snapshot.connectionState ==
                                  //         ConnectionState.done) {
                                  //       if (snapshot.hasError) {
                                  //         const Text('An error occured');
                                  //       } else if (snapshot.hasData) {
                                  //         return RichText(
                                  //           text: TextSpan(
                                  //               text: _showBal ? '#' : null,
                                  //               style: kEncodeSansBold.copyWith(
                                  //                   color: kWhite,
                                  //                   fontSize: SizeConfig
                                  //                           .blockSizeHorizontal! *
                                  //                       2.5),
                                  //               children: <TextSpan>[
                                  //                 TextSpan(
                                  //                   text: _showBal
                                  //                       ? snapshot.data!
                                  //                       : '*****',
                                  //                   style: kEncodeSansBold.copyWith(
                                  //                       color: kWhite,
                                  //                       fontSize: SizeConfig
                                  //                               .blockSizeHorizontal! *
                                  //                           2.5),
                                  //                 ),
                                  //               ]),
                                  //         );
                                  //       }
                                  //     } else {
                                  //       return const SpinKitWave(
                                  //         color: kDarkGrey,
                                  //         size: 25,
                                  //       );
                                  //     }
                                  //     return const SpinKitWave(
                                  //       color: kYellow,
                                  //     );
                                  //   },
                                  // ),

                                  // FutureBuilder<String>(
                                  //   future: balance.getUserAccountBalanace(),
                                  //   builder: (context, snapshot) {
                                  //     if (snapshot.connectionState ==
                                  //         ConnectionState.done) {
                                  //       if (snapshot.hasError) {
                                  //         const Text('An error occured');
                                  //       } else if (snapshot.hasData) {

                                  //       }
                                  //     } else {
                                  //       return const SpinKitWave(
                                  //         color: kDarkGrey,
                                  //         size: 25,
                                  //       );
                                  //     }
                                  //     return const SpinKitWave(
                                  //       color: kYellow,
                                  //     );
                                  //   },
                                  // ),
                                  Consumer<UserDetails>(
                                    builder: (context, value, child) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        if (value.reqMessage != '') {
                                          successMessage(
                                              message: value.reqMessage,
                                              x: value.color,
                                              context: context);

                                          value.clear();
                                        }
                                      });
                                      if (value.isLoading) {
                                        const SpinKitWave(
                                          color: kDarkGrey,
                                          size: 25,
                                        );
                                      }
                                      return RichText(
                                        text: TextSpan(
                                            text: _showBal ? '#' : null,
                                            style: kEncodeSansBold.copyWith(
                                                color: kWhite,
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    2.5),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: _showBal
                                                    ? value.balance
                                                    : '*****',
                                                style: kEncodeSansBold.copyWith(
                                                    color: kWhite,
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        2.5),
                                              ),
                                            ]),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
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
                          top: 50,
                          right: SizeConfig.blockSizeHorizontal! * 10,
                          left: SizeConfig.blockSizeHorizontal! * 10,
                          child: SpinKitPulse(
                            color: kWhite.withOpacity(0.5),
                            size: 300,
                          )),
                      Positioned(
                        right: 24,
                        left: 24,
                        bottom: SizeConfig.blockSizeVertical! * 22,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            color: Colors.transparent,
                            width: double.infinity,
                            height: SizeConfig.blockSizeVertical! * 17.5,
                            child: Column(
                              children: [
                                Text(
                                  'Anouncement!',
                                  style: kEncodeSansMedium.copyWith(
                                      color: kWhite,
                                      fontSize:
                                          SizeConfig.blockSizeVertical! * 2.2),
                                ),
                                const Divider(
                                  color: kYellow,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.notifications,
                                      color: kYellow,
                                    ),
                                    SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 48,
                                      height:
                                          SizeConfig.blockSizeHorizontal! * 2,
                                      child: Marquee(
                                        scrollAxis: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        blankSpace: 30.0,
                                        velocity: 50.0,
                                        startPadding: 42.0,
                                        accelerationDuration:
                                            const Duration(seconds: 1),
                                        accelerationCurve: Curves.linear,
                                        decelerationDuration:
                                            const Duration(milliseconds: 500),
                                        decelerationCurve: Curves.easeOut,
                                        text:
                                            'MTN Network is now back online you can now resume transactions!!!',
                                        style: kEncodeSansRegular.copyWith(
                                          color: kWhite,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  1.5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: kYellow,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Active Networks:',
                                      style: kEncodeSansMedium.copyWith(
                                          color: kWhite,
                                          fontSize:
                                              SizeConfig.blockSizeVertical! *
                                                  1.5),
                                    ),
                                    Stack(
                                      clipBehavior: Clip.none,
                                      // alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal! *
                                                  6,
                                          height:
                                              SizeConfig.blockSizeHorizontal! *
                                                  6,
                                          child: Image.asset(
                                              'assets/images/glo.png'),
                                        ),
                                        Positioned(
                                          right: 30,
                                          child: SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            height: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Image.asset(
                                                    'assets/images/9mobile.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 60,
                                          child: SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            height: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  'assets/images/airtel.png'),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 85,
                                          child: SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            height: SizeConfig
                                                    .blockSizeHorizontal! *
                                                6,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.green,
                                                child: Image.asset(
                                                    'assets/images/mtn.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CupertinoPageRoute(
                                            builder: (context) =>
                                                const AddMoney(),
                                          ));
                                        },
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal! *
                                                  7,
                                          height:
                                              SizeConfig.blockSizeVertical! * 7,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kWhite,
                                          ),
                                          child: const Icon(
                                            Icons
                                                .account_balance_wallet_rounded,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Add Fund',
                                        style: kEncodeSansMedium.copyWith(
                                            color: kBrown,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context)
                                          //     .push(CupertinoPageRoute(
                                          //   builder: (context) =>
                                          //       const OnboardingPage(),
                                          // ));
                                          // value.getUserAccountBalanace();
                                        },
                                        child: Container(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                7,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    7,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kWhite,
                                            ),
                                            child: const Icon(
                                                Icons.line_weight_outlined)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Upgrade To Reseller',
                                        style: kEncodeSansMedium.copyWith(
                                            color: kBrown,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(CupertinoPageRoute(
                                            builder: (context) => HistoryScreen(
                                              openDrawer: widget.openDrawer,
                                            ),
                                          ));
                                        },
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal! *
                                                  7,
                                          height:
                                              SizeConfig.blockSizeVertical! * 7,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kWhite,
                                          ),
                                          child: const Icon(
                                            Icons.history,
                                            color: kBlue,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'History',
                                        style: kEncodeSansMedium.copyWith(
                                            color: kBrown,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5),
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
                          CupertinoPageRoute(
                              builder: (context) => bill.screen!)),
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
                        Navigator.of(context).push(CupertinoPageRoute(
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
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ElectricBillPayment(
                                image: bill1.image, name: bill1.name),
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
      ),
    );
  }
}

final currentTime = DateTime.now();
