import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/cubit.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/states.dart';

import '../../Components/components.dart';
import '../../Layout/twitterlayout/Layouttwitter.dart';
import '../../style/IconsBroken.dart';

class PostScreen extends StatelessWidget {
 var textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwitterCubit,TwitterStates>(
      builder:(context,state) {
        File? postImage = TwitterCubit.get(context).PostImage as File?;
        return Scaffold(
          appBar: AppBar(

            actions: [
              defaultTextButton(onPressedFunction: (){

                _sendPOST(context);

              }, text: 'تغريده',),
              SizedBox(width: 16,),

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if(state is CreatePostLoadingstate)
                LinearProgressIndicator(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage('${TwitterCubit.get(context).model!.image}'),
                    ),
                    SizedBox(width: 15,),
                    Text('${TwitterCubit.get(context).model!.name}',style: TextStyle(
                      fontSize: 14,
                    ),),
                    Text('DATA',style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'ماذا يحدث',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                if(TwitterCubit.get(context).PostImage !=null)
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                              image:  FileImage( postImage! ),
                              fit: BoxFit.cover,

                            )
                        ),
                      ),

                      IconButton(
                        icon: CircleAvatar(
                            radius: 20,

                            child: Icon(Icons.close)),
                        onPressed: () {  TwitterCubit.get(context).removePostImage(); },
                      )],
                  ),
                SizedBox(height: 20,),
                Row(

                  children: [
                    Expanded(
                      child: TextButton(onPressed: (){
                        TwitterCubit.get(context).getPostImage();
                      },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Image),
                              SizedBox(width: 5,),
                              Text('add photo'),
                            ],

                          )),
                    ),
                    Expanded(
                      child: TextButton(onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              Text('# tags'),
                            ],

                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      listener: (context,state){
        if(state is CreatePostLoadingstate){
          navigateTorout(context, TwitterLayout());
        }

      },
    );
  }
 void _sendPOST(BuildContext context) {
   if(TwitterCubit.get(context).PostImage ==null){
     TwitterCubit.get(context).CreatePost(
       dateTime: DateTime.now().toLocal().toString(),
       text: textController.text,
     );
   }else{
     TwitterCubit.get(context).uploadPostImage
       (dateTime: DateTime.now().toLocal().toString(), text: textController.text,);
   }









   textController.text = '';
   FocusScope.of(context).unfocus();
 }

}
