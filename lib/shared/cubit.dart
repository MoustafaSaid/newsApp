import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapplication/shared/network/local/cache_helper.dart';
import 'package:newapplication/shared/states.dart';

class appCubit extends Cubit<appStates>{

  appCubit() : super(appinitial());
static appCubit get(context)=>BlocProvider.of(context);
  bool isDark=false;
  void newchange( { bool? fromshared}){
if (fromshared !=null){
  isDark=fromshared;
  emit(newschange());

}else{
  isDark=!isDark;
  CacheHelper.putData(key: 'isDark', value: isDark)?.then((value) {
    emit(newschange());

  });
}

  }

}