import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Components/components.dart';
import 'package:twitterapp/Components/constants.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/cubit.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/states.dart';

import '../../model/Home/post.dart';
import '../../model/Login/login.dart';
import '../../model/Profile/profile.dart';
import '../../style/IconsBroken.dart';




class TwitterLayout extends StatelessWidget {
var fermkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwitterCubit,TwitterStates>(
      builder: (context,state){

        var list=TwitterCubit.get(context).model;
         return ConditionalBuilder(
        condition:list !=null ,
        builder: (context)=>Scaffold(
          key: fermkey,
          appBar: AppBar(

            leading:  IconButton(
              onPressed: (){
                fermkey.currentState!.openDrawer();
                //     navigateTo(context, TwittersettingScreen());
              },
              icon: CircleAvatar(
                radius: 20,
                backgroundImage:NetworkImage('${TwitterCubit.get(context).model!.image}') ,

              ),
            ) ,
            title: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Image(image: NetworkImage('https://music-b26f.kxcdn.com/wp-content/uploads/2022/04/Twitter-logo-770x470.png',),)),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.ac_unit),
              ),
            ],
          ),
          floatingActionButton:  FloatingActionButton(onPressed: (){
            navigateTo(context, PostScreen());
          },child: Icon(IconBroken.Add_User),),
          drawer: Container(
            color: Colors.blue,
            child: Drawer(
              child: Column(

                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture:   IconButton(
                      onPressed: (){
                             navigateTo(context, TwittersettingScreen());
                      },
                      icon: CircleAvatar(
                        radius: 35,
                        backgroundImage:NetworkImage('${TwitterCubit.get(context).model!.image}') ,

                      ),
                    ),
                    accountName: Text('${TwitterCubit.get(context).model!.name}'),
                    accountEmail: Text('${TwitterCubit.get(context).model!.bio}') ,

                  ),
                  ListTile(
                    title: Text('الملف الشخصي'),leading: Icon(IconBroken.Profile),onTap: (){
                    navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('القوائم'),leading: Icon(IconBroken.Paper),onTap: (){
                  //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('الموضوعات'),leading: Icon(IconBroken.Chat),onTap: (){
                    //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('دائرة Twitter'),leading: Icon(IconBroken.User1),onTap: (){
                    //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('العلامات المرجعيه'),leading: Icon(IconBroken.Ticket),onTap: (){
                    //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('اللحظات'),leading: Icon(IconBroken.Category),onTap: (){
                    //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('تحقيق الربح'),leading: Icon(IconBroken.Work),onTap: (){
                    //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('الاعدادات و الخصوصبة'),onTap: (){
                    //  navigateTo(context, TwittersettingScreen());
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text('تسجيل الخروج'),leading: Icon(IconBroken.Logout),onTap: (){
                    SignOut(context);
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                  ListTile(
                    title: Text(' الوضع الدكن'),leading: Icon(IconBroken.More_Circle),onTap: (){
            //  TwitterCubit.get(context).changeMode();
                  },


                    // MaterialButton(onPressed: (){},child: Row(
                    //
                    //       children: [
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    //         Text('الملف الشخصي')
                    //       ],
                    //     ),)




                  ),
                ],
              ),
            ),
          ),
          body: TwitterCubit.get(context).screen[TwitterCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:TwitterCubit.get(context).currentIndex ,
            onTap: (index){
              TwitterCubit.get(context).ChangeBott(index);
            },
            items: [

              BottomNavigationBarItem(icon:Icon( IconBroken.Home),
                  label: 'home'
              ),
              BottomNavigationBarItem(icon:Icon( IconBroken.Search),
                  label: 'Search'
              ),
              BottomNavigationBarItem(icon:Icon( IconBroken.Paper),
                  label: 'news'
              ),
              BottomNavigationBarItem(icon:Icon( IconBroken.Chat),
                  label: 'Chat'
              ),
            ],

          ),
        ),
        fallback: (context)=>Scaffold(
          key: fermkey,
          appBar: AppBar(

            leading:  IconButton(
              onPressed: (){
                fermkey.currentState!.openDrawer();
                //     navigateTo(context, TwittersettingScreen());
              },
              icon: CircleAvatar(
                radius: 20,
                backgroundImage:NetworkImage('') ,

              ),
            ) ,
            title: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Image(image: NetworkImage('https://music-b26f.kxcdn.com/wp-content/uploads/2022/04/Twitter-logo-770x470.png',),)),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.ac_unit),
              ),
            ],
          ),
          floatingActionButton:  FloatingActionButton(onPressed: (){
            navigateTo(context, PostScreen());
          },child: Icon(IconBroken.Add_User),),
          drawer: Container(
            color: Colors.blue,

          ),
          body: TwitterCubit.get(context).screen[TwitterCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:TwitterCubit.get(context).currentIndex ,
            onTap: (index){
              TwitterCubit.get(context).ChangeBott(index);
            },
            items: [

              BottomNavigationBarItem(icon:Icon( IconBroken.Home),
                  label: 'home'
              ),
              BottomNavigationBarItem(icon:Icon( IconBroken.Search),
                  label: 'Search'
              ),
              BottomNavigationBarItem(icon:Icon( IconBroken.Paper),
                  label: 'news'
              ),
              BottomNavigationBarItem(icon:Icon( IconBroken.Chat),
                  label: 'Chat'
              ),
            ],

          ),
        ),
      );},
      listener: (context,state){},
    );
  }
}
