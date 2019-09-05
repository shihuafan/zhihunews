import 'package:flutter/material.dart';

import 'commentsmodel.dart';
import 'commentsviewmodel.dart';

class CommentsView extends StatefulWidget{
  CommentsView({Key key, this.id,this.title}):super(key:key);
  final int id;
  final String title;
  @override
  State<StatefulWidget> createState() =>_CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        backgroundColor: Colors.white,
        title:
        Text(widget.title,
          textScaleFactor:0.8,
          style: TextStyle(color:Colors.black,),),
        bottom:TabBar(   //生成Tab菜单
            controller: _tabController,
            tabs: <Widget>[
              new Tab(
                child: Text("长评论",textScaleFactor: 1,style: TextStyle(color: Colors.blueAccent),),
              ),
              new Tab(
                child: Text("短评论",textScaleFactor: 1,style: TextStyle(color: Colors.blueAccent),),
              ),
            ]
        ),
      ),
        body:new TabBarView(
          controller: _tabController,
          children:<Widget>[
            new Center(child: new CommentsDetailView(id: widget.id,type:"long-comments")),
            new Center(child: new CommentsDetailView(id: widget.id,type:"short-comments"))
          ],
        )
    );
  }
}

class CommentsDetailView extends StatefulWidget{

  CommentsDetailView({Key key,this.id, this.type}): super(key: key);
  final int id;
  final String type;

  @override
  State<StatefulWidget> createState() => _CommentsDetailViewState();

}

class _CommentsDetailViewState extends State<CommentsDetailView>{

  CommentsViewModel _commentsViewModel=new CommentsViewModel();
  List<CommentsModel> _list;
  int length=0;
  var flag=false;
  @override
  void initState() {
    _commentsViewModel.commentsController.stream.listen((data){
      _list=data.comments;
      length=_list.length;
      flag=true;
      setState((){});
    });
    _commentsViewModel.getComments(widget.id,widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    if(flag && length==0)return Center(child: Text("暂无评论"),);
    else if(length==0) return Center(child: Text("加载中..."),);
    else{
      return Container(
        height: double.infinity,
        child: ListView.separated(
          itemCount: length,
          separatorBuilder: (context, index) => Divider(height: .0),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      margin: EdgeInsets.fromLTRB(15.0,15.0,15.0,5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(_list[index].avatar),
                            fit: BoxFit.cover),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(_list[index].author),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60.0,0,15.0,15.0),
                  alignment: Alignment.topLeft,
                  child: Text(_list[index].content,softWrap: true,),
                ),
                Container(
                  height: 30.0,
                  padding: EdgeInsets.fromLTRB(60.0,0,10.0,0.0),
                  child: Stack(
                    children:<Widget>[
                      Positioned(
                          left: 0,
                          child:Text(getTime(_list[index].time),style: TextStyle(color: Colors.grey),)
                      ),
                      Positioned(
                          right: 40.0,
                          top: 3.0,
                          child:Text("${_list[index].likes}",style: TextStyle(color: Colors.grey),)
                      ),
                      Positioned(
                          right: 15.0,
                          child:Icon(Icons.thumb_up,size:20.0,color: Colors.grey,)
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

  }

  String getTime(int second){
    var time=DateTime.fromMillisecondsSinceEpoch(second*1000);
    return "${time.year}年${time.month}月${time.day}日";
  }
}
