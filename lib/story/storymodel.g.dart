// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return StoryModel(
      json['body'] as String,
      json['image_source'] as String,
      json['title'] as String,
      json['image'] as String,
      json['shareUrl'] as String,
      (json['js'] as List)?.map((e) => e as String)?.toList(),
      json['ga_prefix'] as String,
      (json['images'] as List)?.map((e) => e as String)?.toList(),
      json['type'] as int,
      json['id'] as int,
      (json['css'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'body': instance.body,
      'image_source': instance.imageSource,
      'title': instance.title,
      'image': instance.image,
      'shareUrl': instance.shareUrl,
      'js': instance.js,
      'ga_prefix': instance.gaPrefix,
      'images': instance.images,
      'type': instance.type,
      'id': instance.id,
      'css': instance.css
    };
