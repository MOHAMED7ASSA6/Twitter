
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/states.dart';


import '../../Components/components.dart';
import '../../Layout/twitterlayout/Cubit/cubit.dart';
import '../Home/Post model.dart';
import '../Register/RegisterModel.dart';
import 'message.dart';





class ChatScreenTwitter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TwitterCubit,TwitterStates>(
        listener:(context,state){} ,
        builder: (context,state){
          return  ListView.separated(itemBuilder: (context,index)=> buildChats(TwitterCubit.get(context).users[index],context),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: TwitterCubit.get(context).users.length,
          );
        });


  }
  Widget buildChats(TwitterDataModel model ,context)=>

      InkWell(
        onTap: (){
          navigateTo(context, ChatDetailsScreen(
            UserModel: model,

          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('${model.image}'),

              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(width: 15,),
                  Row(
                    children: [
                      Text('${model.name}',
                        style: TextStyle(
                          fontSize: 15
                        ),


                        ),
                      Text('${model!.bio}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'A message from your friend',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),











            ],

          ),

        ),
      );
}