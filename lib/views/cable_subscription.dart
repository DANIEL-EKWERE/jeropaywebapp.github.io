import 'package:databank/backend/provider/purchase_provider/purchases_provider.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:cool_alert/cool_alert.dart';
import 'package:provider/provider.dart';
import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/fab.dart';
import '../widget/textField.dart';

class CableSubscription extends StatefulWidget {
  const CableSubscription({
    super.key,
  });

  @override
  State<CableSubscription> createState() => _CableSubscriptionState();
}

class _CableSubscriptionState extends State<CableSubscription> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _phoneController.dispose();
  }

  String? selectedCategory;
  String? selectedSubCategory;

  List<String> categories = ['Start Times', 'GOtv', 'DSTV'];
  Map<String, List<String>> subcategories = {
    'Start Times': [
      'Nova-1 Month - #1500',
      'Basic-1 Month - #2600',
      'Smart - #3500',
      'Classic - #3800',
      'Super - #6500',
      'Nova Weekly - #400',
      'Basic Weekly - #400',
      'Basic Weekly - #700',
      'Smart Weekly - #700',
      'Smart weekly - #900',
      'Classic weekly - #1200',
      'Super weekly - #1800',
      'Nova daily - #100',
      'Basic daily - #200',
      'Smart daily - #250',
      'Super daily - #500',
      'Classic daily - #320'
    ],
    'GOtv': [
      'GOtv joli - #3300',
      'GOtv Max - #4850',
      'GOtv jingja - #2250',
      'GOtv Smallie - Monthly - #1100',
      'GOtv Smallie - quaterly - #2900',
      'GOtv Smallie - yearly - #8600',
      'GOtv Supa - #6400'
    ],
    'DSTV': [
      'Padi - #2500',
      'DSTV Confam - #6200',
      'DSTV Yanga - #3500',
      'DSTV Compact - #10500',
      'DSTV Premium - #24500',
      'DSTV Compact Plus - #16600',
      'DSTV Confam + ExtraView - #9600',
      'DSTV + Yanga + Extra - #5850',
      'DSTV Padi extra - #5900',
      'DSTV Compact Extra - #20000',
      'DSTV Premium extra - #24900',
      'ExtraView Access - #3400',
      'DSTV Compact + Extra View - #1380'
    ],
  };

  Map<String, String> cable_uuid = {
    'Nova-1 Month - #1500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Basic-1 Month - #2600': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Smart - #3500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Classic - #3800': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Super - #6500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Nova Weekly - #400': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Basic Weekly - #400': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Basic Weekly - #700': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Smart Weekly - #700': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Smart weekly - #900': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Classic weekly - #1200': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Super weekly - #1800': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Nova daily - #100': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Basic daily - #200': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Smart daily - #250': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Super daily - #500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Classic daily - #320': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv joli - #3300': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv Max - #4850': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv jingja - #2250': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv Smallie - Monthly - #1100': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv Smallie - quaterly - #2900': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv Smallie - yearly - #8600': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'GOtv Supa - #6400': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'Padi - #2500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Confam - #6200': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Yanga - #3500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Compact - #10500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Premium - #24500': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Compact Plus - #16600': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Confam + ExtraView - #9600': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV + Yanga + Extra - #5850': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Padi extra - #5900': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Compact Extra - #20000': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Premium extra - #24900': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'ExtraView Access - #3400': 'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
    'DSTV Compact + Extra View - #1380':
        'd928ec26-df8e-4a26-ad91-0d36f7aeecdb8',
  };

  bool _numberInputIsValid = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    // double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
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
                              'Hello,\nDaniel Ekwere.',
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
                          height: SizeConfig.blockSizeVertical! * 130,
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
                                    'Cable Subscriptiopn',
                                    style: kEncodeSansSemiBold.copyWith(
                                        color: kBlack,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.3),
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
                                    border: Border.all(width: 5, color: kBlack),
                                    shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: kGrey,
                                  backgroundImage: AssetImage(
                                    'assets/images/cable.jpg',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
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
                                      // selectedItem = null;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select Cable',
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
                                        // selectedItem = null;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: kInputBorder,
                                      fillColor: kLightGrey,
                                      filled: true,
                                      labelText: 'Select Cable Plan',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: textFieldNumber('IUC/Smart Card Number',
                                    'IUC/Smart Card Number', _controller, 'x'),
                              ),
                              SizedBox(
                                height: sizeVertical * 3.5,
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
                                height: sizeVertical * 3.5,
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
                                              if (selectedCategory == '' ||
                                                  selectedSubCategory == '' ||
                                                  _controller.text == '' ||
                                                  _phoneController.text == '') {
                                                warning(
                                                    message:
                                                        'fields can\'t be empty',
                                                    context: context);
                                              } else {
                                                showDialog<bool>(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Confirm Purchase'),
                                                        content: Text(
                                                            'Your about to make a purchase for ${_controller.text} with a cable provider of $selectedCategory for a plan of $selectedSubCategory'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              final cableUuid =
                                                                  cable_uuid[
                                                                      selectedSubCategory];
                                                              value.validateCableNumber(
                                                                  iuc: _controller
                                                                      .text
                                                                      .trim(),
                                                                  cableProvider:
                                                                      selectedCategory!,
                                                                  cableUuid:
                                                                      cableUuid!,
                                                                  context:
                                                                      context);
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
                                                    'VALIDATE AND PURCHASE',
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
                                },
                              ),
                              SizedBox(
                                height: sizeVertical * 3.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: double.infinity,
                                  height: sizeVertical * 20.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red[600],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Text(
                                    'For any complaint contact \n\n GOTV/DSTV customer service at 08039003788 or Startimes Customer services at 094618888',
                                    style: kEncodeSansMedium.copyWith(
                                        color: kWhite,
                                        fontSize: sizeVertical * 2.0),
                                  ),
                                ),
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
