import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';


ThemeData lighttheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,

    ),

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 40.0,

  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,

    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData darktheme = ThemeData(
  scaffoldBackgroundColor: HexColor(
      '273746'
  ),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor(
          '273746'
      ),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor(
        '273746'
    ),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,

    ),

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: HexColor(
        '273746'
    ),
    elevation: 40.0,

  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,

    ),
  ),
  fontFamily: 'Jannah',

);

