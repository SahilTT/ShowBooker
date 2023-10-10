import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/ui/dashboard_screen.dart';

class ErrorScreen extends StatefulWidget {
  static const String id = "CinemaDetail";

  @override
  State<StatefulWidget> createState() => ErrorScreenState();
}

class ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return mainUi(context);
  }

  Widget mainUi(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: context.resources.color.colorAccentBg,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "404",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontSize: 80,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Page not found",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontSize: context.resources.dimension.extraBigText,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.resources.color.colorPriperyBg,
                  ),
                  onPressed: () {
                    context.pushReplacementNamed(DashboardScreen.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Back to Home',
                      style: TextStyle(
                        fontFamily: context.resources.font.josefinSans,
                        color: context.resources.color.colorPrimaryText
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
