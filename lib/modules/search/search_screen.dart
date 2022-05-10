import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/cubit_search/cubit.dart';
import 'package:shop_app/modules/search/cubit_search/states.dart';
import 'package:shop_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state){},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:
                  [
                    defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String? value)
                        {
                          if(value! .isEmpty)
                          {
                            return 'type here to Search what you looking for';
                          }
                          return null;
                        },
                        onSubmit: (String text)
                        {
                          SearchCubit.get(context).search(text);
                        },
                        label: 'Search',
                        prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                      SizedBox(
                        height: 10.0,
                      ),
                      if(state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildListProduct(SearchCubit.get(context).searchModel!.data.data![index], context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: SearchCubit.get(context).searchModel!.data.data!.length,
                    ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
