import 'package:flutter/material.dart';

class NotiPage extends StatefulWidget {
  @override
  _NotiPageState createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.deepOrangeAccent,
        title: Text('แจ้งเตือน'),
      ),
    );
  }
}
