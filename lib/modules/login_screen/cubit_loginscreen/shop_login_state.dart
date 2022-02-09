part of 'shop_login_cubit.dart';

abstract class ShopLoginStates {}

class ShopLoginInitial extends ShopLoginStates {}
class ShopLoginLoading extends ShopLoginStates {}
class ShopLoginSuccess extends ShopLoginStates {}
class ShopLoginError extends ShopLoginStates
{
  final String error;

  ShopLoginError(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginStates {}