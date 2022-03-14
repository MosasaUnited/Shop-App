import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout.dart';
import 'package:shop_app/modules/login_screen/login_screen.dart';
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

  Widget? widget;

  bool? onBoarding = CacheHelper.getData('onBoarding');
  String? token = CacheHelper.getData('token');

  if(onBoarding != null)
  {
    if(token != null) widget = ShopLayout();
    else widget = LoginScreen();
  }else
    {
      widget = OnBoardingScreen();
    }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));


}

// Class myApp

class MyApp extends StatelessWidget
{

  final bool? isDark;
  final Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
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
        home: startWidget,
        );
        },
    ),
    );

  }





}
