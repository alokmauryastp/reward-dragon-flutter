import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationThemeData {
  final ThemeData _themeData = ThemeData.light().copyWith(
      textTheme: GoogleFonts.interTextTheme(),
      primaryColor: blackApp,
      errorColor: red);

  get getThemeData => _themeData;
}
