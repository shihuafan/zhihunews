import 'dart:async';
import 'package:dio/dio.dart';
import 'commentsmodel.dart';

class CommentsViewModel{

  StreamController<CommentsListModel> commentsController = StreamController<CommentsListModel>();
  CommentsListModel commentsListModel;


  getComments(int id,String type) async {
    String newsUrl='https://news-at.zhihu.com/api/4/story/$id/'+type;
    var dio = Dio();
    Response response = await dio.get(newsUrl);
    dio.options.responseType=ResponseType.json;
    commentsListModel = CommentsListModel.fromJson(response.data);
    commentsController.sink.add(commentsListModel);
  }

  depose() {
    commentsController.close();
  }
}