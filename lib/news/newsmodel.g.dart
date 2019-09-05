// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListModel _$NewsListModelFromJson(Map<String, dynamic> json) {
  return NewsListModel(
      json['date'] as String,
      (json['stories'] as List)
          ?.map((e) =>
              e == null ? null : Stories.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['top_stories'] as List)
          ?.map((e) =>
              e == null ? null : TopStories.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsListModelToJson(NewsListModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'stories': instance.stories,
      'top_stories': instance.topStories
    };

Stories _$StoriesFromJson(Map<String, dynamic> json) {
  return Stories(
      (json['images'] as List)?.map((e) => e as String)?.toList(),
      json['type'] as int,
      json['id'] as int,
      json['ga_prefix'] as String,
      json['title'] as String);
}

Map<String, dynamic> _$StoriesToJson(Stories instance) => <String, dynamic>{
      'images': instance.images,
      'type': instance.type,
      'id': instance.id,
      'ga_prefix': instance.gaPrefix,
      'title': instance.title
    };

TopStories _$TopStoriesFromJson(Map<String, dynamic> json) {
  return TopStories(json['image'] as String, json['type'] as int,
      json['id'] as int, json['ga_prefix'] as String, json['title'] as String);
}

Map<String, dynamic> _$TopStoriesToJson(TopStories instance) =>
    <String, dynamic>{
      'image': instance.image,
      'type': instance.type,
      'id': instance.id,
      'ga_prefix': instance.gaPrefix,
      'title': instance.title
    };
