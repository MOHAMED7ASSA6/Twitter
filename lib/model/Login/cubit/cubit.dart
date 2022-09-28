





import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/model/Login/cubit/states.dart';


import '../../Register/RegisterModel.dart';


class TwitterLoginCubit extends Cubit<TwitterLoginState> {
  TwitterLoginCubit() : super(TwitterLoginInitialState());

  static TwitterLoginCubit get(context) => BlocProvider.of(context);

//late  TwitterLoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(TwitterLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    )
        .then((value) {

          emit(TwitterSingleTSuccessState(value.user!.uid));
    }).then((value) {
      emit(TwitterSingleTErrorState());
    });
  //
  //   DioHelper.postData(
  //     url: LOGIN,
  //     data: {
  //       'email': email,
  //       'password': password,
  //     },
  //   ).then((value) {
  //
  //
  //     print(value.data);
  // loginModel=  TwitterLoginModel.fromjson(value.data);
  //
  //
  //
  //   emit(TwitterLoginSuccessState(loginModel));
  //     // print(LoginModel!.message);
  //     // print(LoginModel!.status);
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(TwitterLoginErrorState(error.toString()));
  //   });
  }




  bool isPassword = true;
  // IconData? suffixIcon = Icons.visibility;
  // void Passon(){
  //   isPassword =! isPassword;
  //   suffixIcon = isPassword ?Icons.visibility:Icons.visibility_off;
  //   emit(TwitterIsPasswordState());
  // }
IconData sufix=  Icons.remove_red_eye_rounded;

  void Passon(){
   isPassword=! isPassword;
   sufix=isPassword?Icons.visibility:Icons.visibility_off;
   emit(TwitterIsPasswordState());
  }

}