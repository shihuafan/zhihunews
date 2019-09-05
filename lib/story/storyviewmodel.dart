import 'dart:async';
import 'package:dio/dio.dart';
import 'package:zhihunews/story/storymodel.dart';

class StoryViewModel{

  //StreamController<String> storyController = StreamController<String>();

  StreamController<StoryModel> storyController = StreamController<StoryModel>();
  StoryModel storyModel;


  getStory(int id) async {
    String newsUrl='https://news-at.zhihu.com/api/4/news/$id';
    var dio = Dio();
    Response response = await dio.get(newsUrl);
    dio.options.responseType=ResponseType.json;
    storyModel = StoryModel.fromJson(response.data);
    storyController.sink.add(storyModel);
  }

  depose() {
    storyController.close();
  }
}