class OnBoard {
  final String image, title, description;
  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demoData = [
  OnBoard(
      image: 'assets/img/onboarding1.png',
      title: 'Welcome to SD2B',
      description: ' Discover the power of smart financing with SD2B.'),
  OnBoard(
      image: 'assets/img/onboarding2.png',
      title: 'Achieve Financial Freedom',
      description: 'With SD2B, you can access tailored financing solutions.'),
  OnBoard(
      image: 'assets/img/onboarding3.png',
      title: 'Join Our Financial Community',
      description: 'Become a part of our growing community of financially savvy individuals.'),
];
