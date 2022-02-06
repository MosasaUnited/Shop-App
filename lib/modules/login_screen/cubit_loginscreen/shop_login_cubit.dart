import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/network/remote/dio_helper_shop.dart';
import '../../../network/end_points.dart';
part 'shop_login_state.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitial());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
  required String email,
  required String password
})
  {
    emit(ShopLoginLoading());

    DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        },
    ).then((value) 
    {
      print(value.data);
      emit(ShopLoginSuccess());
    }).catchError((error)
    {
      emit(ShopLoginError(error.toString()));
    });
  }
}
