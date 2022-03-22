import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';


class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, AppState>(
      listener: (context, state){},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition:  ShopCubit.get(context).homeModel != null,
          builder:  (context) => productsBuilder(ShopCubit.get(context).homeModel!),
          fallback: (context) => Center(child: CircularProgressIndicator(
          )) ,
        );
      },
    );
  }

  Widget productsBuilder(HomeModel model) => Column(
      children: [
        CarouselSlider(
          items: model.data?.banners.map((e) => Image(
            image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),).toList(),
          options: CarouselOptions(
            height: 200.0,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,

          ),
        ),
      ],
  );
}
