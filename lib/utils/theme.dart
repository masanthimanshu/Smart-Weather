import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.teal),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
);
