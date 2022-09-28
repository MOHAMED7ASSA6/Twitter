
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Components/components.dart';
import 'package:twitterapp/style/IconsBroken.dart';

import '../../Layout/twitterlayout/Cubit/cubit.dart';
import '../../Layout/twitterlayout/Cubit/states.dart';
import '../Register/RegisterModel.dart';
import '../Register/cubit/cubit.dart';
import '../Register/cubit/states.dart';
import 'Edite.dart';



class TwittersettingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwitterCubit,TwitterStates>(builder: (context,state) {
      var model =TwitterCubit.get(context).model;
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Container(
                height: 190,
                child: Stack(

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
                              image: NetworkImage('${model!.cover}',
                              ),
                              fit: BoxFit.cover,

                            )
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('${model!.image}'),

                      ),
                    ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OutlinedButton(onPressed: () {
                          navigateTo(context, Editprofil());
                        },
                          child: Text('تعديل الملف الشخصي'),),
                      ],
                    ),



                  ],
                ),
              ),
              SizedBox(height: 5,),


              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${model.name}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),

                  Text('${model.bio}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text('flutter developer',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text('انضم في سبتمبر ٢٠٢٠',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.date_range),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(onPressed: (){},child: Text('١٥٢ متابِعًا')),
                      SizedBox(width: 5,),
                      MaterialButton(onPressed: (){},child: Text('١٬٠٠٨ متابَعين'),),
                    ],
                  )
                ],
              ),
              Row(
                children: [

                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          Text('الاعجابات',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 1.5,
                            color: Colors.blue,
                            width: 50,
                          )

                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                  SizedBox(width: 20,),

                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          Text('الوسائط',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 1.5,
                            color: Colors.blue,
                            width: 50,
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){},
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,

                        ),
                        child: Column(
                          children: [

                            Text('التغريدات و الردود',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Container(
                              height: 1.5,
                              color: Colors.blue,
                              width: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [

                          Text('التغريدات',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          // SizedBox(height: 8,),
                          Container(
                            height: 1.5,
                            color: Colors.blue,
                            width: 50,
                          )
                        ],
                      ),
                    ),
                  ),


                ],
              ),
              Container(
                height: 1.5,
                color: Colors.grey[200],
                width: double.infinity,
              ),
              SizedBox(height: 10,),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=> buildprofil(),
                separatorBuilder: (context,index)=>Container(
                  height: 1,
                  color: Colors.grey,
                ), itemCount: 5,)




            ],
          ),
        ),
      ),
    );
    }, listener: (context,state){});
  }
  Widget buildprofil()=> Padding(
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
                  backgroundImage: NetworkImage('https://img.freepik.com/free-vector/cute-sleepy-girl-holding-pillow-cartoon-vector-icon-illustration-people-nature-icon-isolated-flat_138676-5706.jpg?w=740&t=st=1662946126~exp=1662946726~hmac=8b36a2d288664d99d3c3f490e8cd2aaa2b42fec03f0dd24f9f3c13927d91aa4c'),
                ),

                Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mohamed Hassan',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 3,),
                        Text('@Mohamed_7assan',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text('1 s',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 60,),
                        IconButton(onPressed: (){}, icon: Icon(IconBroken.More_Circle,size: 10,))
                      ],
                    ),

                    Container(
                      width: 300,
                      child: Text('من امنيات الواحد ف حياته ونفسه يحققها وتستمر .. ان استمر ف الصلاه بأنتظام ،لو حد ربنا رزقه بالنعمه دي ومكنش بيصلي قبلها يقولي تجربته كانت اي وعمل اي .. عايز انضف نفسي مش عارف',
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
                          image: NetworkImage('https://img.freepik.com/premium-photo/astronaut-sitting-moon-with-hand-helmet-3d-illustration_151689-440.jpg?w=740'),
                          fit: BoxFit.cover,
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





              ],
            ),

          ],
        ) ,
      ),
    ),
  );
}
