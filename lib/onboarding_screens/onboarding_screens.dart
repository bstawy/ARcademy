import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/widgets/custom_material_button.dart';
import '../login_screen/login_screen.dart';
import 'onboarding_model.dart';
import 'widgets/onboarding_widget.dart';
import 'widgets/skip_button.dart';

class OnboardingScreens extends StatefulWidget {
  static const String routeName = '/';

  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  List<OnboardingModel> onboardingScreens = [
    OnboardingModel(
      title: "Immersive\nLearning Experience",
      description:
          "Visualize anatomy in 3D with interactive models, Engage in quizzes and real-world simulations for comprehensive understanding.",
      imagePath: "assets/images/onboarding_image_01.svg",
      //"assets/images/onboarding_image_01_dark.svg",
    ),
    OnboardingModel(
      title: "Flexible Learning\nAnytime, Anywhere",
      description:
          "Study at your own pace, on various devices, Break free from traditional constraints, accessing knowledge wherever you are.",
      imagePath: "assets/images/onboarding_image_02.svg",
      //"assets/images/onboarding_image_02_dark.svg",
    ),
    OnboardingModel(
      title: "User-Friendly\nInterface",
      description:
          "Connect through shared AR experiences and virtual dissections, Intuitive design promotes a seamless learning experience, creating an environment that is both engaging and user-friendly.",
      imagePath: "assets/images/onboarding_image_03.svg",
      //"assets/images/onboarding_image_03_dark.svg",
    ),
  ];

  late PageController onboardingController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    onboardingController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    onboardingController.dispose();
  }

  nextOnboardingScreen() {
    onboardingController.nextPage(
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
  }

  changeCurrentIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (currentIndex < 2)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SkipButton(onClicked: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        }),
                      ],
                    )
                  : SizedBox(height: 48.h),
              SizedBox(height: 24.h),
              Expanded(
                child: PageView(
                  controller: onboardingController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: changeCurrentIndex,
                  children: [
                    OnboardingWidget(model: onboardingScreens[0]),
                    OnboardingWidget(model: onboardingScreens[1]),
                    OnboardingWidget(model: onboardingScreens[2]),
                  ],
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: onboardingController,
                  count: onboardingScreens.length,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                    activeDotColor: theme.colorScheme.primary,
                    dotColor: theme.colorScheme.secondary,
                    dotHeight: 6.h,
                    radius: 8.r,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomMaterialButton(
                title: (currentIndex < 2) ? "Next" : "Get Started",
                onClicked: () {
                  if (currentIndex < 2) {
                    currentIndex++;
                    nextOnboardingScreen();
                  } else {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
