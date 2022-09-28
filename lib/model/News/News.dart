import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/cubit.dart';
import 'package:twitterapp/Layout/twitterlayout/Cubit/states.dart';

import '../../Components/components.dart';
import '../../Share/Webview/webview.dart';


class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwitterCubit, TwitterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list =TwitterCubit.get(context).science;
       return ConditionalBuilder(condition: list.length>0,
           builder: (context)=>articleBuilder(list,context),
           fallback: (context)=>Center(child: CircularProgressIndicator()),
       );
      },
    );
  }

}