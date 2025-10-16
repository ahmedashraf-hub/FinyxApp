import 'package:finyx/core/routes.dart';
import 'package:finyx/features/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FinyxApp());
}

class FinyxApp extends StatelessWidget {
  const FinyxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingView.routeName,
      routes: routes,
    );
  }
}
