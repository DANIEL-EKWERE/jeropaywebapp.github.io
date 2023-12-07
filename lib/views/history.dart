import 'package:databank/backend/models/api_models.dart';
import 'package:databank/backend/provider/transaction_provider/transactions_provider.dart';
import 'package:databank/views/date_range.dart';
import 'package:databank/widget/button.dart';
import 'package:databank/widget/receipt.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  List<String> categories = <String>[
    'All',
    'Data',
    'Airtime',
    'Cable',
    'Electric Bills',
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

  Future<void> fetchTransactions(String selectedDate) async {
    print('calling fetch ');
    // Make API request using selectedDate
    AllTransactions2 newTransactions = await TransactionsProvider()
        .fetchTransactionsFromAPI(selectedDate: selectedDate);

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
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    transacts = Provider.of<TransactionsProvider>(context);
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
              Color(0xff6A6A6A),
              Color.fromARGB(255, 79, 78, 78),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        elevation: 0,
        shadowColor: const Color.fromARGB(255, 235, 227, 227).withOpacity(0.1),
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
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              prefixIcon: const IconTheme(
                                  data: IconThemeData(color: kDarkGrey),
                                  child: Icon(Icons.search)),
                              hintText: 'Search for transactions...',
                              border: kInputBorder,
                              errorBorder: kInputBorder,
                              disabledBorder: kInputBorder,
                              focusedBorder: kInputBorder,
                              focusedErrorBorder: kInputBorder,
                              enabledBorder: kInputBorder,
                              hintStyle: kEncodeSansRegular.copyWith(
                                color: kDarkGrey,
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
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
                            color: kBlack,
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
                            // curentPage = index;
                          });
                          // forward = true;
                          // _pageController.position;
                          // TODO: this code below is to be considered
                          //  _pageController.jumpToPage(index);
                          _pageController.page == index + 1
                              //  _pageController.page == index + 2
                              ? _pageController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut)
                              : _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
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
                            color: current == index ? kBrown : kWhite,
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
                                  color: current == index ? kWhite : kDarkBrown,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 2,
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
                                focusedBorder: kInputBorder,
                                fillColor: kWhite,
                                filled: true,
                                labelText: 'Today',
                                labelStyle: kEncodeSansSemiBold.copyWith(
                                    color: kDarkGrey,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2.0),
                                hintStyle: kEncodeSansSemiBold.copyWith(
                                    color: kLightGrey,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2.0),
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
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: ((context) => const DateRange())));
                              },
                              icon: Icon(Icons.calendar_month))
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

                transacts!.transaction.isEmpty
                    ? Text('nothing here')
                    : transacts!.isLoading
                        ? SpinKitWanderingCubes(
                            color: kYellow,
                          )
                        : SizedBox(
                            height: double.maxFinite,
                            child: PageView.builder(
                              itemCount: transacts!.transaction.length,
                              scrollDirection: Axis.horizontal,
                              controller: _pageController,
                              onPageChanged: (value) {
                                curentPage = value;
                                setState(() {
                                  current = value;
                                });
                              },
                              itemBuilder: (context, index) {
                                Datum2 x = transacts!.transaction[index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: transacts!.transaction.isEmpty
                                          ? Center(
                                              child: Text(
                                                  'you\'ve not made any transactions yet!!!'),
                                            )
                                          : transacts!.isLoading
                                              ? Center(
                                                  child: SpinKitWanderingCubes(
                                                  color: kYellow,
                                                ))
                                              : Column(
                                                  children: List.generate(
                                                    transacts!
                                                        .transaction.length,
                                                    (index) => Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: Card(
                                                            child: ListTile(
                                                              onTap: () {
                                                                context
                                                                    .read<
                                                                        TransactionsProvider>()
                                                                    .singleTransactions(
                                                                        trans_uuid: x
                                                                            .id!,
                                                                        context:
                                                                            context);
                                                                // showModalBottomSheet(
                                                                //     showDragHandle:
                                                                //         true,
                                                                //     isDismissible:
                                                                //         false,
                                                                //     isScrollControlled:
                                                                //         true,

                                                                //     // anchorPoint: const Offset(5, 50),
                                                                //     useSafeArea:
                                                                //         true,
                                                                //     context:
                                                                //         context,
                                                                //     builder:
                                                                //         (context) =>
                                                                //             SingleChildScrollView(
                                                                //               child: Padding(
                                                                //                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                //                 child: Container(
                                                                //                   width: double.infinity,
                                                                //                   height: SizeConfig.blockSizeVertical! * 50,
                                                                //                   // color:
                                                                //                   //     kYellow,
                                                                //                   child: Column(
                                                                //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                //                     crossAxisAlignment: CrossAxisAlignment.center,
                                                                //                     children: [
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Details:'),
                                                                //                         FittedBox(
                                                                //                             child: Text(
                                                                //                           single.data.detail,
                                                                //                           style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 1.5, fontWeight: FontWeight.bold),
                                                                //                         ))
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Date and Time:'),
                                                                //                         Text(single.data.dateAndTime)
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Old Balance:'),
                                                                //                         Text(single.data.oldBalance)
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('New Balance:'),
                                                                //                         Text(single.data.newBalance)
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Phone:'),
                                                                //                         Text(single.data.phoneNumber)
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Status:'),
                                                                //                         Text(single.data.status)
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Amount:'),
                                                                //                         Text(single.data.amount)
                                                                //                       ]),
                                                                //                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                         const Text('Type:'),
                                                                //                         Text(single.data.type)
                                                                //                       ]),
                                                                //                     ],
                                                                //                   ),
                                                                //                   // child:
                                                                //                   //     Column(
                                                                //                   //   children: [
                                                                //                   //     Row(
                                                                //                   //       mainAxisAlignment:
                                                                //                   //           MainAxisAlignment.end,
                                                                //                   //       children: [
                                                                //                   //         Padding(
                                                                //                   //           padding: const EdgeInsets.symmetric(vertical: 15.0),
                                                                //                   //           child: Text(
                                                                //                   //             'Purchase Receipt',
                                                                //                   //             style: kEncodeSansSemiBold.copyWith(color: kGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                                                                //                   //           ),
                                                                //                   //         ),
                                                                //                   //         SizedBox(width: SizeConfig.blockSizeHorizontal! * 5),
                                                                //                   //         Align(
                                                                //                   //           alignment: Alignment.topRight,
                                                                //                   //           child: GestureDetector(
                                                                //                   //             onTap: () => Navigator.pop(context),
                                                                //                   //             child: const Icon(
                                                                //                   //               Icons.cancel,
                                                                //                   //               color: kGrey,
                                                                //                   //             ),
                                                                //                   //           ),
                                                                //                   //         ),
                                                                //                   //         SizedBox(width: sizeVertical * 1),
                                                                //                   //       ],
                                                                //                   //     ),
                                                                //                   //     const Divider(),
                                                                //                   //     SizedBox(
                                                                //                   //         height:
                                                                //                   //             sizeVertical * 1),
                                                                //                   // Column(
                                                                //                   //   mainAxisAlignment:
                                                                //                   //       MainAxisAlignment.spaceEvenly,
                                                                //                   //   crossAxisAlignment:
                                                                //                   //       CrossAxisAlignment.center,
                                                                //                   //   children: [
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Details:'),
                                                                //                   //       Text(single.data.detail)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Date and Time:'),
                                                                //                   //       Text(single.data.dateAndTime)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Old Balance:'),
                                                                //                   //       Text(single.data.oldBalance)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('New Balance:'),
                                                                //                   //       Text(single.data.newBalance)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Phone:'),
                                                                //                   //       Text(single.data.phoneNumber)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Status:'),
                                                                //                   //       Text(single.data.status)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Amount:'),
                                                                //                   //       Text(single.data.amount)
                                                                //                   //     ]),
                                                                //                   //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                //                   //       const Text('Type:'),
                                                                //                   //       Text(single.data.type)
                                                                //                   //     ]),
                                                                //                   //   ],
                                                                //                   // ),
                                                                //                   //     SizedBox(
                                                                //                   //         height:
                                                                //                   //             sizeVertical * 1),
                                                                //                   //     Expanded(
                                                                //                   //       child:
                                                                //                   //           Row(
                                                                //                   //         children: [
                                                                //                   //           button(text1: 'Go Home', isLoading1: false, tap: () {}),
                                                                //                   //           button(text1: 'Perform Another Trans.', isLoading1: false, tap: () {}),
                                                                //                   //         ],
                                                                //                   //       ),
                                                                //                   //     ),
                                                                //                   //     SizedBox(
                                                                //                   //         height:
                                                                //                   //             sizeVertical * 2),
                                                                //                   //   ],
                                                                //                   // ),
                                                                //                 ),
                                                                //               ),
                                                                //             ));
                                                              },
                                                              leading:
                                                                  Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(12),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: kBrown,
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            12),
                                                                  ),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/logo-1.png',
                                                                  width:
                                                                      sizeHorizontal *
                                                                          5,
                                                                ),
                                                                // Icon(
                                                                //   Icons
                                                                //       .mobile_screen_share_rounded,
                                                                //   color: kGrey,
                                                                // ),
                                                              ),
                                                              title: Text(
                                                                "${typeValues2.reverse[x.type]!} purchase to ${x.phoneNumber}",
                                                                style: kEncodeSansMedium.copyWith(
                                                                    color:
                                                                        kDarkBrown,
                                                                    fontSize:
                                                                        sizeHorizontal *
                                                                            1.6),
                                                              ),
                                                              subtitle: Text(
                                                                'Date: ${x.dateAndTime}',
                                                                style: kEncodeSansRegular.copyWith(
                                                                    color:
                                                                        kGrey,
                                                                    fontSize:
                                                                        sizeVertical *
                                                                            2.0),
                                                              ),
                                                              trailing: Text(
                                                                  "${statusValues2.reverse[x.status]!}\n #${x.amount}"),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
