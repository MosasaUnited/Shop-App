import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/remote/dio_helper_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../network/end_points.dart';
part 'shop_login_state.dart';



class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitial());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
  required String email,
  required String password
}) {
    emit(ShopLoginLoading());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      emit(ShopLoginSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginError(error.toString()));
    });
  }

    IconData suffix = Icons.visibility_outlined;
    bool isPassword = true;

    void changePasswordVisibility()
    {
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

      emit(ShopChangePasswordVisibilityState());
    }
  }
