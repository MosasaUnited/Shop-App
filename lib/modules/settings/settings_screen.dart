import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';


class SettingsScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state)
    {

      var model = ShopCubit.get(context).userModel;

      nameController.text = model!.data!.name!;
      emailController.text = model.data!.email!;
      phoneController.text = model.data!.phone!;

      return ConditionalBuilder(
        condition: ShopCubit.get(context).userModel != null,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:
            [
              defaultFormField(
                controller: nameController,
                type: TextInputType.name,
                validate: (String? value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Name can\'t be Empty';
                  }
                },
                label: 'Name',
                prefix: Icons.person,),
              SizedBox(
                height: 10.0,
              ),

              defaultFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validate: (String? value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Email can\'t be Empty';
                  }
                },
                label: 'E-mail',
                prefix: Icons.email,),
              SizedBox(
                height: 10.0,
              ),

              defaultFormField(
                controller: phoneController,
                type: TextInputType.phone,
                validate: (String? value)
                {
                  if(value!.isEmpty)
                  {
                    return 'Phone Number can\'t be Empty';
                  }
                },
                label: 'Phone',
                prefix: Icons.phone,),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  function: ()
                  {
                    signOut(context);
                  },
                  text: 'Logout',
              )


            ],
          ),
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      );
    } ,
    );
  }
}
