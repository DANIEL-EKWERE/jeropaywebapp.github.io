import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../model/quik_dail.dart';
import '../widget/fab.dart';

class DataTopUp extends StatefulWidget {
  const DataTopUp({
    super.key,
  });

  @override
  State<DataTopUp> createState() => _DataTopUpState();
}

class _DataTopUpState extends State<DataTopUp> {
  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;
  List<String> dropdownItems = [
    'MTN',
    'AIRTEL',
    'GLO',
    '9 MOBILE',
  ];

  List<String> dropdownItems2 = [
    'SME',
    'SME1',
    'COPORATE',
    'GIFTING',
  ];

  List<String> dropdownItems3 = [
    'MTN(SME) 1GB - #227',
    'MTN(SME1) 1GB - #230',
    'MTN(COPERATE) 1GB - #227',
    'MTN(GIFTING) 1GB - #227',
  ];

  final List<QuickDial> qd = <QuickDial>[
    QuickDial(image: 'assets/images/glo.png', code: '*127*0#'),
    QuickDial(image: 'assets/images/mtn.png', code: '*461*4#'),
    QuickDial(image: 'assets/images/airtel.png', code: '*140#'),
    QuickDial(image: 'assets/images/9mobile.png', code: '*228#'),
  ];

  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedItem;

  // Define your categories and subcategories here
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

  Map<String, Map<String, List<String>>> items = {
    'MTN': {
      'MTN(SME1)': ['1GB', '2GB', '3GB'],
      'MTN(SME2)': ['1GB', '2GB', '3GB'],
      'MTN(GIFTING)': ['1GB', '2GB', '3GB'],
      'MTN(COPORATE)': ['1GB', '2GB', '3GB'],
    },
    'AIRTEL': {
      'AIRTEL(SME1)': ['1GB', '2GB', '3GB'],
      'AIRTEL(SME2)': ['1GB', '2GB', '3GB'],
      'AIRTEL(GIFTING)': ['1GB', '2GB', '3GB'],
      'AIRTEL(COPORATE)': ['1GB', '2GB', '3GB'],
    },
    'GLO': {
      'GLO(SME1)': ['1GB', '2GB', '3GB'],
      'GLO(SME2)': ['1GB', '2GB', '3GB'],
      'GLO(GIFTING)': ['1GB', '2GB', '3GB'],
      'GLO(COPORATE)': ['1GB', '2GB', '3GB'],
    },
    '9 MOBILE': {
      '9 MOBILE(SME1)': ['1GB', '2GB', '3GB'],
      '9 MOBILE(SME2)': ['1GB', '2GB', '3GB'],
      '9 MOBILE(GIFTING)': ['1GB', '2GB', '3GB'],
      '9 MOBILE(COPORATE)': ['1GB', '2GB', '3GB'],
    },
  };

