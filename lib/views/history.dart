import 'package:databank/backend/models/api_models.dart';
import 'package:databank/backend/provider/transaction_provider/transactions_provider.dart';
import 'package:databank/views/date_range.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../customizations/size_config.dart';
import '../model/history.dart';
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
  String? selectedDate;
  List<String> dates = [
    'today',
    'yesterday',
    'this-week',
    'last-week',
    'this-month',
    'last-month'
  ];

  List<dataHistory> his = [
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '500.0', '250', 'successful'),
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '600.0', '350', 'successful'),
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '700.0', '350', 'successful'),
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '800.0', '350', 'successful'),
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '900.0', '450', 'successful'),
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '1000.0', '550', 'successful'),
    dataHistory(
        'Data TopUp', 'SME', '07065919223', '1100.0', '650', 'successful'),
  ];
  bool? forward = false;
  int curentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    //  viewportFraction: 2,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenueWidget(
          onClicked: openDrawer,
          color: kGrey,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
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
              color: kBlack,
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
      body: SafeArea(
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
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                        DropdownButtonFormField<String>(
                          value: selectedDate,
                          items: dates.map((category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (category) {
                            setState(() {
                              selectedDate = category!;

Future<void> fetchTransactions(String selectedDate) async {
  // Make API request using selectedDate
  AllTransactions newTransactions = await TransactionsProvider().fetchTransactionsFromAPI(selectedDate: selectedDate);

  // Use the TransactionProvider to update the state
  Provider.of<TransactionsProvider>(context, listen: false).updateTransactions(newTransactions.data);
}

                              
                            });
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
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('Select Range'),
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
              Consumer<TransactionsProvider>(
                builder: (context, transaction, child) {
                  List<Datum1> transactions = transaction.transactions;
                  return SizedBox(
                      height: double.maxFinite,
                      child: PageView.builder(
                          itemCount: transactions.length,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          onPageChanged: (value) {
                            curentPage = value;
                            setState(() {
                              current = value;
                              //curentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            Datum1 x = transactions[index];
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Column(
                                    children: List.generate(
                                      his.length,
                                      (index) => Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              // Navigator.of(context).push(
                                              //     CupertinoPageRoute(
                                              //         builder: ((context) =>
                                              //             const )));
                                            },
                                            leading: Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: kBrown,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(12),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .mobile_screen_share_rounded,
                                                color: kGrey,
                                              ),
                                            ),
                                            title: Text(
                                              x.type as String,
                                              style: kEncodeSansMedium.copyWith(
                                                  color: kDarkBrown,
                                                  fontSize:
                                                      sizeHorizontal * 2.0),
                                            ),
                                            subtitle: Text(
                                              'initialBal: ${x.oldBalance}, finalBal: ${x.newBalance},',
                                              style:
                                                  kEncodeSansRegular.copyWith(
                                                      color: kGrey,
                                                      fontSize:
                                                          sizeVertical * 1.8),
                                            ),
                                            trailing: const Icon(Icons.diamond),
                                          ),

                                          // PriceListCard(
                                          //   status: x.status,
                                          //   beneficiary: x.beneficiary,
                                          //   dataType: x.dataType,
                                          //   transType: x.transacType,
                                          //   initialBal: x.initialBal,
                                          //   finalBal: x.finalBal,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
