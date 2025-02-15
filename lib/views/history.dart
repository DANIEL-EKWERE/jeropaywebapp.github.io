import 'package:databank/backend/models/api_models.dart';
import 'package:databank/backend/provider/transaction_provider/transactions_provider.dart';
import 'package:databank/backend/provider/user_details/user_details.dart';
import 'package:databank/views/date_range.dart';
// import 'package:databank/views/log_in.dart';
// import 'package:databank/widget/button.dart';
// import 'package:databank/widget/receipt.dart';
// import 'package:databank/widget/snackbar.dart';
// import 'package:databank/views/transaction_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../customizations/size_config.dart';
// import '../model/history.dart';
import '../widget/drawer_widget.dart';
// import '../widget/history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState(openDrawer);
}

class _HistoryScreenState extends State<HistoryScreen> {
  final VoidCallback openDrawer;
  _HistoryScreenState(this.openDrawer);
  int current = 0;
  int current1 = 0;

  late BuildContext modalBottomSheetContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    modalBottomSheetContext = context;
  }

  List<String> categories = <String>[
    'All',
    'Data',
    'Airtime',
    'Cable',
    'Electricity',
    // 'Result check',
    // 'Airtime to cash'
  ];
  String selectedDate = 'all';
  // Future<AllTransactions2>? transacts;
  TransactionsProvider? transacts;
  bool? forward = false;
  int curentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    //  viewportFraction: 2,
  );
