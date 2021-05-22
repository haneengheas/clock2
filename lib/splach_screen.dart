import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:task_7_dsc/home_page.dart';
class SplachSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 10000,
      imageSize: 130,
      imageSrc: "assets/clock1.png",
      text: "Clock App",
      textStyle: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(251,115,91,1),
      ),
      backgroundColor: Color.fromRGBO(68,108,156,1),
    );
  }
}
