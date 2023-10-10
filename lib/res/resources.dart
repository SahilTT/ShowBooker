
import 'package:flutter/cupertino.dart';
import 'colors/app_colors.dart';
import 'dimentions/app_dimension.dart';
import 'fonts/app_fonts.dart';
import 'gradient/app_gradient.dart';

import 'strings/EnglishStrings.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  get strings {
    // It could be from the user preferences or even from the current locale
    // Locale locale = Localizations.localeOf(_context);
    //
    // // SharedPreferences prefs = await SharedPreferences.getInstance();
    // // switch ( prefs.getString(KeyConst.PREF_COUNTRY)) {
    // //   case 'india':
    // //     return IndiaStrings();
    // //   default:
    // //     return AustraliaStrings();
    // // }
    //
    // printOnDebug("Country is ${locale.languageCode}");
    // switch (locale.languageCode) {
    //   case 'fr':
    //     return FrenchStrings();
    //   default:
        return EnglishStrings();
    // }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  AppGradient get gradient {
    return AppGradient();
  }

  AppFont get font {
    return AppFont();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}