import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/onboarding_nav_bar.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';
import '../model/onborading.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? purple : kLightGrey,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _pageController,
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            OnboardingNavBar(
                              name: 'Skip',
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/Login", (route) => false);
                              },
                              buttonColor: kYellow,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: SizedBox(
                          height: sizeVertical * 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Image.asset(
                              onboardingContents[index].img,
                              fit: BoxFit.contain,
                              height: sizeVertical * 1,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            onboardingContents[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: kEncodeSansBold.copyWith(
                                color: kBlack, fontSize: sizeVertical * 3),
                          ),
                        ),
                      ),
                      SizedBox(height: sizeVertical * 2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FittedBox(
                            child: Text(
                              onboardingContents[index].miniTitle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: kEncodeSansBold.copyWith(
                                  color: kGrey, fontSize: sizeVertical * 3.20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: sizeVertical * 2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.auto_awesome,
                                color: kYellow,
                              ),
                              SizedBox(width: sizeVertical * 1.5),
                              FittedBox(
                                child: Text(
                                  onboardingContents[index].subTitle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: kEncodeSansBold.copyWith(
                                      color: kBlack,
                                      fontSize: sizeVertical * 1.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: sizeVertical * 2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            onboardingContents[index].desc,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: kEncodeSansSemiBold.copyWith(
                                color: kGrey, fontSize: sizeVertical * 2.1),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => AnimatedContainer(
                                  margin: const EdgeInsets.only(right: 8),
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: kYellow,
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  duration: const Duration(milliseconds: 400),
                                ),
                              ),
                            ),
                            OnboardingNavBar(
                                name: 'Get Stared',
                                onPressed: () {
                                  //   _pageController.nextPage(
                                  //       duration:
                                  //           const Duration(milliseconds: 400),
                                  //       curve: Curves.easeOut);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "/Register", (route) => false);
                                },
                                buttonColor: kYellow)
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                            OnboardingNavBar(
                                name: 'Next',
                                onPressed: () {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeOut);
                                },
                                buttonColor: kYellow)
                          ],
                        ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
