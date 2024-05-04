import 'package:flutter/material.dart';

import 'ColorsConst.dart';

class AppFonts {
  static const TextStyle sfProText15 = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.3,
    color: AppColors.white1,
  );

  static const TextStyle manrope15 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.3,
    color: AppColors.white1,
  );

  static const TextStyle manrope18 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
    color: AppColors.white1,
  );

  static const TextStyle roboto17 = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 17,
      fontWeight: FontWeight.bold,
      height: 0.94,
      color: Colors.black);

  static const TextStyle robotoNormal14 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    height: 1.1428571428571428,
    color: AppColors.white1,
  );

  static const TextStyle robotoNormal10 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    height: 1.6,
  );

  static const TextStyle manropeNormal16 = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.30000001192092896,
    height: 1,
    color: AppColors.white1,
  );

  static TextStyle sfProTextSizable({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: fontSize ?? 15,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.3,
      color: color ?? AppColors.white1, // Default color is white
    );
  }

  static TextStyle manropeBold18Sizable({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: fontSize ?? 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.3,
      color: color ?? AppColors.white1, // Default color is white
    );
  }

  static TextStyle manropeNormalSizable({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.normal,
      letterSpacing: -0.30000001192092896,
      height: 1,
      color: color ?? AppColors.white1, // Default color is white
    );
  }

  static TextStyle robotoBoldSizable({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 17,
      fontWeight: FontWeight.bold,
      height: 0.94,
      color: color ?? Colors.black,
    );
  }

  static TextStyle robotoNormalSizable({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
      height: 1.1428571428571428,
      color: color ?? AppColors.white1, // Default color is white
    );
  }
}
