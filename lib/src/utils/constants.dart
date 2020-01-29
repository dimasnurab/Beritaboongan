import 'package:flutter/material.dart';

class BoboonganAppTheme {
  BoboonganAppTheme._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);

  static const TextStyle appBartitleStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 0.4,
    color: Color(0xFF17262A),
  );

  static const TextStyle titleStyleCardBerita = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: nearlyBlack,
  );

  static const TextStyle titleCardBeritadua = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const TextStyle topNewsTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.7,
    color: darkerText,
  );
}
