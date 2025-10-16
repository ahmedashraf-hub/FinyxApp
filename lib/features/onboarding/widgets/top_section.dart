import 'package:finyx/core/app_styles.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  final String title, subTitle, imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: Image.asset(imagePath),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.rightReg24.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        Text(subTitle, textAlign: TextAlign.start, style: AppStyles.remReg16),
      ],
    );
  }
}
