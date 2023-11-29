import 'package:databank/customizations/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          Row(
            children: [
              Text('Start Date:'),
              CupertinoButton(
                child: Text(
                    '${startDate.month}-${startDate.day}-${startDate.year}'),
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
              Text('End Date:'),
              CupertinoButton(
                child: Text('${endDate.month}-${endDate.day}-${endDate.year}'),
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
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Filter')),
          Text('selected date1')
        ],
      ),
    );
  }
}
