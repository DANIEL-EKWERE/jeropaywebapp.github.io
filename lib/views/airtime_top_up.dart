import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/backend/provider/purchase_provider/purchases_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/fab.dart';
import '../widget/snackbar.dart';

class AirtimeTopUp extends StatefulWidget {
  const AirtimeTopUp({
    super.key,
  });

  @override
  State<AirtimeTopUp> createState() => _AirtimeTopUpState();
}

class _AirtimeTopUpState extends State<AirtimeTopUp> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _phoneController.dispose();
  }

  bool _numberInputIsValid = true;
  List<String> categories = ['MTN', 'AIRTEL', 'GLO', '9 MOBILE'];
  Map<String, List<String>> subcategories = {
    'MTN': ['MTN(SME1)', 'MTN(SME2)', 'MTN(GIFTING)', 'MTN(COPORATE)'],
    'AIRTEL': [
      'AIRTEL(SME1)',
      'AIRTEL(SME2)',
      'AIRTEL(GIFTING)',
      'AIRTEL(COPORATE)'
    ],
    'GLO': ['GLO(SME1)', 'GLO(SME2)', 'GLO(GIFTING)', 'GLO(COPORATE)'],
    '9 MOBILE': [
      '9 MOBILE(SME1)',
      '9 MOBILE(SME2)',
      '9 MOBILE(GIFTING)',
      '9 MOBILE(COPORATE)'
    ],
  };

  String? selectedValue;
  List<String> dropdownItems = [
    'MTN',
    'AIRTEL',
    'GLO',
    '9 MOBILE',
  ];

  String? selectedValue2;
  List<String> dropdownItems2 = [
    '#50',
    '#100',
    '#200',
    '#500',
    '#1000',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    //   double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
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
            statusBarIconBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
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
                              'Hello,\nDaniel Ekwere.',
                              style: kEncodeSansRegular.copyWith(
                                color: kWhite,
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
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
                          height: SizeConfig.blockSizeVertical! * 105,
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
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Airtime Top Up',
                                        style: kEncodeSansSemiBold.copyWith(
                                            color: kBlack,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.3),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        height:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        width:
                                            SizeConfig.blockSizeVertical! * 15,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(7)),
                                            color: kYellow.withOpacity(0.25),
                                            border: Border.all(
                                                width: 1.5,
                                                color: kYellow,
                                                style: BorderStyle.solid)),
                                        child: GestureDetector(
                                          onTap: () async {
                                            final number =
                                                await DataBaseProvider()
                                                    .getPhone();
                                            setState(() {
                                              _phoneController.text = number;
                                            });
                                          },
                                          child: Text('Paste Number',
                                              style: kEncodeSansSemiBold.copyWith(
                                                  color: kYellow,
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      2.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: sizeVertical * 3.5,
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
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: kGrey,
                                  backgroundImage: AssetImage(
                                    'assets/images/contact-list.png',
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
                                  value: selectedValue,
                                  items: dropdownItems.map((item) {
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
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select a network',
                                    labelStyle: kEncodeSansSemiBold.copyWith(
                                        color: kDarkGrey,
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
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: '50',
                                      child: Text('#50'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '100',
                                      child: Text('#100'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '200',
                                      child: Text('#200'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '500',
                                      child: Text('#500'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '1000',
                                      child: Text('#1000'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '2000',
                                      child: Text('#2000'),
                                    )
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select an amount',
                                    labelStyle: kEncodeSansSemiBold.copyWith(
                                        color: kDarkGrey,
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
                                    prefixIcon: const IconTheme(
                                        data: IconThemeData(color: kDarkGrey),
                                        child: Icon(Icons.phone)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 18),
                                    hintText: 'Enter Phone',
                                    label: Text(
                                      'Enter Phone',
                                      style: kEncodeSansSemiBold.copyWith(
                                          color: kDarkGrey,
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
                              SizedBox(
                                height: sizeVertical * 4,
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
                                return Row(
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
                                            if (selectedValue!.isEmpty ||
                                                selectedValue2!.isEmpty ||
                                                _phoneController.text.isEmpty) {
                                              warning(
                                                  message:
                                                      'fields can\'t be empty!!!');
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
                                                            value.AirtimePurchase(
                                                                network:
                                                                    selectedValue,
                                                                amount:
                                                                    selectedValue2,
                                                                phone_number:
                                                                    _phoneController
                                                                        .text
                                                                        .trim(),
                                                                context:
                                                                    context);
                                                            Navigator.pop(context);
                                                          },
                                                          child:
                                                              const Text('Ok'),
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
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                  'Buy Airtime',
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
                                );

                                // const SizedBox(
                                //   height: 20,
                                // ),
                              }),
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
