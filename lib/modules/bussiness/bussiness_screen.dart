import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapplication/layout/news_app/cubit/cubit.dart';
import 'package:newapplication/layout/news_app/cubit/states.dart';
import 'package:newapplication/shared/componant/componants.dart';

class BussinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      listener:(context, state) {

      } ,
      builder: (context, state) {
        var list=NewsCubit.get(context).business;
        return ArticleBuilder(list,context);
      },
    );
  }
}
