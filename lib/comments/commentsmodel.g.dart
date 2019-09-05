// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) {
  return CommentsModel(
      json['author'] as String,
      json['content'] as String,
      json['avatar'] as String,
      json['time'] as int,
      json['reply_to'] == null
          ? null
          : ReplyModel.fromJson(json['reply_to'] as Map<String, dynamic>),
      json['id'] as int,
      json['likes'] as int);
}

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'avatar': instance.avatar,
      'time': instance.time,
      'reply_to': instance.reply,
      'id': instance.id,
      'likes': instance.likes
    };

ReplyModel _$ReplyModelFromJson(Map<String, dynamic> json) {
  return ReplyModel(json['content'] as String, json['status'] as int,
      json['id'] as int, json['author'] as String);
}

Map<String, dynamic> _$ReplyModelToJson(ReplyModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'status': instance.status,
      'id': instance.id,
      'author': instance.author
    };

CommentsListModel _$CommentsListModelFromJson(Map<String, dynamic> json) {
  return CommentsListModel((json['comments'] as List)
      ?.map((e) =>
          e == null ? null : CommentsModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CommentsListModelToJson(CommentsListModel instance) =>
    <String, dynamic>{'comments': instance.comments};
