import 'package:json_annotation/json_annotation.dart';
part 'storymodel.g.dart';

@JsonSerializable()
class StoryModel{

  String body;
  @JsonKey(name: 'image_source')
  String imageSource;
  String title;
  String image;
  String shareUrl;
  List<String> js;
  @JsonKey(name: 'ga_prefix')
  String gaPrefix;
  List<String> images;
  int type;
  int id;
  List<String> css;

  StoryModel(this.body,this.imageSource,this.title,this.image,this.shareUrl,this.js,this.gaPrefix,this.images,this.type,this.id,this.css,);
  factory StoryModel.fromJson(Map<String, dynamic> srcJson) => _$StoryModelFromJson(srcJson);

}


