import 'package:flutter/material.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
//  Field
  List<String> titles = [
    'KDTV',
    'Enet-B',
    'สหกิจศึกษา',
  ];
  List<String> urls = ['', '', ''];

// Method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เวปไซด์'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return RaisedButton(
            child: Text(titles[index]),
          );
        },
      ),
    );
  }
}
