class PostModel{
  String? name;
  String? dateTime;
  String? uId;
  String? image;
  String? text;
  String? PostImage;
  String? bio;




  PostModel({
    this.text,
    this.name,
    this.dateTime,
    this.uId,
    this.image,
    this.PostImage,
    this.bio,

  });
  PostModel.fromjson(Map<String,dynamic>json){
    text=json['text'];
    name=json['name'];
    PostImage=json['PostImage'];
    uId=json['uId'];
    image=json['image'];
    dateTime=json['dateTime'];
    bio=json['bio'];

  }
  Map<String,dynamic> toMap(){
    return{
      'text':text,
      'name':name,
      'PostImage':PostImage,
      'image':image,
      'dateTime':dateTime,
      'uId':uId,
      'bio':bio,


    };
  }
}