import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';

class Contactdatabank extends StatelessWidget {
  const Contactdatabank({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    double sizeVertical = SizeConfig.blockSizeVertical!;
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: openDrawer, icon: const Icon(Icons.menu)),
        centerTitle: true,
        title: Text(
          'Contact jero pay',
          style: kEncodeSansRegular.copyWith(
              color: kGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: sizeHorizontal * 35,
                decoration: const BoxDecoration(
                   gradient: LinearGradient(
                            colors: [
                    //          Color(0xFFB0FFC1),
                    // Color(0xFFB3C2FF),
                    purple,purple
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.online_prediction,
                          color: kWhite,
                          size: 30,
                        ),
                        SizedBox(
                          width: sizeVertical * 2.5,
                        ),
                        Text(
                          'Customer Care services.... 8am\n to 10pm',
                          style: kEncodeSansSemiBold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 2.5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: kWhite,
                          size: 30,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        Text(
                          '07013715767',
                          style: kEncodeSansSemiBold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 2.5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kWhite,
                          size: 30,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        Text(
                          'Elelewon, Port Harcourt',
                          style: kEncodeSansSemiBold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 2.5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: kWhite,
                          size: 30,
                        ),
                        SizedBox(
                          width: sizeHorizontal * 2.5,
                        ),
                        Text(
                          'Jero Pay8@gmail.com',
                          style: kEncodeSansSemiBold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
