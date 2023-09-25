import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/onboarding_nav_bar.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';
import '../model/onborading.dart';
import 'app_layout.dart';

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
        color: currentPage == index ? kGrey : kLightGrey,
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
      backgroundColor: Colors.white,
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
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            OnboardingNavBar(
                              name: 'Skip',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const AppLayout())),
                                );
                              },
                              buttonColor: kBlack,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      SizedBox(
                        height: sizeVertical * 1,
                        child: Image.asset(onboardingContents[index].img,
                            fit: BoxFit.contain),
                      ),
                      SizedBox(height: sizeVertical * 1),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            onboardingContents[index].subTitle,
                            maxLines: 3,
                            style: kEncodeSansBold.copyWith(
                                color: kBlack, fontSize: sizeVertical * 1.5),
                          ),
                        ),
                      )
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
                                    duration: const Duration(milliseconds: 400),
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: kYellow,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              OnboardingNavBar(
                                  name: 'Get Started',
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeOut);
                                  },
                                  buttonColor: kGrey)
                            ],
                          )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                            children: List.generate(onboardingContents.length, (index) => dotIndicator(index)),
                            ),
                            OnboardingNavBar(name: 'Next', onPressed: (){_pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeOut);}, buttonColor:kYellow)
                          ],
                        )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
