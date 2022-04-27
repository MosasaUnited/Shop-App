import 'package:shop_app/models/login_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitial extends ShopRegisterStates {}
class ShopRegisterLoading extends ShopRegisterStates {}
class ShopRegisterSuccess extends ShopRegisterStates {
  final LoginModel loginUserModel;

  ShopRegisterSuccess(this.loginUserModel);
}
class ShopRegisterError extends ShopRegisterStates
{
  final String error;

  ShopRegisterError(this.error);
}
class ShopChangeRegisterPasswordVisibilityState extends ShopRegisterStates {}