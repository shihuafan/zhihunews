import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zhihunews/story/storyview.dart';
import 'newsmodel.dart';
import 'package:zhihunews/main.dart';
import 'newsviewmodel.dart';

class NewsView extends StatefulWidget {
  NewsView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _NewsViewState createState() => _NewsViewState();
}


class _NewsViewState extends State<NewsView> {

  NewsListViewModel _newsListViewModel=new NewsListViewModel();
  List<TopStories> _list;
  int _listSize=0;

  @override
  void initState() {
      _newsListViewModel.newsListController.stream.listen((data){
        _list=data;
        _listSize=_list.length;
        setState((){});
    });
      _newsListViewModel.getLatestNew();
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
          Text(widget.title,
            textScaleFactor:1,
            style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child:
            ListView.separated(
                  itemCount: _listSize,
                  separatorBuilder: (context, index) => Divider(height: .0),
                  itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                       Navigator.push( context,
                            MaterialPageRoute(builder: (context) {return StoryView(id:_list[index].id);}));
                    },
                    child: Container(
                      height: 100.0,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              child:
                              Text("${index+1}", textScaleFactor:1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            flex: 12,
                            child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(15.0,15.0,5.0,15.0),
                                child:
                                  Text(_list[index].title,
                                    textScaleFactor:1.1,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0,15.0,5.0,15.0),
                              alignment: Alignment.center,
                              decoration:new BoxDecoration(
                          //      border: new Border.all(width: 1.0, color: Colors.white30),
                                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(_list[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      )
                  ));
                 },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newsListViewModel.getLatestNew,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
//    _data=null;
    super.dispose();
  }
}