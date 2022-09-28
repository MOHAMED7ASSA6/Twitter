





abstract class TwitterRegisteState{}

class TwitterRegisteInitialState extends TwitterRegisteState{}

class TwitterRegisteLoadingState extends TwitterRegisteState{}

class TwitterRegisteSuccessState extends TwitterRegisteState{}

class SocialCreatSuccessState extends TwitterRegisteState{}

class SocialCreatErrorState extends TwitterRegisteState{
  final String error;
  SocialCreatErrorState(this.error);
}
class TwitterRegisteErrorState extends TwitterRegisteState
{
final String error;
TwitterRegisteErrorState(this.error);
}

class TwitterRegisteIsPasswordState extends TwitterRegisteState{}
class TwittercreateRegisteSuccessState extends TwitterRegisteState{}

class TwittercreatRegisteErrorState extends TwitterRegisteState{}