
abstract class TwitterLoginState{}

class TwitterLoginInitialState extends TwitterLoginState{}

class TwitterLoginLoadingState extends TwitterLoginState{}

class TwitterLoginSuccessState extends TwitterLoginState{}

class TwitterLoginErrorState extends TwitterLoginState
{
final String error;
TwitterLoginErrorState(this.error);
}

class TwitterIsPasswordState extends TwitterLoginState{}
class TwitterPasswordState extends TwitterLoginState{}
class TwitterSingleTSuccessState extends TwitterLoginState{
  final String uId;

  TwitterSingleTSuccessState(this.uId);
}
class TwitterSingleTErrorState extends TwitterLoginState{}



