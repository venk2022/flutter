import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData get lightTheme => ThemeData(
        primarySwatch : Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: MyTheme.creamcolor,
        colorScheme: ColorScheme.dark().copyWith(
          primary: MyTheme.darkbluish,
          secondary: darkbluish,
      ),
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
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
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: MyTheme.darkcolor,
    colorScheme: ColorScheme.dark().copyWith(
      primary: MyTheme.darkcolor,
      secondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.lato(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20.0,
      ),
      toolbarTextStyle: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
  );

  //colors
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcolor = Vx.gray900;
  static Color darkbluish = Color(0xff403b58);
  static Color lightbluish = Vx.purple400;


}