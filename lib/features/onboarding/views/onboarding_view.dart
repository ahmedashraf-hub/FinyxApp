import 'package:finyx/features/onboarding/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static String routeName = '/onBoarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnboardingViewBody());
  }
}