dynamic proImg = '';
  Future<void> fetchTransactions(String selectedDate) async {
    print('calling fetch ');
    // Make API request using selectedDate
    AllTransactions2 newTransactions = await TransactionsProvider()
        .fetchTransactionsFromAPI(selectedDate: selectedDate);

    // Use the TransactionProvider to update the state
    Provider.of<TransactionsProvider>(context, listen: false)
        .updateTransactions(newTransactions.data!);
  }

  Future<void> fetchTransactionsByRange(
      String startDate, String endDate) async {
    print('calling fetch ');
    // Make API request using selectedDate
    AllTransactions2 newTransactions = await TransactionsProvider()
        .byRangeTransactions(start_date: selectedDate, end_date: endDate);

    // Use the TransactionProvider to update the state
    Provider.of<TransactionsProvider>(context, listen: false)
        .updateTransactions(newTransactions.data!);
  }

  @override
  void initState() {
    super.initState();
    fetchTransactions(selectedDate);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      transacts = Provider.of<TransactionsProvider>(context, listen: false);
    });
            final img = userProfile();
    setState(() {
      proImg = img;
    });
  }
  Future<void> userProfile() async {
    final image = await UserDetails().getUserProfileImage();
    setState(() {
      proImg = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    transacts = Provider.of<TransactionsProvider>(context);
    final filterProducts = transacts!.transaction!.where((product) {
      return transacts!.selectedCategories.isEmpty ||
          transacts!.selectedCategories.contains(product?.type);
    }).toList();
    //.fetchTransactionsFromAPI(selectedDate: selectedDate);

    return Scaffold(
        appBar: AppBar(
          leading: DrawerMenueWidget(
            onClicked: openDrawer,
            color: kWhite,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
              //  Color(0xFFB0FFC1),
              //       Color(0xFFB3C2FF),
              purple,purple
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
          elevation: 0,
          shadowColor:
              const Color.fromARGB(255, 235, 227, 227).withOpacity(0.1),
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
            //  CircleAvatar(
            //                     radius: 60,
            //                     backgroundColor: purple,
            //                     backgroundImage: NetworkImage(
            //         "https://jeropay.com.ng$proImg")
            //                     //  : Image.asset("assets/images/pic-2.png"),
            //                     ),
            const SizedBox(
              width: 24,
            )
          ],
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await fetchTransactions(selectedDate);
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: kEncodeSansRegular.copyWith(
                              color: purple,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                            ),
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                prefixIcon: const IconTheme(
                                    data: IconThemeData(color: purple),
                                    child: Icon(Icons.search)),
                                hintText: 'Search for transactions...',
                                border: kInputBorder,
                                errorBorder: kInputBorder,
                                disabledBorder: kInputBorder,
                                focusedBorder: kInputBorder,
                                focusedErrorBorder: kInputBorder,
                                enabledBorder: kInputBorder,
                                hintStyle: kEncodeSansRegular.copyWith(
                                  color: purple,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.5,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: sizeVertical * 2,
                        ),
                        Container(
                          //padding: EdgeInsets.all(12),
                          width: SizeConfig.blockSizeHorizontal! * 6.8,
                          height: SizeConfig.blockSizeVertical! * 6.8,
                          decoration: const BoxDecoration(
                              color: purple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Icon(
                            Icons.search,
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeVertical * 3,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Categories',
                          style: kEncodeSansMedium.copyWith(
                              color: kBlack,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3),
                        ),
                      )),
                  // start here okay....
                  SizedBox(
                    height: sizeVertical * 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                              final type = categories[index];
                              // curentPage = index;
                              transacts!.selectedCategories.contains(type);
                              if (current == index && index != 0) {
                                transacts!.selectedCategories.add(type);
                              } else {
                                transacts!.selectedCategories.remove(type);
                              }
                            });
                            // forward = true;
                            // _pageController.position;
                            // TODO: this code below is to be considered
                            //  _pageController.jumpToPage(index);
                            // _pageController.page == index + 1
                            //     //  _pageController.page == index + 2
                            //     ? _pageController.previousPage(
                            //         duration: const Duration(milliseconds: 400),
                            //         curve: Curves.easeInOut)
                            //     : _pageController.nextPage(
                            //         duration: const Duration(milliseconds: 400),
                            //         curve: Curves.easeInOut);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: current == 0 ? 12 : 15,
                              // right: current == categories.length - 1 ? 15 : 1,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: current == index ? purple : kWhite,
                              border: current == index
                                  ? null
                                  : Border.all(
                                      color: kLightGrey,
                                      width: 1, 
                                    ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  categories[index],
                                  style: kEncodeSansMedium.copyWith(
                                    color:
                                        current == index ? kWhite : kDarkBrown,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: sizeVertical * 3,
                  ),
                  Text(
                    'Transactions',
                    style: kEncodeSansMedium.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.0),
                  ),
                  SizedBox(
                    height: sizeVertical * 3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('Select date'),
                            SizedBox(
                              height: sizeVertical * 3,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              child: DropdownButtonFormField<String>(
                                value: selectedDate,
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'all',
                                    child: Text('All'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'today',
                                    child: Text('Today'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'this-week',
                                    child: Text('This Week'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'last-week',
                                    child: Text('Last Week'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'this-month',
                                    child: Text('This Month'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'last-month',
                                    child: Text('Last Month'),
                                  )
                                ],
                                // items: dates.map((category) {
                                //   return DropdownMenuItem<String>(
                                //     value: category,
                                //     child: Text(category),
                                //   );
                                // }).toList(),
                                onChanged: (category) {
                                  setState(() {
                                    selectedDate = category!;

                                    // fetchTransactions(selectedDate!);
                                  });
                                  fetchTransactions(selectedDate);
                                },
                                decoration: InputDecoration(
                                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                                  focusedBorder: kInputBorder,
                                  fillColor: kWhite,
                                  filled: true,
                                  labelText: 'Select Date',
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
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('Select Range'),
                            SizedBox(
                              height: sizeVertical * 3,
                            ),
                            IconButton(
                                onPressed: () async {
                                  var result = await Navigator.of(context).push(
                                      CupertinoPageRoute(
                                          builder: ((context) =>
                                              const DateRange())));

                                  if (result != null &&
                                      result is Map<String, dynamic>) {
                                    final xS = result['startDate'];
                                    final xE = result['endDate'];
                                    final startDate =
                                        DateFormat('yyyy-mm-dd').format(xS);
                                    final endDate =
                                        DateFormat('yyyy-mm-dd').format(xE);
                                    print(startDate);
                                    print(endDate);

                                    fetchTransactionsByRange(
                                        startDate, endDate);
                                  }
                                },
                                icon: Icon(Icons.calendar_month,color: purple,))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeVertical * 3,
                  ),
                  SizedBox(
                    height: sizeVertical * 2,
                  ),

                  transacts?.transaction?.isEmpty ?? true
                      ? Text('No transactions available')
                      : transacts!.isLoading
                          ? SpinKitWanderingCubes(color: kYellow)
                          : SizedBox(
                              height: double.maxFinite,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: filterProducts.length,
                                  // itemCount: transacts!.transaction!.length,
                                  itemBuilder: (context, index) {
                                    Datum2 x = filterProducts[index];
                                    // Datum2 x = transacts!.transaction![index];
                                    return filterProducts.isEmpty
                                        //  return transacts!.transaction!.isEmpty
                                        ? Center(
                                            child: Text(
                                                'you\'ve not made any transactions yet!!!'),
                                          )
                                        : transacts!.isLoading
                                            ? Center(
                                                child: SpinKitWanderingCubes(
                                                color: kYellow,
                                              ))
                                            : Card(
                                                child: ListTile(
                                                  onTap: () async {
                                                    SingleTransaction
                                                        singleTransaction =
                                                        await context
                                                            .read<
                                                                TransactionsProvider>()
                                                            .singleTransactions(
                                                              trans_uuid: x.id!,
                                                              context: context,
                                                            );

                                                    showModalBottomSheet(
                                                        showDragHandle: true,
                                                        isDismissible: false,
                                                        isScrollControlled:
                                                            true,
                                                        useSafeArea: true,
                                                        context:
                                                            modalBottomSheetContext,
                                                        builder: (context) =>
                                                            SingleChildScrollView(
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            20),
                                                                    child: Container(
                                                                        width: double.infinity,
                                                                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                          Text(
                                                                              'Transaction Receipt'),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Details:'),
                                                                                FittedBox(
                                                                                    child: Text(singleTransaction.data.detail,
                                                                                        style: kEncodeSansBold.copyWith(
                                                                                          fontSize: SizeConfig.blockSizeHorizontal! * 1.5,
                                                                                        )))
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Date and Time:'),
                                                                                Text(singleTransaction.data.dateAndTime)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Old Balance:'),
                                                                                Text(singleTransaction.data.oldBalance)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('New Balance:'),
                                                                                Text(singleTransaction.data.newBalance)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Phone:'),
                                                                                Text(singleTransaction.data.phoneNumber)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Status:'),
                                                                                Text(singleTransaction.data.status)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Amount: '),
                                                                                Text(singleTransaction.data.amount)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Divider(),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 2),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text('Type:'),
                                                                                Text(singleTransaction.data.type)
                                                                              ]),
                                                                          SizedBox(
                                                                              height: SizeConfig.blockSizeVertical! * 10),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              // Row(
                                                                              //   children: [
                                                                              //     Expanded(
                                                                              //       flex: 1,
                                                                              //       child: Container(
                                                                              //         decoration: const BoxDecoration(
                                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                              //             gradient: LinearGradient(
                                                                              //               colors: [
                                                                              //                 Color(0xff373737),
                                                                              //                 Color(0xff6A6A6A),
                                                                              //               ],
                                                                              //               begin: Alignment.topLeft,
                                                                              //               end: Alignment.bottomRight,
                                                                              //             )),
                                                                              //         child: ElevatedButton(
                                                                              //           onPressed: () async {
                                                                              //             // () async {
                                                                              //           },
                                                                              //           style: ElevatedButton.styleFrom(
                                                                              //               elevation: 0,
                                                                              //               foregroundColor: kWhite,
                                                                              //               backgroundColor: Colors.transparent,
                                                                              //               shape: RoundedRectangleBorder(
                                                                              //                 borderRadius: BorderRadius.circular(10),
                                                                              //               )),
                                                                              //           child: Text(
                                                                              //             'Print',
                                                                              //             style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 2.5, color: kWhite),
                                                                              //           ),
                                                                              //         ),
                                                                              //       ),
                                                                              //     ),
                                                                              //   ],
                                                                              // ),
                                                                              // Row(
                                                                              //   children: [
                                                                              //     Expanded(
                                                                              //       flex: 1,
                                                                              //       child: Container(
                                                                              //         decoration: const BoxDecoration(
                                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                              //             gradient: LinearGradient(
                                                                              //               colors: [
                                                                              //                 Color(0xff373737),
                                                                              //                 Color(0xff6A6A6A),
                                                                              //               ],
                                                                              //               begin: Alignment.topLeft,
                                                                              //               end: Alignment.bottomRight,
                                                                              //             )),
                                                                              //         child: ElevatedButton(
                                                                              //           onPressed: () async {
                                                                              //             // () async {
                                                                              //           },
                                                                              //           style: ElevatedButton.styleFrom(
                                                                              //               elevation: 0,
                                                                              //               foregroundColor: kWhite,
                                                                              //               backgroundColor: Colors.transparent,
                                                                              //               shape: RoundedRectangleBorder(
                                                                              //                 borderRadius: BorderRadius.circular(10),
                                                                              //               )),
                                                                              //           child: Text(
                                                                              //             'Download',
                                                                              //             style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 2.5, color: kWhite),
                                                                              //           ),
                                                                              //         ),
                                                                              //       ),
                                                                              //     ),
                                                                              //   ],
                                                                              // ),
                                                                            ],
                                                                          )
                                                                        ])))));
                                                  },
                                                  leading: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                        color: kBrown,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(12),
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/logo-1.png',
                                                        width:
                                                            sizeHorizontal * 5,
                                                      )),
                                                  title: Text(
                                                    "${x.type!} purchase to ${x.phoneNumber}",
                                                    style: kEncodeSansMedium
                                                        .copyWith(
                                                            color: kDarkBrown,
                                                            fontSize:
                                                                sizeHorizontal *
                                                                    1.6),
                                                  ),
                                                  subtitle: Text(
                                                    'Date: ${x.dateAndTime}',
                                                    style: kEncodeSansRegular
                                                        .copyWith(
                                                            color: kGrey,
                                                            fontSize:
                                                                sizeVertical *
                                                                    2.0),
                                                  ),
                                                  trailing: Text(
                                                      "${statusValues2.reverse[x.status]!}\n #${x.amount}"),
                                                ),
                                              );
                                  }),
                            ),
                ],
              ),
            ),
          ),
        ));
  }
}

extension on Object? {
  Object? get type => null;
}
