import 'package:finyx/core/app_styles.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text('Register View', style: AppStyles.rightReg24)),
        ],
      ),
    );
  }
}
