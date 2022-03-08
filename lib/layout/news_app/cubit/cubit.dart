import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapplication/layout/news_app/cubit/states.dart';
import 'package:newapplication/modules/bussiness/bussiness_screen.dart';
import 'package:newapplication/modules/science/science_screen.dart';
import 'package:newapplication/modules/sports/sports_screen.dart';
import 'package:newapplication/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewStates> {
  NewsCubit() : super(NewsIntialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;


  List<BottomNavigationBarItem> bottomItems = [

    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: 'Science',
    ),

  ];

  void ChangeNavBarScreen(int index) {
    CurrentIndex = index;
    // if(index==0){
    //   getBusiness();
    // }
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<Widget> Screens = [
    BussinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '32639afe5394417d97f0e2c4b6198cea',
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=32639afe5394417d97f0e2c4b6198cea
//            https://newsapi.org/v2/everything?q=tesla&from=2021-12-19&sortBy=publishedAt&apiKey=API_KEY
      },
      //https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=32639afe5394417d97f0e2c4b6198cea
    ).then((value) {
      // print(value.data.toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }


  List<dynamic> Sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (Sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '32639afe5394417d97f0e2c4b6198cea',
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=32639afe5394417d97f0e2c4b6198cea
//            https://newsapi.org/v2/everything?q=tesla&from=2021-12-19&sortBy=publishedAt&apiKey=API_KEY
        },
        //https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=32639afe5394417d97f0e2c4b6198cea
      ).then((value) {
        // print(value.data.toString());
        Sports = value.data['articles'];
        print(Sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> Science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (Science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'Science',
          'apiKey': '32639afe5394417d97f0e2c4b6198cea',
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=32639afe5394417d97f0e2c4b6198cea
//            https://newsapi.org/v2/everything?q=tesla&from=2021-12-19&sortBy=publishedAt&apiKey=API_KEY
        },
        //https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=32639afe5394417d97f0e2c4b6198cea
      ).then((value) {
        // print(value.data.toString());
        Science = value.data['articles'];
        print(Science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

// ThemeMode appMode=ThemeMode.dark;
//
//   // void changeTheme(){
//   //   if (appMode!=ThemeMode.dark){
//   //     appMode=ThemeMode.dark;
//   //   }else{
//   //     appMode=ThemeMode.light;
//   //   }
//   //   emit(NewsChange());
//   // }
//   bool isdark=false;
//   void change(){
//     isdark=!isdark;
//     emit(NewsChange());
//   }
//
  List<dynamic> Search = [];

  void getSearch(String value) {

    emit(NewsGetSearchLoadingState());
    // Search=[];
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q': '${value}',
        'apiKey': '32639afe5394417d97f0e2c4b6198cea',
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=32639afe5394417d97f0e2c4b6198cea
//            https://newsapi.org/v2/everything?q=tesla&from=2021-12-19&sortBy=publishedAt&apiKey=API_KEY
      },
      //https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=32639afe5394417d97f0e2c4b6198cea
    ).then((value) {
      // print(value.data.toString());
      Search = value.data['articles'];
      print(Search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

}