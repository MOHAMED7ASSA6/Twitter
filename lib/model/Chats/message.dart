import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/components.dart';
import '../../../../components/constants.dart';

import '../../Components/constants.dart';
import '../../Layout/twitterlayout/Cubit/cubit.dart';
import '../../Layout/twitterlayout/Cubit/states.dart';
import '../../components/constants.dart';
import '../../style/IconsBroken.dart';
import '../Register/RegisterModel.dart';
import 'modelChats.dart';



class ChatDetailsScreen extends StatelessWidget {
  TwitterDataModel? UserModel;

  final TextEditingController messageController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  ChatDetailsScreen({
    Key? key,
    required this.UserModel,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {

      TwitterCubit.get(context).getMassage(receiverId:UserModel!.uId);

      return BlocConsumer<TwitterCubit, TwitterStates>(


        listener: (context, state) {},
        builder: (context, state) {
          File? sendImage = TwitterCubit.get(context).chatImage as File?;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(IconBroken.Arrow___Left_2),
              ),
              titleSpacing: 0.0,
              title: Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundImage: NetworkImage(UserModel!.image),
                    ),
                    const SizedBox(width: 15.0),
                    Text(UserModel!.name,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child:
                    ConditionalBuilder(
                      condition:
                      TwitterCubit.get(context).massage.length > 0,
                      builder: (context) => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          MassageModel message =
                          TwitterCubit.get(context).massage[index];

                          if (TwitterCubit.get(context).model!.uId ==
                              message.sinderId) {
                            return _buildSenderMessage(message,context);
                          }

                          return _buildRecevierMessage(message,context);
                        },
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 15.0),
                        itemCount: TwitterCubit.get(context).massage.length,
                      ),
                      fallback: (context) =>Center(child: CircularProgressIndicator())
                    ),
                  ),
                  const SizedBox(height: 15.0),

                  if(TwitterCubit.get(context).chatImage !=null)
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              image: DecorationImage(
                                image:  FileImage( sendImage! ),
                                fit: BoxFit.cover,

                              )
                          ),
                        ),

                        IconButton(
                          icon: CircleAvatar(
                              radius: 20,

                              child: Icon(Icons.close)),
                          onPressed: () {  TwitterCubit.get(context).removechatsImage(); },
                        )],
                    ),
                  Container(
                    height: 45.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 15.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onFieldSubmitted: (value) =>
                                  _sendMessage(context),
                              controller: messageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'type your message here ...',
                                hintStyle: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ),
                          Container(
                            height: 45.0,
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {

                                 TwitterCubit.get(context).getchatImage();
                              },
                              minWidth: 1.0,
                              child: Icon(
                                IconBroken.Image,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 2,),
                          Container(
                            height: 45.0,
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                _sendMessage(context);


                              },
                              minWidth: 1.0,
                              child: Icon(
                                IconBroken.Send,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void _sendMessage(BuildContext context) {
    if(TwitterCubit.get(context).chatImage ==null){
      TwitterCubit.get(context).sendMassage(
          receiverId: UserModel!.uId,
          dateTime: DateTime.now().toString(),
          messagetext: messageController.text);
    }
      TwitterCubit.get(context).uploadchatImage(receiverId: UserModel!.uId,
          dateTime: DateTime.now().toString(),
          messagetext:  messageController.text
      );










    messageController.text = '';
    FocusScope.of(context).unfocus();
  }

  Align _buildSenderMessage(MassageModel message,context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(10.0),
                        topEnd: Radius.circular(10.0),
                        topStart: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(message.messagetext)),
                if(message.chatImage !=null)
                  Container(

                      width: 220,
                      child: Image(
                        image:
                        NetworkImage('${message.chatImage}',),   )),
              ],
            ),








          ),





        ],
      ),
    );
  }

  Align _buildRecevierMessage(MassageModel message,context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child:  Column(
          children: [
            Text(message.messagetext),
            if(message.chatImage !=null)
              Container(
                  height: 200,
                  width: 180,
                  child: Image(
                      image:
                      NetworkImage('${message.chatImage}')   ))
          ],
        )
      ),
    );
  }
}