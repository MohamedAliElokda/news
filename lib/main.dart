import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/main_cubit/maincubit_cubit.dart';
import 'package:news/remote/dio_helper.dart';
import 'package:news/remote/shared_preferences.dart';
import 'package:news/screens/home_news/cubit/home_cubit.dart';
import 'package:news/screens/home_news/home_news.dart';
import 'package:news/screens/splash_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper.init();
  DioHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark ?? true));
}
class MyApp extends StatelessWidget {

  bool isDark ;
  MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getDataBusiness(),),
    BlocProvider(
    create: (context) => MaincubitCubit()..ChangeMode(isDark: CacheHelper.getBoolean(key: 'isDark'),)),
      ],
      child: BlocConsumer<MaincubitCubit, MaincubitState>(
      listener: (context, state) {
          // TODO: implement listener
      },
      builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              primarySwatch: Colors.grey,
                textTheme:  const TextTheme(
                  bodyText1: TextStyle(
                    overflow: TextOverflow.ellipsis,

                      fontSize: 18,
                      color: Colors.black ,
                      fontWeight: FontWeight.w600
                  ),
                  bodyText2: TextStyle(fontSize: 10,fontWeight: FontWeight.w700, color: Colors.black)
                  ,
                ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.blue,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(color: Colors.black),
               unselectedItemColor: Colors.black
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:  const AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                actionsIconTheme:IconThemeData(
                  size: 30,
                  color: Colors.black
                ) ,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness:Brightness.dark,
                    statusBarColor: Colors.white


                ),
                  backgroundColor: Colors.white


              )
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.grey,

              textTheme:  TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  color: Colors.white ,
                  fontWeight: FontWeight.w600
                ),
                bodyText2: TextStyle(fontSize: 10,fontWeight: FontWeight.w700, color: Colors.white)
                ,
              ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: TextStyle(color: Colors.white),
                    unselectedItemColor: Colors.grey
                ),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme:  const AppBarTheme(

                    titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                    actionsIconTheme:IconThemeData(
                        size: 30,
                        color: Colors.white
                    ) ,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness:Brightness.light,
                        statusBarColor: Colors.black


                    ),
                    backgroundColor: Colors.black


                )
            ),
            themeMode: MaincubitCubit.get(context).changeMode ? ThemeMode.dark : ThemeMode.light ,
            home:   SplashScreen(),
          );
      },
),
    );
  }
}


