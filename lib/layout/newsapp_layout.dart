import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapplication/layout/news_app/cubit/cubit.dart';
import 'package:newapplication/layout/news_app/cubit/states.dart';
import 'package:newapplication/modules/search/search.dart';
import 'package:newapplication/shared/componant/componants.dart';
import 'package:newapplication/shared/cubit.dart';
import 'package:newapplication/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
var containerKer=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      listener:(context, state) {}   ,
      builder: (context,state){
        var cubit =NewsCubit.get(context);

        return Scaffold(
        appBar: AppBar(
        title: Text(
    'News App'
    ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
navigteTo(context, SearchScreen());
              },
            ),

            IconButton(
              onPressed: () {
appCubit.get(context).newchange();
              },
              icon:Icon(
                Icons.brightness_2_outlined,


              ) ,
            ),
          ],
    ),

    body: cubit.Screens[cubit.CurrentIndex],
    bottomNavigationBar: BottomNavigationBar(
    enableFeedback: true,
    currentIndex: cubit.CurrentIndex,
    onTap: (index){
      cubit.ChangeNavBarScreen(index);

    },
    items:cubit.bottomItems,
    ),


    );
    },
    );
  }
}
