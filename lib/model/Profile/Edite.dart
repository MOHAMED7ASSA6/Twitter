import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/cubit.dart';

import '../../Components/components.dart';
import '../../Layout/twitterlayout/Cubit/states.dart';
import '../../style/IconsBroken.dart';


class Editprofil extends StatelessWidget {

  var boiecontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var namecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwitterCubit,TwitterStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var model=TwitterCubit.get(context).model;
        File? profileImage=TwitterCubit.get(context).profileImage;
        File? coverImage=TwitterCubit.get(context).coverImage;
        namecontroller.text = model!.name!;
        boiecontroller.text = model!.bio!;
        phonecontroller.text = model.phone!;



 return   Scaffold(
    appBar: AppBar(


       actions: [
          defaultTextButton(onPressedFunction: (){
             TwitterCubit.get(context).UpdataUser
                (name: namecontroller.text, phone: phonecontroller.text, bio: boiecontroller.text);

          }, text: 'حفظ',),
          SizedBox(width: 16,),

       ],



    ),
    body: Column(
    children: [
       if(state is Useruploadupdata)
          LinearProgressIndicator(),
       if(state is Useruploadupdata)
          SizedBox(height: 10,),
    Stack(

    alignment: Alignment.bottomRight,
    children: [
    Align(
    child: Container(
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(4.0),
    topRight: Radius.circular(4.0),
    ),
    image: DecorationImage(
    image:coverImage ==null?  NetworkImage('${model!.cover}'):FileImage(coverImage) as ImageProvider<Object>,
    fit: BoxFit.cover,

    )

    ),
       child: IconButton(
          icon: CircleAvatar(
              radius: 480,
              backgroundImage: coverImage ==null?  NetworkImage('${model!.cover}'):FileImage(coverImage) as ImageProvider<Object>,

              child: Icon(IconBroken.Camera)),
          onPressed: () {
             TwitterCubit.get(context).getCoverImage();
          },
       ),
    ),


    alignment: Alignment.topCenter,
    ),


    CircleAvatar(
    radius: 43,
    backgroundColor: Colors.white,
    child:  CircleAvatar(
       radius: 40,
       backgroundImage: profileImage ==null?  NetworkImage('${model!.image}'):FileImage(profileImage) as ImageProvider<Object>,
       child: IconButton(
          icon: Icon(IconBroken.Camera,),
          onPressed: () {  TwitterCubit.get(context).getProfileImage(); },
       ),
    ),
    ),








// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     OutlinedButton(onPressed: () {},
//       child: Text('تعديل الملف الشخصي'),),
//   ],
// ),



    ],
    ),
    if(TwitterCubit.get(context).profileImage !=null||TwitterCubit.get(context).coverImage !=null)
    Row(
       children: [
        if(TwitterCubit.get(context).coverImage !=null)
      Container(
            width:70 ,
            height: 30,
            child: CircleAvatar(
                radius: 20,
                child: defaultButton(function: (){
                   TwitterCubit.get(context).uploadcoverImage(name: namecontroller.text, phone:  phonecontroller.text,
                       bio: boiecontroller.text
                   );
                }, text: 'Done'))),
          Spacer(),
          if(TwitterCubit.get(context).profileImage !=null)
          Container(
              width:70 ,
              height: 30,
              child: CircleAvatar(
                  radius: 20,
                  child: defaultButton(function: (){
                     TwitterCubit.get(context).uploadprofileImage(name: namecontroller.text, phone:  phonecontroller.text,
                         bio: boiecontroller.text
                     );
                  }, text: 'Dene'))),
       ],
    ),
    SizedBox(height: 20,),
    Container(
    height: 60,
    child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: defaultFormField(
    controller: namecontroller,
    type: TextInputType.text,
    validate: (  value){if(value.isEmpty) {
    return 'neme must notbe empty';
    }  return null;},
    label: 'name',
    prefix: Icons.near_me,
    ),
    ),
    ),
    SizedBox(height: 10,),
    Container(
    height: 60,
    child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: defaultFormField(
    controller: boiecontroller,
    type: TextInputType.text,
    validate: (  value){if(value.isEmpty) {
    return 'bio must notbe empty';
    }  return null;},
    label: 'bio',
    prefix: Icons.near_me,
    ),
    ),
    ),
    SizedBox(height: 10,),
       Container(
          height: 60,
          child: Padding(
             padding: const EdgeInsets.all(5.0),
             child: defaultFormField(
                controller: phonecontroller,
                type: TextInputType.text,
                validate: (  value){if(value.isEmpty) {
                   return 'bio must notbe empty';
                }  return null;},
                label: 'phone',
                prefix: Icons.near_me,
             ),
          ),
       ),
       SizedBox(height: 10,),


    ],
    ),
    );

      }
    );}
}

