import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/backend/provider/transaction_provider/transactions_provider.dart';
import 'package:databank/backend/provider/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:databank/backend/constant.dart';
import '../backend/provider/purchase_provider/purchases_provider.dart';
import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../model/quik_dail.dart';
// import '../widget/button.dart';
import '../widget/fab.dart';
import '../widget/snackbar.dart';

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
  String? selectedId;
  var data;
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
  bool _isCheck = false;
  // Define your categories and subcategories here
  List<String> categories = ['MTN', 'AIRTEL', 'GLO', '9 MOBILE'];
  Map<String, List<String>> subcategories = {
    'MTN': ['SME', 'SME2', 'GIFTING', 'CORPORATE GIFTING'],
    'AIRTEL': ['CORPORATE GIFTING'],
    'GLO': ['CORPORATE GIFTING'],
    '9 MOBILE': ['CORPORATE GIFTING'],
  };

  Map<String, Map<String, List<String>>> items = {
    'MTN': {
      'SME': [
        'MTN 500MB - #150',
        'MTN 1GB - #230',
        'MTN 2GB - #460',
        'MTN 3GB - #590'
      ],
      'SME2': [
        'MTN 500MB - #150',
        'MTN 1GB - #230',
        'MTN 2GB - #460',
        'MTN 3GB - #590'
      ],
      'GIFTING': [
        'MTN 500MB - #150',
        'MTN 1GB - #230',
        'MTN 2GB - #460',
        'MTN 3GB - #590'
      ],
      'CORPORATE GIFTING': [
        'MTN 500MB - #150',
        'MTN 1GB - #230',
        'MTN 2GB - #460',
        'MTN 3GB - #590'
      ],
    },
    'AIRTEL': {
      'CORPORATE GIFTING': [
        'AIRTEL 500MB - #150',
        'AIRTEL 1GB - #230',
        'AIRTEL 2GB - #460',
        'AIRTEL 3GB - #590'
      ],
      // 'AIRTEL(SME2)': [
      //   'AIRTEL 500MB - #150',
      //   'AIRTEL 1GB - #230',
      //   'AIRTEL 2GB - #460',
      //   'AIRTEL 3GB - #590'
      // ],
      // 'AIRTEL(GIFTING)': [
      //   'AIRTEL 500MB - #150',
      //   'AIRTEL 1GB - #230',
      //   'AIRTEL 2GB - #460',
      //   'AIRTEL 3GB - #590'
      // ],
      // 'AIRTEL(COPORATE)': [
      //   'AIRTEL 500MB - #150',
      //   'AIRTEL 1GB - #230',
      //   'AIRTEL 2GB - #460',
      //   'AIRTEL 3GB - #590'
      // ],
    },
    'GLO': {
      'CORPORATE GIFTING': [
        'GLO 500MB - #150',
        'GLO 1GB - #230',
        'GLO 2GB - #460',
        'GLO 3GB - #590'
      ],
      // 'GLO(SME2)': [
      //   'GLO 500MB - #150',
      //   'GLO 1GB - #230',
      //   'GLO 2GB - #460',
      //   'GLO 3GB - #590'
      // ],
      // 'GLO(GIFTING)': [
      //   'GLO 500MB - #150',
      //   'GLO 1GB - #230',
      //   'GLO 2GB - #460',
      //   'GLO 3GB - #590'
      // ],
      // 'GLO(COPORATE)': [
      //   'GLO 500MB - #150',
      //   'GLO 1GB - #230',
      //   'GLO 2GB - #460',
      //   'GLO 3GB - #590'
      // ],
    },
    '9 MOBILE': {
      'CORPORATE GIFTING': [
        '9 MOBILE 500MB - #150',
        '9 MOBILE 1GB - #230',
        '9 MOBILE 2GB - #460',
        '9 MOBILE 3GB - #590'
      ],
      // '9 MOBILE(SME2)': [
      //   '9 MOBILE 500MB - #150',
      //   '9 MOBILE 1GB - #230',
      //   '9 MOBILE 2GB - #460',
      //   '9 MOBILE 3GB - #590'
      // ],
      // '9 MOBILE(GIFTING)': [
      //   '9 MOBILE 500MB - #150',
      //   '9 MOBILE 1GB - #230',
      //   '9 MOBILE 2GB - #460',
      //   '9 MOBILE 3GB - #590'
      // ],
      // '9 MOBILE(COPORATE)': [
      //   '9 MOBILE 500MB - #150',
      //   '9 MOBILE 1GB - #230',
      //   '9 MOBILE 2GB - #460',
      //   '9 MOBILE 3GB - #590'
      // ],
    },
  };
  Map<String, String> getDataId = {
    // mtn
    'MTN 500MB - #150': '923cdea0-feec-4e3a-9e2e-e0edc76c8aec',
    'MTN 1GB - #230': 'd055ab1c-67a6-425d-8265-cedfd7873a3c',
    'MTN 2GB - #460': '2f845458-d1f4-4c08-ade6-750953d73d52',
    'MTN 3GB - #590': '49be9c6f-7736-4b68-90dd-afc57b8d85dc',

    // airtel
    'AIRTEL 500MB - #150': '16c51d1d-d62f-4e95-af04-6b097085258a',
    'AIRTEL 1GB - #230': 'd781023b-d79d-49bc-809a-9ec0539d5a45',
    'AIRTEL 2GB - #460': 'd4d43803-b64c-4fa1-8d7a-b936ef5fc736',
    'AIRTEL 3GB - #590': 'ffdbb024-2a93-41c2-a4d9-31ca44b84443',

    // glo
    'GLO 500MB - #150': 'b5dddd3b-313c-4fab-9277-751b3e28677a',
    'GLO 1GB - #230': '14b4c285-481a-42e2-8517-ed6e090a6d8d',
    'GLO 2GB - #460': '84e19afa-1fd6-406a-bfbc-6b3eb5d88ac8',
    'GLO 3GB - #590': 'cf36db53-cc14-4f91-8f18-db577650e158',

    //9 mobile
    '9 MOBILE 500MB - #150': '4515121f-2b9c-4353-8b3e-731da08866c9',
    '9 MOBILE 1GB - #230': 'acef55d7-5203-48bd-b9bd-260a614a2a8b',
    '9 MOBILE 2GB - #460': '62af5076-bd3d-4a15-803d-d1ff0f3f1034',
    '9 MOBILE 3GB - #590': '6e15da99-7706-4f80-99a7-b5d4af953723',
  };

  late BuildContext modalBottomSheetContext;

  String? selectePriceId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    modalBottomSheetContext = context;
  }

  bool _numberInputIsValid = true;

  TextEditingController phoneController = TextEditingController();

  var username;
  var baln;
  var balance;
  var price;
  String baseUrl = AppUrl.baseUrl;
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void username1() {
    final x = gatherUserName();
    setState(() {
      username = x;
    });
  }

  Future<Map<String, Map<String, List<String>>>> FetchPrices() async {
    print('callimg recent');
    print('calling recent transactions');
    String url = '$baseUrl/all-data-plans/';
    // _isLoading = true;
    // notifyListeners();

    final access = await DataBaseProvider().getToken();
    Map<String, String>? reqHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: reqHeader);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print('from models===== $responseBody');
        data = responseBody['data'];

        final Map<String, Map<String, List<String>>> itemx = {};

        for (final price in data) {
          final network = price['network'];
          final amount = price['price_desc'];
          final plan_type = price['plan_type'];
          if (!itemx.containsKey(network)) {
            itemx[network!] = {};
          }
          if (!itemx[network]!.containsKey(plan_type)) {
            itemx[network]![plan_type!] = [];
          }
          itemx[network]![plan_type]!.add(amount!);
        }

        print("===== $itemx");
        return itemx;
      } else {
        print(response.body);
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } on SocketException catch (_) {
      // _isLoading = false;
      //_reqMessage = 'internet connection not available';
      // notifyListeners();
    } catch (e) {
      // _isLoading = false;
      // _reqMessage = 'An Error Occured $e';
      throw Exception('Failed to make the request: $e');
    }

    throw Exception('Failed to load data');
  }

  Future<void> prices() async {
    final pricex = await FetchPrices();
    setState(() {
      items = pricex;
    });
  }

  Future<String> gatherUserName() async {
    final usernamex = await DataBaseProvider().getUserName();
    setState(() {
      username = usernamex;
    });
    print("user name is $username method");
    return usernamex;
  }

  // Future<void> userProfile() async {
  //   final image = await UserDetails().getUserProfileImage();
  //   setState(() {
  //     proImg = image;
  //   });
  // }

