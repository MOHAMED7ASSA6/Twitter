








import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/model/Register/cubit/states.dart';


import '../../Login/cubit/states.dart';
import '../RegisterModel.dart';

class TwitterRegisteCubit extends Cubit<TwitterRegisteState> {
  TwitterRegisteCubit() : super(TwitterRegisteInitialState());

  static TwitterRegisteCubit get(context) => BlocProvider.of(context);
//
// late  TwitterLoginModel loginModel;

  bool isPassword = true;
  IconData? suffixIcon = Icons.visibility;

  IconData sufix=  Icons.remove_red_eye_rounded;

  void PassonRegiste(){
    isPassword=! isPassword;
    sufix=isPassword?Icons.visibility:Icons.visibility_off;
    emit(TwitterRegisteIsPasswordState());
  }
  void userRegiste({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(TwitterRegisteLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
       print(value.user!.email);
       print(value.user!.uid);
      creatUser(phone:phone, email: email, uId:value.user!.uid!, name: name,);
      //emit(TwitterRegisteSuccessState());
    }).catchError((error){
      emit(TwitterRegisteErrorState(error.toString()));
    });


    //   DioHelper.postData(
    //     url: REGISTER,
    //     data: {
    //       'email': email,
    //       'password': password,
    //       'phone' :phone,
    //       'name':name,
    //     },
    //   ).then((value) {
    //
    //
    //     print(value.data);
    // loginModel=  TwitterLoginModel.fromjson(value.data);
    //
    //
    //
    //   emit(TwitterRegisteSuccessState(loginModel));
    //     // print(LoginModel!.message);
    //     // print(LoginModel!.status);
    //   }).catchError((error) {
    //     print(error.toString());
    //     emit(TwitterRegisteErrorState(error.toString()));
    //   });
  }

  void creatUser({
     String ?email,
  required String name,
     String?phone,
   required String uId,
  }){
    TwitterDataModel model =TwitterDataModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      image: 'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1663367281~exp=1663367881~hmac=806abd7a21b2d51cee28f8944c2a5f35cf6f61ee60747f49529b6235f5d6642e',
     bio:'writ you bio.....',
     cover: 'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1663367281~exp=1663367881~hmac=806abd7a21b2d51cee28f8944c2a5f35cf6f61ee60747f49529b6235f5d6642e'
      // cover: 'https://img.freepik.com/free-photo/cheerful-male-gives-nice-offer-advertises-new-product-sale-stands-torn-paper-hole-has-positive-expression_273609-38452.jpg?w=740&t=st=1659314474~exp=1659315074~hmac=bc5ca0389d8acc1fc3fa330ed3a8eda69ace24f1babe4b7806a29b4b493da4c7',
      // image: 'https://as1.ftcdn.net/v2/jpg/03/92/70/12/1000_F_392701252_Xpj2o5RPiGnH8JMqkBOdTQqiDWSv7osU.jpg',
      // bio: 'writ you bio.....',


    );
    print(uId);
    print(model.toMap());
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {

      emit(SocialCreatSuccessState());
    }).
    catchError((error){
      emit(SocialCreatErrorState(error.toString()));
    });
  }

  }


