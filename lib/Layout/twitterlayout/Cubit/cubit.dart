



import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/states.dart';
import 'package:twitterapp/Share/local/Cache_helper.dart';
import 'package:twitterapp/Share/remote/dio_helper.dart';


import '../../../Components/constants.dart';
import '../../../Components/constants.dart';
import '../../../model/Chats/Chat.dart';
import '../../../model/Chats/modelChats.dart';
import '../../../model/Home/Home.dart';
import '../../../model/Home/Post model.dart';
import '../../../model/News/News.dart';
import '../../../model/Register/RegisterModel.dart';
import '../../../model/Search/Search.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class TwitterCubit extends Cubit<TwitterStates>{
  TwitterCubit() : super(TwitterInitialState());
  static TwitterCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  TwitterDataModel?model;
  PostModel?Model;
  void getUserData(){

FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {


  model=TwitterDataModel.fromjson(value.data()!);
  emit(TwitterSuccessState());
}).catchError((error){});
emit(TwittererrorState());
  }

List<Widget> screen=[
  HomeScreenTwitter(),
  SearchScreen(),
  BusinessScreen(),
  ChatScreenTwitter()
];
void ChangeBott( index){
  if(index==3)
    getAllUser();
  if(index==2)
    getScience();





  currentIndex=index;
  emit(TwitterChangeBottomState());


}

  final ImagePicker Picker = ImagePicker();

  File? profileImage;
  String profileImageUrl = '';
  Future<void> getProfileImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.profileImage = File(pickedImage.path);
      print(pickedImage.path);
      emit(ProfileImageSuccess());
    } else {
      emit(ProfileImageError());
    }
  }
  File? coverImage;
  Future<void> getCoverImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.coverImage = File(pickedImage.path);
      emit(CoverImageSuccess());
    } else {
      emit(CoverImageError());
    }
  }
  void uploadprofileImage({
    required String name,
    required String phone,
    required String bio,
  }){
    emit(SocialuserdateupdateCoverImage());
    firebase_storage.FirebaseStorage.instance.ref().child('Users/${Uri.file(profileImage!.path).
    pathSegments.last}').putFile(profileImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        //   emit(UploadProfileImageSuccess());
        UpdataUser(name: name, phone: phone, bio: bio,
          image: value,
        );
      }).catchError((error){
        emit(uploadImageError());
        print(error);
      });
    }).catchError((error){
      print(error);
      emit(uploadImageError());
    });
  }

  void uploadcoverImage({  required String name,
    required String phone,
    required String bio,
  }){
    emit(SocialuserdateupdateCoverImage());
    firebase_storage.FirebaseStorage.instance.ref().child('Users/${Uri.file(coverImage!.path).
    pathSegments.last}').putFile(coverImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        UpdataUser(name: name, phone: phone, bio: bio,
          cover: value,
        );

      }).catchError((error){
        print(error); emit(uploadCoverImageError());

      });
    }).catchError((error){
      print(error);
      emit(uploadCoverImageError());
    });
  }

  void UpdataUser({
    required String name,
    required String phone,
    required String bio,
     String? cover,
   String ?image,
}){
    emit(Useruploadupdata());
    TwitterDataModel  model1=TwitterDataModel(
      name: name,
      phone: phone,
      bio:bio,
      cover: cover?? model!.cover,
      image:image?? model!.image,
      uId: model!.uId,
      email: model!.email,



    );

    FirebaseFirestore.instance.collection('users').doc(model1.uId).update(model1.toMap()).then((value) {
      getUserData();
    }).
    catchError((error){
      emit(UseruploadCoverImageError());
    });
  }

  File? PostImage;
  Future<void> getPostImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.PostImage = File(pickedImage.path);
      emit(PostImageSuccess());
    } else {
      emit(PostImageError());
    }
  }

  void uploadPostImage({
    required String dateTime,
    required String text,

  }){
    emit(CreatePostLoadingstate());
    //   emit(SocialuserdateupdatePost());
    firebase_storage.FirebaseStorage.instance.ref().child('Post/${Uri.file(PostImage!.path).
    pathSegments.last}').putFile(PostImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        CreatePost(dateTime: dateTime, text: text,PostImage:value,

        );
        print(value);
        //   emit(uploadPostSuccess());


      }).catchError((error){
        print(error); emit(uploadPosteError());

      });
    }).catchError((error){
      print(error);
      emit(uploadPosteError());
    });
  }
  void removePostImage(){
    PostImage=null;
    emit(removePostImagestate());
  }



  void CreatePost({

    required String dateTime,
    required String text,
    String? PostImage,


  }){
    emit(CreatePostLoadingstate());
    PostModel  model= PostModel (
      name: this.model!.name,
      uId: this.model!.uId,
      PostImage: PostImage??'',
      dateTime:dateTime,
      text:text,
      image:this.model!.image,

    );

    FirebaseFirestore.instance.collection('Post').add(model.toMap()).then((value) {
      emit(CreatePostSuccess());
    }).
    catchError((error){
      emit(CreatePosteError());
    });
  }
  List<PostModel> post=[];
  void getPost(){
    emit(GetPostsLoading());
    FirebaseFirestore.instance.collection('Post').orderBy('dateTime').get().then((value) {
      value.docs.forEach((element) {
        // element.reference.collection('Comments').get().then((value) {
        //   Comments.add(value.docs.length);
          post.add(PostModel.fromjson(element.data()));
        //   PostId.add(element.id);
        // }).catchError((error){});


      });
      emit(SocialgetpostSuccess());
    }).catchError((error){
      emit(SocialgetpostError());
    });
  }

  List<TwitterDataModel> users=[];
  void getAllUser(){
    if(users.length==0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
         if(element.data()['uId']  != model!.uId )

            users.add(TwitterDataModel.fromjson(element.data()));
          print(element.data());

        });
        emit(TwittergetchatsSuccess());
      }).then((value) {}).catchError((error){
        emit(TwittergetchatsError());
      });}

  void sendMassage({
    required String receiverId,
    required String dateTime,
    required String messagetext,
     String? chatImage,
    //  String? SendImage,

  }){

    MassageModel model2 =MassageModel(

      messagetext: messagetext,
      dateTime: dateTime,
      recevierId: receiverId ,
      sinderId:model!.uId,
      chatImage: chatImage,
      //   SendImage:UserModel.image,



    );

    FirebaseFirestore.instance.collection('users').doc( model!.uId).collection('chats').doc(receiverId)
        .collection('massage').
    add(model2.toMap()).then((value) {
      emit(SocialsendmassageSuccess());
    }).catchError((error){
      emit(SocialsendmassageError());
    });


    FirebaseFirestore.instance.collection('users').doc( receiverId).collection('chats').doc(model!.uId).collection('massage').
    add(model2.toMap()).then((value) {
      emit(SocialgetsendmassageSuccess());
    }).catchError((error){
      emit(SocialgetsendmassageError());
    });

  }
  List<MassageModel> massage=[];

  void getMassage({
    required String receiverId
  }){
    FirebaseFirestore.instance.collection('users').doc(model!.uId).collection('chats')
        .doc(receiverId).collection('massage').orderBy('dateTime').snapshots().listen((event) {
      massage=[];
      event.docs.forEach((element) {

        massage.add(MassageModel.fromjson(element.data()));
        print(element.data());
      }
      );
      emit(SocialgetsendchatSuccess());
    });
  }