  bool _numberInputIsValid = true;

  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      floatingActionButton: fab(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
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
                  ),
                ]),
            child: IconButton(
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil("/App_Layout", (route) => false),
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
                              'Hello,Daniel Ekwere',
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
                          height: SizeConfig.blockSizeVertical! * 190,
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
                                        'Data Top Up',
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
                                        child: Text(
                                          'Paste Number',
                                          style: kEncodeSansSemiBold.copyWith(
                                              color: kYellow,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  2.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: sizeVertical * 4,
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
                              SizedBox(
                                height: sizeVertical * 4,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 5, color: kBlack),
                                    shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: kGrey,
                                  backgroundImage: AssetImage(
                                    'assets/images/all_networks.png',
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
                                  value: selectedCategory,
                                  items: categories.map((category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                                  onChanged: (category) {
                                    setState(() {
                                      selectedCategory = category!;
                                      selectedSubCategory =
                                          null; // Reset subcategory when category changes
                                      selectedItem = null;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select Network',
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
                                height: sizeVertical * 3.5,
                              ),
                              if (selectedCategory != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: DropdownButtonFormField<String>(
                                    value: selectedSubCategory,
                                    items: subcategories[selectedCategory!]!
                                        .map((subcategory) {
                                      return DropdownMenuItem<String>(
                                        value: subcategory,
                                        child: Text(subcategory),
                                      );
                                    }).toList(),
                                    onChanged: (subcategory) {
                                      setState(() {
                                        selectedSubCategory = subcategory!;
                                        selectedItem = null;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: kInputBorder,
                                      fillColor: kLightGrey,
                                      filled: true,
                                      labelText: 'Select DataType',
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
                                height: sizeVertical * 3.5,
                              ),
                              if (selectedSubCategory != null)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 24.0,
                                      right: 24,
                                      bottom: sizeVertical * 3.5),
                                  child: DropdownButtonFormField<String>(
                                    value: selectedItem,
                                    items: items[selectedCategory!]
                                                ?[selectedSubCategory!]!
                                            .map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList() ??
                                        [],
                                    onChanged: (item) {
                                      setState(() {
                                        selectedItem = item!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: kInputBorder,
                                      fillColor: kLightGrey,
                                      filled: true,
                                      labelText: 'Select Data Plan',
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

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: TextField(
                                  controller: phoneController,
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
                                //textFieldPhoneNumber('Enter Phone',
                                //       'Enter Phone', phoneController),
                              ),
                              SizedBox(
                                height: sizeVertical * 3.5,
                              ),

                              //end here
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (newValue) {},
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Bypass number validation for ported phone numbers',
                                        style: kEncodeSansMedium.copyWith(
                                          color: kDarkGrey,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sizeVertical * 3.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
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
                                          onPressed: () {
                                            if (selectedValue == '' ||
                                                selectedValue2 == '' ||
                                                phoneController.text == '') {
                                              CoolAlert.show(
                                                backgroundColor: kGrey,
                                                confirmBtnColor: Colors.green,
                                                context: context,
                                                title: 'Empty Selections!!!',
                                                text:
                                                    'input fields cannot be empty,please fill in the fields and try again!',
                                                type: CoolAlertType.error,
                                                animType:
                                                    CoolAlertAnimType.rotate,
                                              );
                                            } else {
                                              CoolAlert.show(
                                                backgroundColor: kGrey,
                                                confirmBtnColor: Colors.green,
                                                context: context,
                                                type: CoolAlertType.confirm,
                                                title: 'Confirm Purchase!!!',
                                                text:
                                                    'your about to make purchase of $selectedValue2 $selectedValue airtime to the number ${phoneController.text}',
                                                onConfirmBtnTap: () async {
                                                  print(
                                                      'loading please wait...');

                                                  const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.red,
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                            const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.red,
                                              ),
                                            );
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
                                          child: const Text('Proceed'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sizeHorizontal * 3.5,
                              ),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Text(
                                      'Quick Dailing Code',
                                      style: kEncodeSansSemiBold.copyWith(
                                          color: kBlack,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.5),
                                    ),
                                  )),
                              SizedBox(
                                height: sizeHorizontal * 3.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Text(
                                  "Here's a list of short dailing code for checking your SME,COPERATE and GIFTING data plan",
                                  style: kEncodeSansSemiBold.copyWith(
                                      color: kGrey,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              2.0),
                                ),
                              ),
                              SizedBox(
                                height: sizeHorizontal * 3.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2.6 / 3,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                  ),
                                  itemCount: qd.length,
                                  itemBuilder: (context, index) {
                                    final bill = qd[index];
                                    return Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 8,
                                      height:
                                          SizeConfig.blockSizeVertical! * 15,
                                      decoration: BoxDecoration(
                                        color: kWhite,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(13)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: kBrown.withOpacity(0.18),
                                            spreadRadius: -2.0,
                                            blurRadius: 20.0,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                13,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    12,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor: kWhite,
                                              backgroundImage:
                                                  AssetImage(bill.image),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 11,
                                          ),
                                          Text(
                                            bill.code,
                                            style: kEncodeSansMedium.copyWith(
                                              color: kBlack,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  2.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
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
