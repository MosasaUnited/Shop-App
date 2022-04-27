import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/login_model.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeModeState extends AppState {}

class AppInitialStates extends AppState {}

class AppChangeBottomNavStates extends AppState {}

class AppLoadingHomeDataState extends AppState {}

class AppSuccessHomeDataState extends AppState {}

class AppErrorHomeDataState extends AppState {}

class AppSuccessCategoriesState extends AppState {}

class AppErrorCategoriesState extends AppState {}

class AppChangeFavoritesState extends AppState {}

class AppSuccessChangeFavoritesState extends AppState
{
  final ChangeFavoritesModel model;

  AppSuccessChangeFavoritesState(this.model);
}

class AppErrorChangeFavoritesState extends AppState {}

class AppSuccessGetFavoritesState extends AppState {}

class AppErrorGetFavoritesState extends AppState {}

class AppLoadingGetFavoritesState extends AppState {}

class AppSuccessGetUserDataState extends AppState
{
  final LoginModel loginModel;

  AppSuccessGetUserDataState(this.loginModel);
}

class AppErrorGetUserDataState extends AppState {}

class AppLoadingGetUserDataState extends AppState {}

class AppLoadingUpdateProfileState extends AppState {}

class AppSuccessUpdateProfileState extends AppState {}

class AppErrorUpdateProfileState extends AppState {}


