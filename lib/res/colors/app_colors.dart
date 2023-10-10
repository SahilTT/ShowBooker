import 'dart:ui';

import 'package:flutter/material.dart';
import 'base_colors.dart';

class AppColors implements BaseColors{

  final Map<int, Color> _primary =
  {
    50:const Color.fromRGBO(242, 245, 250, 0.1),
    100:const Color.fromRGBO(242, 245, 250, 0.2),
    200:const Color.fromRGBO(242, 245, 250, 0.3),
    300:const Color.fromRGBO(242, 245, 250, 0.4),
    400:const Color.fromRGBO(242, 245, 250, 0.5),
    500:const Color.fromRGBO(242, 245, 250, 0.6),
    600:const Color.fromRGBO(242, 245, 250, 0.7),
    700:const Color.fromRGBO(242, 245, 250, 0.8),
    800:const Color.fromRGBO(242, 245, 250, 0.9),
    900:const Color.fromRGBO(242, 245, 250, 1.0),
  };

  final Map<int, Color> aceent =
  {
    50:const Color.fromRGBO(29, 33, 47, 0.1),
    100:const Color.fromRGBO(29, 33, 47, 0.2),
    200:const Color.fromRGBO(29, 33, 47, 0.3),
    300:const Color.fromRGBO(29, 33, 47, 0.4),
    400:const Color.fromRGBO(29, 33, 47, 0.5),
    500:const Color.fromRGBO(29, 33, 47, 0.6),
    600:const Color.fromRGBO(29, 33, 47, 0.7),
    700:const Color.fromRGBO(29, 33, 47, 0.8),
    800:const Color.fromRGBO(29, 33, 47, 0.9),
    900:const Color.fromRGBO(29, 33, 47, 1.0),
  };

  @override
  MaterialColor get colorAccent => MaterialColor(0x1D212FFF,aceent);

  @override
  MaterialColor get colorPrimary => MaterialColor(0xF2F5FAFF,_primary);

  @override
  Color get colorPrimaryText => const Color(0xff090A0B);

  @override
  Color get colorSecondaryText => const Color(0xffFFFFFF);

  @override
  Color get colorAccentBg => const Color(0xff00212F);

  @override
  Color get colorPriperyBg => const Color(0xffF2F5FA);

  @override
  Color get colorInactiveText => const Color(0xff7B8090);

  @override
  Color get colorCardTitleBg => const Color(0xd3212121);
}