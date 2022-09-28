import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/states.dart';

import '../../Layout/twitterlayout/Cubit/cubit.dart';
import '../../style/IconsBroken.dart';
import '../Register/RegisterModel.dart';
import 'Post model.dart';


class HomeScreenTwitter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:      Container(
          width: double.infinity,
          height: 50,

          child: Card(
            child:

            Center(
              child: Text('الرئيسية',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            elevation: 5,

          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<TwitterCubit,TwitterStates>(builder: (context,state){
      return  SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 10,),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>
                    buildScreenHome(TwitterCubit.get(context).post[index],context),
                separatorBuilder: (context,index)=>SizedBox(height: 10,),
                itemCount: TwitterCubit.get(context).post.length,
              ),








            ],

          ),
        );
      }, listener: (context,state) {  },

      )



    );



  }
  Widget buildScreenHome(PostModel MODEL, context)=>    Padding(
    padding: const EdgeInsets.all(0.0),
    child: Container(

      width: 400,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child:Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('${MODEL.image}'),
                ),

                Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${MODEL.name}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 3,),
                        Text('${TwitterCubit.get(context).model!.bio}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text('${MODEL.dateTime}',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(

                      width: 300,
                      child: Text('${MODEL.text}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    Container(
                      height: 270,
                      width: 320,
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          image: NetworkImage('${MODEL.PostImage}'),

                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(IconBroken.Chat,size: 14,)),
                        Text('25',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 30,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.cached_sharp,size: 14,)),
                        Text('25',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 30,),
                        IconButton(onPressed: (){}, icon: Icon(IconBroken.Heart,size: 14,)),
                        Text('25',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 30,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 14,)),
                      ],
                    )
                  ],
                ),



                Expanded(child: IconButton(onPressed: (){}, icon: Icon(IconBroken.More_Circle,size: 12,))),

              ],
            ),

          ],
        ) ,
      ),
    ),
  );
}
