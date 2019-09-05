import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:zhihunews/comments/commentsview.dart';
import 'storymodel.dart';
import 'storyviewmodel.dart';

class StoryView extends StatefulWidget {
  StoryView({Key key, this.id}) : super(key: key);
  final int id;
  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {

  StoryModel _storyModel=new StoryModel("","","","","",[],"",[],0,0,[]);
  StoryViewModel _storyViewModel=new StoryViewModel();

  @override
  void initState() {
    print(widget.id);
    _storyViewModel.storyController.stream.listen((data){
        _storyModel=data;
        setState((){});
    });
    _storyViewModel.getStory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.black,),
        backgroundColor: Colors.white,
        title:
          Text(_storyModel.title,
            textScaleFactor:0.8,
            style: TextStyle(color:Colors.black,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200.0,
                  child:DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors:[Color(0x88000000),Color(0x00ffffff)], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    ),
                    position: DecorationPosition.foreground,
                    child: Image(image: NetworkImage(_storyModel.image), width: double.infinity,fit: BoxFit.fitWidth,),
                  )
                ),
                Positioned(
                    bottom: 15.0,
                    left: 15.0,
                    right: 15.0,
                    child:
                    Text(_storyModel.title,
                        textScaleFactor: 1.6,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              ]
            ),
            GestureDetector(
              onTap: (){
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {return CommentsView(title:_storyModel.title,id: widget.id);}));
              },
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0, 0, 30.0, 0),
                height: 40.0,
                decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.grey[300]),),
                child: Text("查看评论",textScaleFactor: 1,style: TextStyle(color: Colors.blueAccent),),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 20.0),
              child: Html(
                data: _storyModel.body,
              ),
            )
          ],
        )
      )
    );
  }
}

