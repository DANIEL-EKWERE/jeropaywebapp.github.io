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
      img: 'assets/images/blog-4_ScP3mze.jpg',
      title: 'DataBank',
      miniTitle: 'Africa\'s favourite app for airtime purchase',
      subTitle: 'Why choose us for your airtime purchase',
      desc:
          'why choose us, our airtime offers and prices are very cheap affordable for purchase, pocket friendly as well,we deliver a fast and swift service.'),
  Onboarding(
      img: 'assets/images/pic-5.png',
      title: 'DataBank',
      miniTitle: 'Africa\'s favourite app for data purchase',
      subTitle: 'Why choose us for your bill payments',
      desc:
          'why choose us, our bill payment offers and prices are very cheap affordable for purchase, pocket friendly as well,we deliver a fast and swift service.'),
  Onboarding(
      img: 'assets/images/about-img.jpg',
      title: 'DataBank',
      miniTitle: 'Africa\'s favourite app for data purchase',
      subTitle: 'Why choose us for your data purchase',
      desc:
          'why choose us, our data offers and prices are very cheap affordable for purchase, pocket friendly as well,we deliver a fast and swift service.'),
];
