import 'package:json_annotation/json_annotation.dart';
part 'commentsmodel.g.dart';

@JsonSerializable()
class CommentsModel{
  String author;
  String content;
  String avatar;
  int time;
  @JsonKey(name: 'reply_to')
  ReplyModel reply;
  int id;
  int likes;
  CommentsModel(this.author,this.content,this.avatar,this.time,this.reply,this.id,this.likes);
  factory CommentsModel.fromJson(Map<String, dynamic> srcJson) => _$CommentsModelFromJson(srcJson);
}

@JsonSerializable()
class ReplyModel{
  String content;
  int status;
  int id;
  String author;
  ReplyModel(this.content,this.status,this.id,this.author);
  factory ReplyModel.fromJson(Map<String, dynamic> srcJson) => _$ReplyModelFromJson(srcJson);
}

@JsonSerializable()
class CommentsListModel{
  List<CommentsModel> comments;
  CommentsListModel(this.comments);
  factory CommentsListModel.fromJson(Map<String, dynamic> srcJson) => _$CommentsListModelFromJson(srcJson);
}