import 'dart:async';
import 'package:zhihunews/news/newsmodel.dart';
import 'package:dio/dio.dart';

class NewsListViewModel{

  StreamController<List<TopStories>> newsListController = StreamController<List<TopStories>>();
  NewsListModel newsListModel;
  List<TopStories> list=List();

  getLatestNew() async {
    var dio = Dio();
    Response response = await dio.get("https://news-at.zhihu.com/api/4/news/latest");
    dio.options.responseType=ResponseType.json;
    newsListModel = NewsListModel.fromJson(response.data);
    for(Stories stories in newsListModel.stories){
      list.add(new TopStories(stories.images[0], stories.type, stories.id, stories.gaPrefix, stories.title));
    }
    list.addAll(newsListModel.topStories);
    newsListController.sink.add(list);
  }

  depose() {
    newsListController.close();
  }
}
