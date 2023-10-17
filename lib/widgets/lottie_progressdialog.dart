
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieProgressDialogWidget extends StatefulWidget {
  LottieProgressDialogWidgetState _dialog = LottieProgressDialogWidgetState();

  LottieProgressDialogWidget({super.key});

  update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class LottieProgressDialogWidgetState extends State<LottieProgressDialogWidget> {

  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Lottie.asset(
              "assets/dblue_progress.json",
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}