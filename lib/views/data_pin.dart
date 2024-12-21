// import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/fab.dart';

class DataPin extends StatefulWidget {
  const DataPin({
    super.key,
  });

  @override
  State<DataPin> createState() => _DataPinState();
}

class _DataPinState extends State<DataPin> {
  String? selectedCategory;
  List<String> categories = [
    'MTN 750.0MB #149 WEEKLY',
    'MTN 1.0GB #202 MONTHLY \n(AIRTEL PIN) - TIKTOK',
    'MTN 1.0GB #212 WEEKLY',
    'MTN 1.0GB #235 MONTHLY - SME',
    'MTN 1.5GB #310 MONTHLY'
  ];
  String? selectedValue2;
  String? selectedPrice;
  List<int> prices = [
    149,
    202,
    212,
    235,
    310,
  ];
  late int p;
  List<String> dropdownItems2 = [
    '100',
    '2000',
    '500',
    '1000',
  ];
  int? x;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  bool _nameInputIsValid = true;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _numberController.dispose();
  }

  final RegExp nameExp = RegExp(r'^[A-Za-z]+$');
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    //  double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
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
                          height: SizeConfig.blockSizeVertical! * 115,
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
                                padding: EdgeInsets.only(top: 50, bottom: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Data Pin',
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
                                    border: Border.all(width: 5, color: kBlack),
                                    shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: kGrey,
                                  backgroundImage: AssetImage(
                                    'assets/images/data-pin.png',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
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
                                    //  final String x = categories[category];
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                                  onChanged: (category) {
                                    setState(() {
                                      selectedCategory = category!;
                                      print(selectedCategory);
                                      int x =
                                          categories.indexOf(selectedCategory!);
                                      print(x);
                                      p = prices[x];
                                      print(p);
                                      selectedPrice = p.toString();
                                      print("selcted price $selectedPrice");
                                      //  x = categories.indexOf(selectedCategory.toString());
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
                              const SizedBox(
                                height: 25,
                              ),
                              // if (selectedCategory != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: DropdownButtonFormField<String>(
                                  value: selectedValue2,
                                  items: dropdownItems2.map((item) {
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
                                    focusedBorder: kInputBorder,
                                    fillColor: kLightGrey,
                                    filled: true,
                                    labelText: 'Select Quantity',
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
                              //   int x = int.tryParse(p ?? 0) * int.tryParse(selectedValue2);
                              const SizedBox(
                                height: 25,
                              ),

                              if (selectedValue2 != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: TextFormField(
                                    onTap: () {
                                      // Open the dropdown when the text field is clicked
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Amount To Pay',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                    ),
                                    readOnly:
                                        true, // Make the text field read-only
                                    controller: TextEditingController(
                                      text: ((double.tryParse(
                                                      selectedPrice ?? '0') ??
                                                  0) *
                                              (double.tryParse(
                                                      selectedValue2 ?? '0') ??
                                                  0))
                                          .toString(),
                                    ),
                                    // Display the selected value in the text field
                                  ),
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: TextField(
                                  controller: _controller,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 18),
                                    hintText: 'Select Name On Card',
                                    label: Text(
                                      'Select Name On Card',
                                      style: kEncodeSansSemiBold.copyWith(
                                          color: kDarkGrey,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.0),
                                    ),
                                    errorText: _nameInputIsValid
                                        ? null
                                        : 'please enter only alphabetical characters only!',
                                    focusedBorder: kInputBorder,
                                    border: kInputBorder,
                                    filled: true,
                                    fillColor: kLightGrey,
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        _nameInputIsValid = false;
                                      });
                                    } else if (!nameExp.hasMatch(value)) {
                                      setState(() {
                                        _nameInputIsValid = false;
                                      });
                                    } else {
                                      setState(() {
                                        _nameInputIsValid = true;
                                      });
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
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
                                          onPressed: () async {
                                            // () async {
                                            if (selectedCategory == '' ||
                                                selectedValue2 == '' ||
                                                _controller.text == '') {
                                              // CoolAlert.show(
                                              //   context: context,
                                              //   title: 'Empty Selections!!!',
                                              //   text:
                                              //       'input fields cannot be empty,please fill in the fields and try again!',
                                              //   type: CoolAlertType.error,
                                              //   animType:
                                              //       CoolAlertAnimType.rotate,
                                           //   );
                                            } else {
                                              // CoolAlert.show(
                                              //   context: context,
                                              //   type: CoolAlertType.confirm,
                                              //   title: 'Confirm Purchase!!!',
                                              //   text:
                                              //       'your about to make purchase of $selectedCategory  airtime to the number ${_numberController.text}',
                                              //   onConfirmBtnTap: () async {
                                              //     print(
                                              //         'loading please wait...');

                                              //     const Center(
                                              //       child:
                                              //           CircularProgressIndicator(
                                              //         color: Colors.red,
                                              //       ),
                                              //     );
                                              //   },
                                              // );
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
                                          child: const Text('Buy Coupon Code'),
                                        ),
                                      ),
                                    ),
                                  ],
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
