
import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'modules/onboarding_screen.dart';
import 'network/remote/dio_helper_shop.dart';


void main()
{
  DioHelper.init();
  runApp(MyApp());
}

// Class myApp

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext Context)
  {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      darkTheme: darktheme,
      home: OnBoardingScreen(),
    );

  }





}
