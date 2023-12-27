// import 'dart:html';
import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customizations/size_config.dart';

class UpgradeToReseller extends StatefulWidget {
  const UpgradeToReseller({super.key});

  @override
  State<UpgradeToReseller> createState() => _UpgradeToResellerState();
}

class _UpgradeToResellerState extends State<UpgradeToReseller> {
  final Uri url = Uri.parse('https://wa.link/cd6sus');
  // String? selectedValue;
  // // File? _imageFile;
  // // File? pickedFile;
  // File? profileImage;
  // // String _mlResult = 'No Result';
  // final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeHorizontal = SizeConfig.blockSizeVertical!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Package Upgrade'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/logo-1.svg'),
              SizedBox(
                height: sizeHorizontal * 5,
              ),
              Text(
                'As a reseller you enoy 40% discount on our services, for data and airtime purchase,cable subscription and electric bill payment, out customer service is top notch. \nKindly reach to us for an upgrade!!!',
                style: kEncodeSansBold.copyWith(
                    color: kGrey, fontSize: sizeHorizontal * 2.0),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        if (!await launchUrl(url)) {
                          throw Exception('could\'t load link $url');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: kWhite,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text('contact Admin for an upgrade'),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3.5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
