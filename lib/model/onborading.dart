class Onboarding {
  String img;
  String title;
  String miniTitle;
  String subTitle;
  String desc;
  Onboarding(
      {required this.img,
      required this.title,
      required this.miniTitle,
      required this.subTitle,
      required this.desc});
}

List<Onboarding> onboardingContents = <Onboarding>[
  Onboarding(
      img: 'assets/images/payfromhome.png',
      title: 'DataBank',
      miniTitle: 'Africa\'s favourite app for vtu service purchases',
      subTitle: 'Best app in the market for vtu purchases',
      desc:
          'Why choose us,Buy Airtime,Data and pay for all utility bills from the comfort of your home with ease.'),
  Onboarding(
      img: 'assets/images/becomeaseller.png',
      title: 'DataBank',
      miniTitle: 'Become a reseller',
      subTitle: 'Best app in the market for resellers',
      desc:
          'Why choose us, Become a vendor, buy at a very cheaper rate and resell.\nBecome the middle-man '),
  Onboarding(
      img: 'assets/images/forty_per_off.png',
      title: 'DataBank',
      miniTitle: 'Discount on all our services for resellers',
      subTitle: 'Best discount rate you can\'t afford to lose',
      desc:
          'why choose us, Get 40% off each purchases for all resellers. Buy at a sweet rate and sell and make your profit.'),
  Onboarding(
      img: 'assets/images/paywithcardnbank.png',
      title: 'DataBank',
      miniTitle: 'Easy to fund wallet',
      subTitle: 'Funding made easy with databank!',
      desc:
          'why choose us, Fund your account with ease no stress.\nFunding via Bank transfer and card supported.'),
  Onboarding(
      img: 'assets/images/receiptforall.png',
      title: 'DataBank',
      miniTitle: 'Get prove of payment',
      subTitle: 'Recoreds are kept save!',
      desc:
          'why choose us, Get proof for all your payments receipt in your phone and in your transaction history.'),
  Onboarding(
      img: 'assets/images/sharewithfriends.png',
      title: 'DataBank',
      miniTitle: 'refer and earn',
      subTitle: 'Refer and get rewarded',
      desc:
          'why choose us, Share funds with your friends and also refer a friend an earn a welcome reward.'),
  Onboarding(
      img: 'assets/images/stay_connected.png',
      title: 'DataBank',
      miniTitle: 'Stay connected',
      subTitle: 'without information your deformed',
      desc:
          'why choose us, Stay connected online with our cheap data with 40% discount for all resellers.\nRegister today and earn more and spend less.'),
];