// final balance =
  Future<void> gatherBalance() async {
    final balancex = await UserDetails().getUserAccountBalanace();
    setState(() {
      balance = balancex;
    });
    print("balance is $balance method");
    // return balancex;
  }

  Future<void> Balance() {
    final bal = gatherBalance();
    setState(() {
      balance = bal;
    });
    return balance;
  }

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    WidgetsBinding.instance.addPostFrameCallback((_) {
      baln = Provider.of<UserDetails>(context, listen: false);
      baln.getUserAccountBalanace();
    });
    Balance();
    gatherBalance();
    username1();
    gatherUserName();
    prices();
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
                              'Hello,\n$username',
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
                              '#$balance',
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
                                        child: GestureDetector(
                                          onTap: () async {
                                            final number =
                                                await DataBaseProvider()
                                                    .getPhone();
                                            setState(() {
                                              phoneController.text = number;
                                            });
                                          },
                                          child: Text(
                                            'PasteNumber',
                                            style: kEncodeSansSemiBold.copyWith(
                                                color: kYellow,
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    2.0),
                                          ),
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
                                    onChanged: (item) {
                                      setState(() async {
                                        selectedItem = item!;
                                        print(selectedItem);
                                        // final selectedPrice =
                                        //  data =
                                        //     TransactionsProvider().data;
                                        //         .firstWhere((price) =>
                                        //             price['price_desc'] ==
                                        //             selectedItem);

                                        // selectePriceId = selectedPrice['id'];
                                        // print(selectePriceId);
                                        // log(selectePriceId!);
                                        // debugPrint(selectePriceId);
                                      });
                                    },
                                    items: items[selectedCategory!]
                                                ?[selectedSubCategory!]!
                                            .map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList() ??
                                        [],
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
                                        // value: false,
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            setState(() {
                                              _isCheck = newValue;
                                            });
                                          }
                                        },
                                        value: _isCheck),
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
                                        child: Consumer<PurchaseProvider>(
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
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xff373737),
                                                              Color(0xff6A6A6A),
                                                            ],
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                          )),
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      if (selectedCategory ==
                                                              '' ||
                                                          selectedSubCategory ==
                                                              '' ||
                                                          selectedItem == '' ||
                                                          phoneController
                                                                  .text ==
                                                              '') {
                                                        warning(
                                                            message:
                                                                'fields cant\'t be empty!!!',
                                                            context: context);
                                                      } else {
                                                        showDialog<bool>(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Confirm Purchase'),
                                                                content: Text(
                                                                    'Your about to make a purchase of $selectedCategory $selectedItem'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      Navigator.pop(
                                                                          context);
                                                                      // final itemIndex =
                                                                      //     items[selectedCategory]![
                                                                      //         selectedSubCategory];
                                                                      // final index =
                                                                      //     itemIndex!
                                                                      //         .indexOf(selectedItem!);

                                                                      // final item =
                                                                      //     items[selectedCategory]![selectedSubCategory]![
                                                                      //         index];

                                                                      // final dataId =
                                                                      //     getDataId[
                                                                      //         item];

                                                                      for (final x
                                                                          in data) {
                                                                        if (x['network'] == selectedCategory &&
                                                                            x['plan_type'] ==
                                                                                selectedSubCategory &&
                                                                            x['price_desc'] ==
                                                                                selectedItem) {
                                                                          setState(
                                                                              () {
                                                                            selectedId =
                                                                                x['id'];
                                                                          });
                                                                        }
                                                                      }
                                                                      ;
                                                                      warning(
                                                                          message:
                                                                              selectedId,
                                                                          context:
                                                                              context);
                                                                      final dataPurchaseModel = await value.PurchaseData(
                                                                          context:
                                                                              context,
                                                                          dataId:
                                                                              selectedId!,
                                                                          phone_number: phoneController
                                                                              .text
                                                                              .trim());

                                                                      if (dataPurchaseModel !=
                                                                          null) {
                                                                        showModalBottomSheet(
                                                                            showDragHandle:
                                                                                true,
                                                                            isDismissible:
                                                                                false,
                                                                            isScrollControlled:
                                                                                true,

                                                                            // anchorPoint: const Offset(5, 50),
                                                                            useSafeArea:
                                                                                true,
                                                                            context:
                                                                                modalBottomSheetContext,
                                                                            builder: (context) =>
                                                                                SingleChildScrollView(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      //  height: MediaQuery.of(context).size.height * 40,
                                                                                      // color:
                                                                                      //     kYellow,
                                                                                      child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Text('Transaction Receipt'),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Details:'),
                                                                                            FittedBox(
                                                                                                child: Text(
                                                                                              dataPurchaseModel.message!.detail,
                                                                                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * .5, fontWeight: FontWeight.bold),
                                                                                            ))
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Date and Time:'),
                                                                                            Text(dataPurchaseModel.message!.dateAndTime)
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Old Balance:'),
                                                                                            Text(dataPurchaseModel.message!.oldBalance)
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('New Balance:'),
                                                                                            Text(dataPurchaseModel.message!.newBalance)
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Phone:'),
                                                                                            Text(dataPurchaseModel.message!.phoneNumber)
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Status:'),
                                                                                            Text(dataPurchaseModel.message!.status)
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Amount:'),
                                                                                            Text(dataPurchaseModel.message!.amount)
                                                                                          ]),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                                            const Text('Type:'),
                                                                                            Text(dataPurchaseModel.message!.type)
                                                                                          ]),
                                                                                          Divider(),
                                                                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ));
                                                                      }
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      }
                                                      // () async {
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            elevation: 0,
                                                            foregroundColor:
                                                                kWhite,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
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
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                'Loading please wait...',
                                                                style: TextStyle(
                                                                    color:
                                                                        kWhite),
                                                              )
                                                            ],
                                                          )
                                                        : Text(
                                                            'Proceed',
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

                                          // return
                                        }),
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

                                          // Text('the price list is $price')
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