//image chat
  File? chatImage;
  Future<void> getchatImage() async {
    final XFile? pickedImage =
    await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      this.chatImage = File(pickedImage.path);
      emit(ChatImageSuccess());
    } else {
      emit(chatImageError());
    }
  }
  void uploadchatImage(
  {    required String receiverId,
    required String dateTime,
    required String messagetext,}
  ){
    emit(TwitteruserdateupdateCoverImage());
    firebase_storage.FirebaseStorage.instance.ref().child('Users/${Uri.file(chatImage!.path).
    pathSegments.last}').putFile(chatImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        //   emit(UploadProfileImageSuccess());
        sendMassage(dateTime: dateTime, messagetext:messagetext , receiverId:receiverId, chatImage:value);

      }).catchError((error){
        emit(uploadchatImageError());
        print(error);
      });
    }).catchError((error){
      print(error);
      emit(uploadchatImageError());
    });
  }

  void removechatsImage(){
    chatImage=null;
    emit(removePostImagestate());
  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(science.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'7171eb0bba7345c7a100c950b66585e9',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());


    DioHelper.getData(url: 'v2/top-headlines', query: {

      "q": "$value",
      'apiKey':'7171eb0bba7345c7a100c950b66585e9',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title'].toString());
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print("ERROR ${error.toString()}");
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

  // bool dark=false;
  // void changeMode(){
  //   dark=!dark;
  //   cacheHelper.putData(key: 'dark', value: dark).then((value) {
  //     emit(ChangeModee());
  //   });
  //
  // }


}