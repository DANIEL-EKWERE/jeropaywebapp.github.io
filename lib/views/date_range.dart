import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kWhite),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff6A6A6A),
              Color.fromARGB(255, 79, 78, 78),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          Row(
            children: [
              Text(
                'Start Date:',
                style: kEncodeSansBold.copyWith(
                    fontSize: sizeHorizontal * 3.5, color: kGrey),
              ),
              CupertinoButton(
                child: Text(
                  '${startDate.month}-${startDate.day}-${startDate.year}',
                  style: kEncodeSansBold.copyWith(
                      fontSize: sizeHorizontal * 3.0, color: kYellow),
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Done')),
                              Expanded(
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    backgroundColor: kWhite,
                                    onDateTimeChanged: (onDateTimeChanged) {
                                      setState(() {
                                        startDate = onDateTimeChanged;
                                      });
                                    }),
                              )
                            ],
                          )));
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'End Date:',
                style: kEncodeSansBold.copyWith(
                    fontSize: sizeHorizontal * 3.5, color: kGrey),
              ),
              CupertinoButton(
                child: Text(
                  '${endDate.month}-${endDate.day}-${endDate.year}',
                  style: kEncodeSansBold.copyWith(
                      fontSize: sizeHorizontal * 3.0, color: kYellow),
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Done'),
                              ),
                              Expanded(
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    backgroundColor: kWhite,
                                    onDateTimeChanged: (onDateTimeChanged) {
                                      setState(() {
                                        endDate = onDateTimeChanged;
                                      });
                                    }),
                              )
                            ],
                          )));
                },
              ),
            ],
          ),
          SizedBox(
            height: sizeVertical * 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff373737),
                          Color.fromARGB(255, 135, 135, 135),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context,
                          {'startDate': startDate, 'endDate': endDate});
                      // if (_userNameController!.text.isEmpty ||
                      //     _passwordController!.text.isEmpty) {
                      //   warning(
                      //       message: 'fields cant\'t be empty',
                      //       context: context);
                      //    } else {
                      // value.loginUser(
                      //     username:
                      //         _userNameController!.text.trim(),
                      //     password:
                      //         _passwordController!.text.trim(),
                      //     context: context);
                      //  }
                      // () async {
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: kWhite,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child:
                        // value.isLoading
                        //     ? const Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.center,
                        //         crossAxisAlignment:
                        //             CrossAxisAlignment.center,
                        //         children: [
                        //           CircularProgressIndicator(
                        //             color: Colors.white,
                        //           ),
                        //           SizedBox(
                        //             width: 10,
                        //           ),
                        //           Text(
                        //             'Loading please wait...',
                        //             style: TextStyle(color: kWhite),
                        //           )
                        //         ],
                        //       )
                        Text(
                      'Filter Date',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                          color: kWhite),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5 * 2,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'selected a start date and an end date to filter your transaction within that range!',
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
