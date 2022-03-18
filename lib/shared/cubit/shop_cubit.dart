import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper_shop.dart';

import '../../models/home_model.dart';



class ShopCubit extends Cubit<AppState> {
  ShopCubit() : super(AppInitialState());

  static ShopCubit get (context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),

  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  HomeModel? homeModel;

  void getHomeData()
  {
    emit(AppLoadingHomeDataState());

    DioHelper.getData(url: HOME).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

      printFullText(homeModel.toString());

      emit(AppSuccessHomeDataState());
    }).catchError((error)
    {
      printFullText(error.toString());
      emit(AppErrorHomeDataState());
    });
  }
}
