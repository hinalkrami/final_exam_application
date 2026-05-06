import 'package:final_exam_application/features/onboarding/domain/entities/onboarding_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPageDetails.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Image.asset(onboardingPageDetails[index].image2!, height: 1.sh * 0.3),
                      Image.asset(onboardingPageDetails[index].image1!, height: 1.sh * 0.5),
                    ],
                  ),
                ],
              );
            },
          ),
          Text(onboardingPageDetails[index].heading!),
          SmoothPageIndicator(controller: _pageController, count: onboardingPageDetails.length),
        ],
      ),
    );
  }
}
