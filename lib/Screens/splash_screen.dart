import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../utils/constants.dart';
import 'mtn_shot_codes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const MTNShotCodesCenter(),
      duration: 6000,
      imageSize: 120,
      imageSrc: "images/mtnsplashscreen.jpg",
      text: kAppBarName,
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 15.0,
      ),
      backgroundColor: kSplashScreenColor,
    );
  }
}
