import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData get themeData => ThemeData(
        primarySwatch : Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
          ),
          
          toolbarTextStyle: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 18.0,
          )
        )
      );

  //colors
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkbluish = Color(0xff403b58);


}