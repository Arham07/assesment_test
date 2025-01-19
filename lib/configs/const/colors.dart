
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var radius = BorderRadius.circular(25.r);
var horizontalPadding = 20.w;
var verticalPadding = 10.h;

/// Colors
Color primary = const Color(0xff6750A4);
Color secondary = const Color(0xFFFFFFFF);
Color onPrimary = const Color(0xFFE6E0E9);
Color greyText = const Color(0xFF625B71);

List<BoxShadow> boxShadow = [
  BoxShadow(
    color: onPrimary.withOpacity(0.3),
    offset: Offset(0, 0),
    spreadRadius: 5,
    blurRadius: 1,
  ),
];

LinearGradient gradientRed = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xff8B0000), Color(0xff250000)],
);

/// For Material Colors
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
