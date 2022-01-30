import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';
import '../registter_screen/register.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headline3!.
                  copyWith(color: Colors.black87),
                ),
                Text(
                  'login now to browse our hot offers',
                  style: Theme.of(context).textTheme.bodyText1!.
                  copyWith(color: Colors.grey,),
                ),
                SizedBox(
                  height: 30.0,
                ),
                defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'please enter your email address';
                      }
                    },
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'the password isn\'t correct';
                    }
                  },
                  label: 'Password',
                  prefix: Icons.lock_outlined,
                  suffix: Icons.visibility_outlined,
                ),
                SizedBox(
                  height: 30.0,
                ),
                defaultButton(
                    text: 'Login',
                    function: (){},
                    isUpperCase: true,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text(
                      'don\'t have an account ?'
                    ),
                    TextButton(onPressed: ()
                    {
                      navigateTo(context, RegisterScreen());
                    },
                    child: Text('Register'),),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
