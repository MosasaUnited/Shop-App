import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import '../modules/login_screen/login_screen.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Salla',
        ),
      ),
      body: TextButton(
        onPressed: ()
        {
          CacheHelper.removeData(key: 'token').then((value)
          {
            if(value!)
            {
              navigateAndFinish(context, LoginScreen(),);
            }
          });
        },
        child: Text(
          'SIGN OUT',
        ),
      ),
    );
  }
}
