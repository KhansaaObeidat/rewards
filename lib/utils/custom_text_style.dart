import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewards_app/utils/responsive_size.dart';

class CustomTextStyle {
  CustomTextStyle? _instance;

  Future<CustomTextStyle> getInstance() async {
    _instance = CustomTextStyle();
    return _instance!;
  }

  TextStyle regularUnderLine({Color? color, double? size}) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
      color: color,
      fontSize: ResponsiveTextSize().textSize(size),
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    ));
  }

  TextStyle regular({Color? color, double? size}) {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
      color: color,
      decoration: TextDecoration.none,
      fontSize: ResponsiveTextSize().textSize(size),
      fontWeight: FontWeight.w400,
    ));
  }

  TextStyle medium({Color? color, double? size}) {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontSize: ResponsiveTextSize().textSize(size),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  TextStyle bold({Color? color, double? size}) {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontSize: ResponsiveTextSize().textSize(size),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextStyle semibold({Color? color, double? size}) {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontSize: ResponsiveTextSize().textSize(size),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}