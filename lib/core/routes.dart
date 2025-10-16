import 'package:finyx/features/login/views/login_view.dart';
import 'package:finyx/features/onboarding/views/onboarding_view.dart';
import 'package:finyx/features/register/views/register_view.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingView.routeName: (context) => OnboardingView(),
  LoginView.routeName: (context) => LoginView(),
  RegisterView.routeName: (context) => RegisterView(),
};
