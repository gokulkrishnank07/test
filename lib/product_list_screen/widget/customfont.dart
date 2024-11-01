import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFont {
  CustomFont();
  final TextStyle appbarText = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600));
  final TextStyle labelText =
      GoogleFonts.poppins(color: Colors.grey, fontSize: 13);
  final TextStyle bodyText = GoogleFonts.poppins(
      textStyle: TextStyle(color: Colors.black, fontSize: 14));
  final TextStyle subtitleText = GoogleFonts.questrial(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ));
  final TextStyle buttontext = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600));
  final TextStyle hintText = GoogleFonts.poppins(color: Colors.black);
  final TextStyle titleText = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16));
  final TextStyle subText = GoogleFonts.roboto(
      textStyle: const TextStyle(color: Colors.black, fontSize: 15));
}

class CustomSize {
  CustomSize();
  static double iconSize = 20.0;
}
