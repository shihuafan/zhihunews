import 'package:json_annotation/json_annotation.dart';
part 'newsmodel.g.dart';

@JsonSerializable()
class NewsListModel{

  String date;
  List<Stories> stories;
  @JsonKey(name: 'top_stories')
  List<TopStories> topStories;

  NewsListModel(this.date,this.stories,this.topStories,);

  factory NewsListModel.fromJson(Map<String, dynamic> srcJson) => _$NewsListModelFromJson(srcJson);
  Map<String, dynamic> toJson() => _$NewsListModelToJson(this);


}

@JsonSerializable()
class Stories{

  List<String> images;
  int type;
  int id;
  @JsonKey(name: 'ga_prefix')
  String gaPrefix;
  String title;

  Stories(this.images,this.type,this.id,this.gaPrefix,this.title,);
  factory Stories.fromJson(Map<String, dynamic> srcJson) => _$StoriesFromJson(srcJson);
  Map<String, dynamic> toJson() => _$StoriesToJson(this);
}

@JsonSerializable()
class TopStories{

  String image;
  int type;
  int id;
  @JsonKey(name: 'ga_prefix')
  String gaPrefix;
  String title;

  TopStories(this.image,this.type,this.id,this.gaPrefix,this.title,);
  factory TopStories.fromJson(Map<String, dynamic> srcJson) => _$TopStoriesFromJson(srcJson);
  Map<String, dynamic> toJson() => _$TopStoriesToJson(this);
}