import 'package:shop_app/models/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitial extends ShopLoginStates {}
class ShopLoginLoading extends ShopLoginStates {}
class ShopLoginSuccess extends ShopLoginStates {
  final LoginModel loginUserModel;

  ShopLoginSuccess(this.loginUserModel);
}
class ShopLoginError extends ShopLoginStates
{
  final String error;

  ShopLoginError(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginStates {}