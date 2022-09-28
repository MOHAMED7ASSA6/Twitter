

class  TwitterDataModel{
   String ?email;
 late String name;
  String ?phone;
 late String uId;
 late String image;
   String? bio;
   String? cover;
   String? dateTime;





  TwitterDataModel({
    this.email,
   required this.name,
    this.phone,
  required  this.uId,
   required this.image,
    this.bio,
    this.cover,
    this.dateTime,


  });
  TwitterDataModel.fromjson(Map<String,dynamic>json){
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uId=json['uId'];
     image=json['image'];
    dateTime=json['dateTime'];
    bio=json['bio'];
    cover=json['cover'];




  }
  Map<String,dynamic> toMap(){
    return{
      'email':email,
      'name':name,
      'phone':phone,
      'image':image,
      'bio':bio,
      'uId':uId,
      'cover':cover,
      'dateTime':dateTime,




    };
  }
}