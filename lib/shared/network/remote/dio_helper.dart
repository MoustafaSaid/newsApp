import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({@required String? url,@required dynamic query})
  async{
    //first var is insted of string and second one is insted of Map

    return await  dio!.get(url!,queryParameters: query,);
  }

}