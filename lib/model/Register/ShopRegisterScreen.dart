import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Components/constants.dart';


import '../../../components/components.dart';

import '../../Components/constants.dart';
import '../../Layout/twitterlayout/Layouttwitter.dart';
import '../../Share/local/Cache_helper.dart';
import '../Login/cubit/cubit.dart';
import '../Login/cubit/states.dart';
import 'cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class RegisterScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {


//    String? Textout;
    return BlocProvider(
      create: (BuildContext context)=>TwitterRegisteCubit(),
      child: BlocConsumer<TwitterRegisteCubit,TwitterRegisteState>(
              builder: (context , state)=>Scaffold(
                appBar:  AppBar(
                  title: Text('Account Register'),
                ),
                body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key:formkey ,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'انشاء حساب على تويتر',
                                style: Theme.of(context).textTheme.headline4?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              // Text(
                              //   'Register now to brows our hot offers',
                              //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              //     color:Colors.grey,
                              //   ),
                              // ),
                              SizedBox(height: 15,),
                              defaultFormField(  controller: namecontroller,
                                type: TextInputType.name,


                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your name';
                                }  return null;},

                                label: 'User name',
                                prefix: Icons.person,
                              ), SizedBox(height: 15,),
                              defaultFormField(  controller: emailcontroller,
                                type: TextInputType.emailAddress,


                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your email address';
                                }  return null;},

                                label: 'email address',
                                prefix: Icons.email,
                              ),SizedBox(height: 15,),

                              defaultFormField(  controller: phonecontroller,
                                type: TextInputType.phone,


                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your phone';
                                }  return null;},

                                label: 'phone',
                                prefix: Icons.phone,
                              ),
                              SizedBox(height: 15,),

                              defaultFormField(  controller: passwordcontroller,
                                type: TextInputType.visiblePassword,

                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your password address';
                                }  return null;},

                                onSubmitted: (value){
                             },
                                isPassword:   TwitterRegisteCubit.get(context).isPassword,
                                suffixPass: (){
                                  TwitterRegisteCubit.get(context).PassonRegiste();

                                },
                                label: 'password',
                                prefix: Icons.lock,
                                suffix:  TwitterRegisteCubit.get(context).sufix,
                              ),

                              SizedBox(height: 15,),
                              ConditionalBuilder(
                                condition: state is! TwitterRegisteLoadingState,
                                builder: (context)=>
                                    defaultButton(function: (){
                                      if(formkey.currentState!.validate())
                                      {TwitterRegisteCubit.get(context).userRegiste(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text,
                                          phone: phonecontroller.text,
                                          name: namecontroller.text);}


                                    }, text: 'Register'),
                                fallback: (context)=>Center(child: CircularProgressIndicator()),
                              ),




                            ],
                          ),
                        ),
                      ),
                    )),),

            listener: (context, state) {
              if(state is TwitterSingleTErrorState){
                showToast(text: state.toString(), state: ToastStates.ERROR);
              }else
              if(state is TwitterSingleTSuccessState){
                cacheHelper.saveData(key: 'uId', value: state.toString()).then((value) {
                  navigateTorout(context, TwitterLayout());
                });
              }
            },


      ),
    );
  }
}