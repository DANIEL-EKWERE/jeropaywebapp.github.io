import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/reward.dart';
import '../widget/drawer_widget.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      //  backgroundColor: kLightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //foregroundColor: Colors.white10,
        leading: DrawerMenueWidget(
          onClicked: openDrawer,
          color: kGrey,
        ),
        iconTheme: const IconThemeData(color: kDarkBrown),
        title: Text(
          'Reward',
          style: kEncodeSansBold.copyWith(
            color: kBlack,
            fontSize: sizeHorizontal * 3.3,
          ),
        ),
        actions: [
          PopupMenuButton(onSelected: (value) async {
            switch (value) {
              case MenuAction.info:
                //   final showInfo = await showInfoDialogue(context);
                showInfoDialogue(context);
                break;
            }
          }, itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                value: MenuAction.info,
                child: Text('info'),
              ),
            ];
          }),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: kLightGrey),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: sizeVertical * 3.5,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.diamond,
                        color: kGrey,
                      ),
                      SizedBox(
                        width: sizeVertical * 1.5,
                      ),
                      const Text('rewards'),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: [
                            Text(
                              DateFormat('dd MMM,yy.').format(currentTime),
                            ),
                            const Icon(Icons.calendar_month),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Check In Today'),
                          Checkbox(value: true, onChanged: (newValue) {})
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: sizeVertical * 2.5,
              ),
              Text(
                '#0.00',
                style: kEncodeSansMedium.copyWith(
                    color: Colors.green, fontSize: sizeHorizontal * 3.0),
              ),
              SizedBox(
                height: sizeVertical * 3.5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8,
                        color: kLightGrey,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: kDarkBrown.withOpacity(0.1),
                          offset: const Offset(0, 5))
                    ]),
                child: ListTile(
                  // selectedColor: kYellow,
                  leading: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                    'Daily Reward',
                    style: kEncodeSansMedium.copyWith(
                        color: kDarkBrown, fontSize: sizeHorizontal * 2.0),
                  ),
                  subtitle: Text(
                    'Check in and get #1-#20 \n Reward to be used at Random',
                    style: kEncodeSansRegular.copyWith(
                        color: kGrey, fontSize: sizeVertical * 1.8),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              SizedBox(
                height: sizeVertical * 4.0,
              ),
              Text(
                'Daily Bonus',
                style: kEncodeSansMedium.copyWith(
                    color: kGrey,
                    fontSize: SizeConfig.blockSizeHorizontal! * 2.3),
              ),
              SizedBox(
                height: sizeVertical * 4.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: reward.length,
                itemBuilder: ((context, index) {
                  Reward x = reward[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.8,
                          color: kLightGrey,
                          style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: kWhite,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: kDarkBrown.withOpacity(0.05),
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => x.screen!)));
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: x.bcolor,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Icon(
                          Icons.mobile_screen_share_rounded,
                          color: x.fcolor,
                        ),
                      ),
                      title: Text(
                        x.title,
                        style: kEncodeSansMedium.copyWith(
                            color: kDarkBrown, fontSize: sizeHorizontal * 2.0),
                      ),
                      subtitle: Text(
                        x.subTitle,
                        style: kEncodeSansRegular.copyWith(
                            color: kGrey, fontSize: sizeVertical * 1.8),
                      ),
                      trailing: const Icon(Icons.diamond),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: sizeVertical * 14.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> showInfoDialogue(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const Text(
                'this is about how to earn reward with the DataBank App \n\n\n you simply log in everyday to to watch a short vidoe ads and cleam your daily reward'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
}

enum MenuAction { info }

final currentTime = DateTime.now();

final formatter = DateFormat('dd MMM yy');

final hour = int.parse(formatter.format(currentTime));
