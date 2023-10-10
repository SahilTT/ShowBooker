import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive(
      {super.key, required this.mobile, this.tablet, this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
          MediaQuery.of(context).size.width >= 700;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width<750){
      return mobile;
    }else if(MediaQuery.of(context).size.width < 1000 &&
        MediaQuery.of(context).size.width >= 750){
      return tablet!;
    }else{
      return desktop!;
    }
  }
}