import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/app_cubit.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/styles/colors.dart';


class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: state is! AppLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                buildFavItem(ShopCubit.get(context).favoritesModel!.data!.data![index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavItem(FavoritesData? model, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              alignment: AlignmentDirectional.bottomStart,
              children:
              [
                Image(
                  image: NetworkImage(model!.product!.image!),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.product!.discount! !=0 )
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ]
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.product!.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.product!.price.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 1.5,
                        color: defaultColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    if(model.product!.discount != 0)
                      Text(
                        model.product!.oldPrice.toString(),
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorites(model.product!.id);
                      },
                      padding: EdgeInsets.zero,
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favorites[model.product!.id]! ? defaultColor : Colors.grey ,
                        child: Icon(
                          Icons.favorite_border,
                          size: 15.0,
                          color: Colors.white,
                        ),
                      ),


                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
