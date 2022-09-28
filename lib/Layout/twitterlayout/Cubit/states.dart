abstract class TwitterStates{}
class TwitterInitialState extends TwitterStates{}
class TwitterChangeBottomNavState extends TwitterStates{}
class TwitterLoadingHomeDataState extends TwitterStates{}
class TwitterChangeBottomState extends TwitterStates{}
class SocialLoadingState extends TwitterStates{}
class TwitterSuccessState extends TwitterStates{}
class TwittererrorState extends TwitterStates{

}
class SocialErrorState extends TwitterStates{}

class ProfileImageSuccess extends TwitterStates{}
class ProfileImageError extends TwitterStates{}

class CoverImageSuccess extends TwitterStates{}
class CoverImageError extends TwitterStates{}
class SocialuserdateupdateCoverImage extends TwitterStates{}

class uploadImageError extends TwitterStates{}

class uploadCoverImageError extends TwitterStates{}

class UseruploadCoverImageError extends TwitterStates{}


class Useruploadupdata extends TwitterStates{}

class PostImageSuccess extends TwitterStates{}

class PostImageError extends TwitterStates{}

class CreatePostLoadingstate extends TwitterStates{}


class uploadPosteError extends TwitterStates{}

class removePostImagestate extends TwitterStates{}

class CreatePostSuccess extends TwitterStates{}


class CreatePosteError extends TwitterStates{}

class GetPostsLoading extends TwitterStates{}

class SocialgetpostSuccess extends TwitterStates{}

class SocialgetpostError extends TwitterStates{}

class TwittergetchatsSuccess extends TwitterStates{}

class TwittergetchatsError extends TwitterStates{}

class SocialsendmassageSuccess extends TwitterStates{}

class SocialsendmassageError extends TwitterStates{}

class SocialgetsendmassageSuccess extends TwitterStates{}

class SocialgetsendmassageError extends TwitterStates{}

class SocialgetsendchatSuccess extends TwitterStates{}

class uploadchatImageError extends TwitterStates{}

class ChatImageSuccess extends TwitterStates{}

class chatImageError extends TwitterStates{}

class TwitteruserdateupdateCoverImage extends TwitterStates{}

class NewsGetScienceLoadingState extends TwitterStates{}
class NewsGetScienceSuccessState extends TwitterStates{}

class NewsGetScienceErrorState extends TwitterStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}


class NewsGetSearchErrorState extends TwitterStates{
  final String error;

  NewsGetSearchErrorState(this.error);
}
class NewsGetSearchLoadingState extends TwitterStates{}
class NewsGetSearchSuccessState extends TwitterStates{}

class ChangeModee extends TwitterStates{}






