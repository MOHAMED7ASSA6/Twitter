

import 'dart:io';



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/cubit.dart';
import 'package:twitterapp/model/Register/cubit/cubit.dart';



import 'Components/constants.dart';
import 'Layout/twitterlayout/Cubit/cubit.dart';
import 'Layout/twitterlayout/Cubit/cubit.dart';
import 'Layout/twitterlayout/Layouttwitter.dart';
import 'Share/local/Cache_helper.dart';
import 'Share/remote/dio_helper.dart';
import 'model/Login/login.dart';

// Future<void>FirebaseMessagingBackgroundHandler(RemoteMessage message)async{
//   print('on background message');
//   print(message.data.toString());
//   showToast(state:ToastStates.SUCCESS ,text: 'on background message');
// }
void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.dio;
  await cacheHelper.init();
  bool? dark = cacheHelper.getData(key: 'dark');
  Widget widget;







  // bool? onboarding = cacheHelper.getData(key: 'onboarding');

  //token = cacheHelper.getData(key: 'token');

  uId = cacheHelper.getData(key: 'uId');


  if(uId!=null){
    widget=TwitterLayout();

  }else{
    widget=TwitterLogin();
  }





  runApp(MyApp(
  //  isDark: TwitterCubit. ? isDark == null : isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget
{
  //final bool isDark;
  final Widget startWidget;
  // final bool OnBoarding;

  MyApp({
 //   required this.isDark,
    required this.startWidget,
    // required this.OnBoarding,

  });
  @override
  Widget build(BuildContext context)
  {
    // return MultiBlocProvider(
    //   providers:[
    //     BlocProvider(
    //       create: (context)=>
    //
    //
    //     BlocProvider(
    //       create: (context) => NewsCubitt()..getBusiness(),),
    //     BlocProvider(
    //       create: (context) =>ShopLoginCubit(),
    //     ),
    //     BlocProvider(
    //       create: (context) => ShopLayCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData(),
    //     ),
    //     BlocProvider(
    //       create: (context) => SocialCubit()..getUserData()..getPost()..getAllUser(),
    //     ),
    //
    //   ],
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (context)=>TwitterCubit()..getUserData()..getPost()),
        // BlocProvider(
        //   create: (context)=>TwitterRegisteCubit(),),


      ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          elevation: 20.0,
        ),
        appBarTheme:AppBarTheme(
          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,

          ),
          color: Colors.white,
        ),
        backgroundColor: Colors.white,

      ),
      darkTheme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: Colors.white,

            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,

            elevation: 20.0,
            backgroundColor: Colors.black,
          ),
        scaffoldBackgroundColor:HexColor('333739'),
        cardTheme:CardTheme(
          color: HexColor('333739'),

        ) ,
        appBarTheme:AppBarTheme(

          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(
            color: HexColor('333739'),

          ),
          color: HexColor('333739'),
        ),
      ),


     debugShowMaterialGrid: false,
      themeMode:ThemeMode. light,
      home:Directionality(

          textDirection: TextDirection.ltr,
          child: startWidget),





    ),






    );
  
     
  }}