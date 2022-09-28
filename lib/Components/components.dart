import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Layout/twitterlayout/Cubit/cubit.dart';
import '../Share/Webview/webview.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? suffixPass,
  required Function validate,
  Function ?onSubmitted,
  String  ?hintText,
  required String  label,
  IconData ?prefix,
  bool isPassword =false,
  IconData? suffix,

})=>TextFormField(

    onFieldSubmitted:(value)=>onSubmitted!(value),

    onChanged: (valwe){
      print(valwe);
    },
    validator: (valu)=>validate(valu),


    controller:controller ,
    obscureText: isPassword,
    keyboardType:type,

    decoration: InputDecoration(
      suffixIcon:suffix !=null? IconButton(
          onPressed:(){
            suffixPass!();
          },
          icon: Icon(suffix,)) :null,
      hintText:  hintText,
      label: Text(label),
      // labelText: '',
      prefixIcon: Icon(prefix),
      border: OutlineInputBorder()  ,
    ));
TextButton defaultTextButton({
required Function onPressedFunction,
required String text, required ,
}) {
return TextButton(
onPressed: onPressedFunction as VoidCallback,
child: Text(
text.toUpperCase(),
),
);
}

void navigateTo(context,Widget)=>Navigator.push(context, MaterialPageRoute(
    builder: (context)=>Widget));
void navigateTorout(context,Widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context)=>Widget

),
        (rout){return false;}
);
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.black,
  required Function() function,
  required String text,
  bool isUpperCase = true,
  double radius = 3.0,
}) =>
    Container(
      width: width,
      height: 40,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
    );

void showToast({
  required String text,
  required ToastStates state,})=>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );

enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

Widget myDivider() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Divider(
      color: Colors.grey,
      thickness: 1,
    ),
  );
}



Widget BuildNews(articl)=>InkWell(

  onTap: (){},
  child: Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:DecorationImage(image: NetworkImage(articl['urlToImage']),fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    // Text('fff',
                    //   style: TextStyle(
                    //     fontSize: 10,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    SizedBox(width: 5,),
                    Text(articl['publishedAt'],
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: Text(articl['description'],maxLines: 3,style: TextStyle(

                    overflow: TextOverflow.ellipsis,

                  ),),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
    navigateTo(context, WebViewscreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    child: Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
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

Widget articleBuilder(list, context) {
  return ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: TwitterCubit.get(context).science.length,
  );

}



