import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void navigateTo(context, widget) => Navigator.push(context,
  MaterialPageRoute
    (builder:
      (context) => widget,)
);

void navigateAndFinish(context, widget,) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => widget,
    ), (Route<dynamic>route) => false, );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  //Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String?) validate,
  required String label,
  required IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      //onChanged: onChange != null? onChange() : null,
      onTap: onTap != null? onTap() : null,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: ()
          {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  Function? onTap,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: ()
        {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: chooseToastColor(state),
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      fontSize: 16.0,);

//enum
enum ToastStates {SUCCESS, ERROR, WARNING}

Color? chooseToastColor(ToastStates state)
{
  Color? color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color =  Colors.green;
      break;
    case ToastStates.ERROR:
      color =  Colors.red;
      break;
    case ToastStates.WARNING:
      color =  Colors.amber;
      break;
  }
  return color;
}


