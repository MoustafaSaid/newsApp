import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapplication/layout/news_app/cubit/cubit.dart';
import 'package:newapplication/layout/news_app/cubit/states.dart';
import 'package:newapplication/shared/componant/componants.dart';

class SearchScreen extends StatelessWidget {
var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
listener:(context, state) {

} ,
    builder: (context, state)

  {
var list=NewsCubit.get(context).Search;
  return Scaffold(
    appBar: AppBar(),
    body: Column(

      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: defultFormField(
              controller: searchController,
              type: TextInputType.text,
              validate: (String? value){
                if(value!.isEmpty){
                  return 'search must not be empty';
                }
                return null;
              },
              onChange: (value){
                NewsCubit.get(context).getSearch(value);
              },
              label: 'Search',
              prefix: Icons.search
          ),
        ),
        Expanded(child: ArticleBuilder(list, context,isSearch: true)),
      ],
    ),
  );
    },


    );
  }
}
