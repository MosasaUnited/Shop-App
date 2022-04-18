import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper_shop.dart';
import '../../models/favorites_model.dart';
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

  Map<dynamic, dynamic> favorites = {};

  void getHomeData()
  {
    emit(AppLoadingHomeDataState());

    DioHelper.getData(
        url: HOME,
        token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

      //printFullText(homeModel.toString());

      homeModel?.data?.products.forEach((element)
      {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      });

      //print(favorites.toString());

      emit(AppSuccessHomeDataState());
    }).catchError((error)
    {
      printFullText(error.toString());
      emit(AppErrorHomeDataState());
    });
  }

  CategoriersModel? categoriesModel;

  void getCategories()
  {
    emit(AppLoadingHomeDataState());

    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value)
    {
      categoriesModel = CategoriersModel.fromJson(value.data);

      //printFullText(homeModel.toString());

      emit(AppSuccessCategoriesState());
    }).catchError((error)
    {
      printFullText(error.toString());
      emit(AppErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int? productID)
  {
    favorites[productID] = !favorites[productID];

    emit(AppChangeFavoritesState());

    DioHelper.postData(
        url: FAVORITES,
        data: {'product_id' : productID},
        token: token,
        ).then((value) 
        {
          changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
          print(value.data);

          if(changeFavoritesModel!.status == false)
          {
            favorites[productID] = !favorites[productID];
          }else
          {
            getFavorites();
          }
          emit(AppSuccessChangeFavoritesState(changeFavoritesModel!));
        })
        .catchError((error)
        {
          favorites[productID] = !favorites[productID];

          emit(AppErrorChangeFavoritesState());
          print(error.toString());
        });
  }

  FavoritesModel? favoritesModel;

  void getFavorites()
  {
    emit(AppLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value)
    {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(AppSuccessGetFavoritesState());
    }).catchError((error)
    {
      printFullText(error.toString());
      emit(AppErrorGetFavoritesState());
    });
  }

  LoginModel? userModel;

  void getUserData()
  {
    emit(AppLoadingGetUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value)
    {
      userModel = LoginModel.fromJson(value.data);
      printFullText(userModel!.data!.name!);

      emit(AppSuccessGetUserDataState(userModel!));
    }).catchError((error)
    {
      printFullText(error.toString());
      emit(AppErrorGetUserDataState());
    });
  }
}
