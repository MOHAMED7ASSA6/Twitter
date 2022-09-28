



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Components/components.dart';

import '../Share/local/Cache_helper.dart';
import '../model/Login/login.dart';

String ?token='';
String ?uId='';
void SignOut(context) {
  cacheHelper.removeData(key: 'uId').then(
          (value) {
            if (value) {
navigateTorout(context, TwitterLogin());
            }
          });
}

