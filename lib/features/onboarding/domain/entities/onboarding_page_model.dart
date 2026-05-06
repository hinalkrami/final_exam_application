import '../../../../generated/assets.dart';

class OnboardingPageModel {
  String? image1;
  String? image2;

  String? heading;
  OnboardingPageModel({this.image1, this.image2, this.heading});
}

List<OnboardingPageModel> onboardingPageDetails = [
  OnboardingPageModel(
    image1: Assets.images.onboardingScreen1Image1.path,
    image2: Assets.images.onboardingScreen1Image2.path,
    heading: 'Find Amazing people around you',
  ),
  OnboardingPageModel(heading: 'Find your Perfect match'),
  OnboardingPageModel(heading: 'Meet & chat to people near you'),
];
