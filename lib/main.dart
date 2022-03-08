import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newapplication/layout/news_app/cubit/cubit.dart';
import 'package:newapplication/layout/newsapp_layout.dart';
import 'package:newapplication/shared/cubit.dart';
import 'package:newapplication/shared/network/local/cache_helper.dart';
import 'package:newapplication/shared/network/remote/dio_helper.dart';
import 'package:newapplication/shared/states.dart';
import 'package:newapplication/shared/styles/bloc_observer.dart';

void main() async{

  BlocOverrides.runZoned(
        () {
          WidgetsFlutterBinding.ensureInitialized();

          // Use cubits...
          DioHelper.init();

          CacheHelper.init();
          bool? isDark  = CacheHelper.getData(key: 'isDark');

          runApp( MyApp( isDark ));





        },
    blocObserver: MyBlocObserver(),

  );

}

class MyApp extends StatelessWidget {
   final bool? isDark;

   const MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => NewsCubit()..getBusiness()..getScience()..getSports(),),
    BlocProvider (create: (context) => appCubit()..newchange(
    fromshared: isDark,
    ),),

      ],
      child: BlocConsumer<appCubit,appStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(

                type:BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),

            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                    color: Colors.white
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
              ),
            ),
            themeMode:appCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: Directionality(
                textDirection: TextDirection.rtl,
                child: NewsLayout()),
          );
        },
      ),
    );
  }
}

