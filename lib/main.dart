import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/app_cubit.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper_shop.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'modules/onboarding_screen.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  await CacheHelper.init();
  bool? isDark = CacheHelper.getData('isDark');
  bool? onBoarding = CacheHelper.getData('onBoarding');

  runApp(MyApp(
    isDark: isDark,
    onBoarding: onBoarding,
  ));


}

// Class myApp

class MyApp extends StatelessWidget
{

  final bool? isDark;
  final bool? onBoarding;

  MyApp({
    this.isDark,
    this.onBoarding,
  });

  @override
  Widget build(BuildContext Context)
  {
    return MultiBlocProvider(
        providers: [

          BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
            fromShared: isDark,
        ),
        ),
        BlocProvider(
        create: (BuildContext context) => AppCubit(),
        ),
        ],
        child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lighttheme,
        darkTheme: darktheme,
        themeMode:
        AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        home: OnBoardingScreen(),
        );
        },
    ),
    );

  }





}
