import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){},
                  color: Colors.grey,
                  child: Text('สหกิจศึกษา',style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.grey,
                  child: Text('ปริญญานิพนธ์',style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.grey,
                  child: Text('แบบฟอร์มต่างๆ',style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}