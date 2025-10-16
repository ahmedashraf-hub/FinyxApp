import 'package:finyx/core/app_colors.dart';
import 'package:finyx/core/app_styles.dart';
import 'package:finyx/features/login/views/login_view.dart';
import 'package:finyx/features/onboarding/widgets/custom_button.dart';
import 'package:finyx/features/onboarding/widgets/top_section.dart';
import 'package:finyx/features/register/views/register_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPage = 0;
  final PageController _controller = PageController();
  List<Map<String, String>> onBoardingData = [
    {
      "title": "Welcome to Finyx!",
      "subTitle":
          "Take control of your finances effortlessly track, save, and grow with ease",
      "imagePath": "assets/images/financial-planning_2_1.png",
    },
    {
      "title": "Plan your finances",
      "subTitle":
          "track your progress, and achieve your financial goals with confidence",
      "imagePath": "assets/images/report 1.png",
    },
    {
      "title": "Take control of your finances!",
      "subTitle":
          "Plan wisely, manage efficiently, and achieve your financial goals with ease.",
      "imagePath": "assets/images/p-removebg-preview 1.png",
    },
  ];

  void goToNextPage() {
    if (currentPage < onBoardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    }
  }

  void skipPage() {
    if (currentPage < onBoardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentPage < onBoardingData.length - 1)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: skipPage,
                  child: Text(
                    'Skip',
                    style: AppStyles.rightReg24.copyWith(
                      color: AppColors.skipColor,
                    ),
                  ),
                ),
              )
            else
              const SizedBox(height: 48),

            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => TopSection(
                  title: onBoardingData[index]["title"]!,
                  subTitle: onBoardingData[index]["subTitle"]!,
                  imagePath: onBoardingData[index]['imagePath']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    title: currentPage == onBoardingData.length - 1
                        ? 'Login'
                        : 'Next',
                    onPressed: () {
                      if (currentPage == onBoardingData.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginView.routeName,
                        );
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },
                    child: Text(
                      'New to Finyx ? Register Now',
                      style: AppStyles.popMedium14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index = 0}) {
    return AnimatedContainer(
      height: 6,
      width: currentPage == index ? 20 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColors.dotPageColor
            : AppColors.dotColor,
        borderRadius: BorderRadius.circular(3),
      ),
      duration: Durations.extralong1,
    );
  }
}
