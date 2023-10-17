import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieProgressAnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/animation_progress.json",
        height: 200, // Adjust the height and width as needed
        width: 200,
        repeat: true, // Set to true if you want the animation to loop
      ),
    );
  }
}
