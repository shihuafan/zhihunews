import 'package:flutter/material.dart';
import 'dart:async';
import 'news/newsview.dart';
import 'news/newsviewmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsView(title:"Zhihu News"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String reslut="sdaxcaxas";
  NewsListViewModel nlvm=new NewsListViewModel();

  @override
  void initState() {
    // ignore: cancel_subscriptions
    StreamSubscription subscription =
    nlvm.newsListController.stream.listen((data){
    //  print(data.stories[0].title);
      setState((){});
    });
    super.initState();
  }

  void _incrementCounter() {
    nlvm.getLatestNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(reslut),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
