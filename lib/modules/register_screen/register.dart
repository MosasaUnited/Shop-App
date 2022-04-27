import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout.dart';
import 'package:shop_app/modules/register_screen/cubit_registerscreen/shop_register_cubit.dart';
import 'package:shop_app/modules/register_screen/cubit_registerscreen/shop_register_state.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class RegisterScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state)
        {
          if(state is ShopRegisterSuccess) {
            if (state.loginUserModel.status) {
              print(state.loginUserModel.message);
              print(state.loginUserModel.data!.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginUserModel.data?.token,).then((value)
              {
                token = state.loginUserModel.data!.token;
                navigateAndFinish(
                  context,
                  ShopLayout(),);
              }
              );
            }
            else
            {
              print(state.loginUserModel.message);
              showToast(
                text: state.loginUserModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state)
        {
          return Scaffold(
          appBar: AppBar(),
          body:Center(
          child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
          key: formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'REGISTER',
          style: Theme.of(context).textTheme.headline3!.
          copyWith(color: Colors.black87),
          ),
          Text(
          'Register now to browse our hot offers',
          style: Theme.of(context).textTheme.bodyText1!.
           copyWith(color: Colors.grey,),
           ),
           SizedBox(
          height: 30.0,
          ),
          defaultFormField(
          controller: nameController,
          type: TextInputType.name,
          validate: (value)
          {
          if(value!.isEmpty)
          {
          return 'please enter your Name';
          }
          },
          label: 'Name',
          prefix: Icons.person,
          ),
          SizedBox(
          height: 15.0,
          ),
          defaultFormField(
          controller: phoneController,
          type: TextInputType.phone,
          validate: (value)
          {
          if(value!.isEmpty)
          {
          return 'please enter your Phone Number';
          }
          },
          label: 'Phone',
          prefix: Icons.phone,
          ),
          SizedBox(
          height: 15.0,
          ),
          defaultFormField(
          controller: emailController,
          type: TextInputType.emailAddress,
          validate: (value)
          {
          if(value!.isEmpty)
          {
          return 'please enter your Email';
          }
          },
          label: 'Email',
          prefix: Icons.email_outlined,
          ),
          SizedBox(
          height: 15.0,
          ),
          defaultFormField(
          controller: passwordController,
          type: TextInputType.visiblePassword,
          suffix: ShopRegisterCubit.get(context).suffix,
          onSubmit: (value) {

          },
          isPassword: ShopRegisterCubit.get(context).isPassword,
          suffixPressed: () {
          ShopRegisterCubit.get(context)
              .changePasswordVisibility();
          },
          validate: (value) {
          if (value!.isEmpty) {
          return 'password is too short';
          }
          },
          label: 'Password',
          prefix: Icons.lock_outline,
          ),
          SizedBox(
          height: 30.0,
          ),
          ConditionalBuilder(
          condition: state is! ShopRegisterLoading,
          builder: (context) => defaultButton(
          function: () {
          if (formKey.currentState!.validate())
          {
          ShopRegisterCubit.get(context).userRegister(
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          name: nameController.text,
          );
          }
          },
          text: 'Register',
          isUpperCase: true,
          ),
          fallback: (context) =>
          Center(child: CircularProgressIndicator()),
          ),



          ],
          ),
          ),
          ),
          ),
          ),
          );
          }
        ),
      );
    }
}
