import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle latoRegular(double size, [Color? color]) {
    return GoogleFonts.lato(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle latoSemiBold(double size, [Color? color]) {
    return GoogleFonts.lato(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle latoBold(double size, [Color? color]) {
    return GoogleFonts.lato(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle latoExtraBold(double size, [Color? color]) {
    return GoogleFonts.lato(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w800,
    );
  }
}
