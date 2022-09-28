import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Share/local/Cache_helper.dart';


import '../../Components/components.dart';
import '../../Layout/twitterlayout/Layouttwitter.dart';
import '../Register/ShopRegisterScreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class TwitterLogin extends StatelessWidget {
 var formkey=GlobalKey<FormState>();
 var emailcontroller=TextEditingController();
 var passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>TwitterLoginCubit(),
      child: BlocConsumer<TwitterLoginCubit,TwitterLoginState>(
        listener:(context,state){

          if(state is TwitterSingleTErrorState){
            showToast(text: state.toString(), state: ToastStates.ERROR);
          }

          if(state is TwitterSingleTSuccessState ){
            cacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateTorout(context, TwitterLayout());

            });
          }

        } ,
        builder: (context,state)=>Scaffold(
          appBar: AppBar(

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
                        'تسجيل الدخول إلى تويتر',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   'تسجيل الدخول إلى تويتر',
                      //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      //     color:Colors.grey,
                      //   ),
                      // ),
                      defaultFormField(  controller: emailcontroller,
                        type: TextInputType.emailAddress,


                        validate: (  value){if(value.isEmpty) {
                          return 'please enter your email address';
                        }  return null;},

                        label: 'email',
                        prefix: Icons.email_outlined,
                      ), SizedBox(height: 15,),
                      defaultFormField(  controller: passwordcontroller,
                        type: TextInputType.visiblePassword,

                        validate: (  value){if(value.isEmpty) {
                          return 'please enter your password address';
                        }  return null;},

                        onSubmitted: (value){
                          if(formkey.currentState!.validate())
                          {
                            TwitterLoginCubit.get(context).userLogin(email: emailcontroller.text,
                              password: passwordcontroller.text);
                          }
                        },
                        isPassword:   TwitterLoginCubit.get(context).isPassword,
                        suffixPass: (){
                          TwitterLoginCubit.get(context).Passon();

                        },
                        label: 'password',
                        prefix: Icons.lock,
                        suffix:  TwitterLoginCubit.get(context).sufix,
                      ),
                      SizedBox(height: 15,),
                      ConditionalBuilder(
                        condition: state is !TwitterLoginLoadingState,
                        builder: (context)=>defaultButton(function: (){
                          if(formkey.currentState!.validate())
                          {
                            TwitterLoginCubit.get(context).userLogin(email: emailcontroller.text,
                              password: passwordcontroller.text);
                          }


                        }, text: 'LOGIN'),
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text(
                              'Don\'t have an account'
                          ),
                          SizedBox(width: 5,),

                          TextButton(onPressed: (){
                            navigateTo(context,RegisterScreen());
                          }, child: Text('Register',style: TextStyle(color: Colors.black),))

                        ],
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
