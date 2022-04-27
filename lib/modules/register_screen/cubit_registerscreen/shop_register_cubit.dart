import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/register_screen/cubit_registerscreen/shop_register_state.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper_shop.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitial());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userRegister({
  required String email,
  required String name,
  required String phone,
  required String password
}) {
    emit(ShopRegisterLoading());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data!.token);

      emit(ShopRegisterSuccess(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterError(error.toString()));
    });
  }

    IconData suffix = Icons.visibility_outlined;
    bool isPassword = true;

    void changePasswordVisibility()
    {
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

      emit(ShopChangeRegisterPasswordVisibilityState());
    }
  }
