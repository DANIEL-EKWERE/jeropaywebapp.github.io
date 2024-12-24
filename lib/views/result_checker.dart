import 'package:databank/backend/provider/purchase_provider/purchases_provider.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/fab.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultChecker extends StatefulWidget {
  ResultChecker({
    super.key,
  });

  @override
  State<ResultChecker> createState() => _ResultCheckerState();
}

class _ResultCheckerState extends State<ResultChecker> {
  bool _numberInputIsValid = true;
  List<String> categories = ['MTN', 'AIRTEL', 'GLO', '9 MOBILE'];
  List<String> subCategory = ['WAEC', 'NECO'];
  String? selectedValue;
  String? selectedValue2;
  final Uri url = Uri.parse('https://wa.link/q07ccc');
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
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
            backgroundColor: purple,
            backgroundImage: AssetImage('assets/images/pic-2.png'),
          ),
          const SizedBox(
            width: 24,
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
               Color(0xFFB0FFC1),
                    Color(0xFFB3C2FF),
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
                                 Color(0xFFB0FFC1),
                    Color(0xFFB3C2FF),
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
                              'Hello,\nDaniel Ekwere',
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
                              '#500.00',
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
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Result Checker',
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
                                    border: Border.all(width: 5, color: purple),
                                    shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: purple,
                                  backgroundImage: AssetImage(
                                    'assets/images/graduation-cap.png',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
// adding codes here

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: DropdownButtonFormField<String>(
                                  value: selectedValue,
                                  items: categories.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                       enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select a network',
                                    labelStyle: kEncodeSansSemiBold.copyWith(
                                        color: purple,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.0),
                                    hintStyle: kEncodeSansSemiBold.copyWith(
                                        color: kLightGrey,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.0),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kBrown,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: sizeVertical * 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: DropdownButtonFormField<String>(
                                  value: selectedValue2,
                                  items: subCategory.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                       enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select an amount',
                                    labelStyle: kEncodeSansSemiBold.copyWith(
                                        color: purple,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.0),
                                    hintStyle: kEncodeSansSemiBold.copyWith(
                                        color: kLightGrey,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.0),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kBrown,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: sizeVertical * 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: TextField(
                                  controller: _phoneController,
                                  maxLength: 11,
                                  // scrollPhysics: const BouncingScrollPhysics(),
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                       enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                                    prefixIcon: const IconTheme(
                                        data: IconThemeData(color: purple),
                                        child: Icon(Icons.phone)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 18),
                                    hintText: 'Enter quantity',
                                    label: Text(
                                      'Enter quantity',
                                      style: kEncodeSansSemiBold.copyWith(
                                          color: purple,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.0),
                                    ),
                                    errorText: _numberInputIsValid
                                        ? null
                                        : 'please enter a valid phone number!',
                                    focusedBorder: kInputBorder,
                                    border: kInputBorder,
                                    filled: true,
                                    fillColor: kLightGrey,
                                  ),
                                  onChanged: (value) {
                                    final v = int.tryParse(value);
                                    if (v == null) {
                                      setState(() {
                                        _numberInputIsValid = false;
                                      });
                                    } else {
                                      setState(() {
                                        _numberInputIsValid = true;
                                      });
                                    }
                                  },
                                ),
                              ),

// code added above
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
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
                                                purple,purple
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              )),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (selectedValue == '' ||
                                                  selectedValue2 == '' ||
                                                  _phoneController.text == '') {
                                                warning(
                                                    message:
                                                        'fields can\'t be empty!!!',
                                                    context: context);
                                              } else {
                                                showDialog<bool>(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Confirm Purchase'),
                                                        content: Text(
                                                            'Your about to purchase $selectedValue2 of $selectedValue for ${_phoneController.text}'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              showDialog<
                                                                        bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                          title: const Text(
                                                                              'Service Unavailable'),
                                                                          content:
                                                                              Text('The service you seek is currently unavailable, please contact admin to place the order manaully!!!'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () async {
                                                                                if (!await launchUrl(url)) {
                                                                                  throw Exception('could\'t load link $url');
                                                                                }
                                                                              },
                                                                              child: Text('ok'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () async {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Text('No'),
                                                                            )
                                                                          ]);
                                                                    });

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
                                                    'Purchase EPin',
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            2.5,
                                                        color: kWhite),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                                  // child:
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
