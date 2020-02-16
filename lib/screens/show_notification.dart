import 'package:enetb/utility/my_style.dart';
import 'package:flutter/material.dart';

class ShowNotification extends StatefulWidget {
  final String title, message;

  ShowNotification({Key key, this.title, this.message}) : super(key: key);

  @override
  _ShowNotificationState createState() => _ShowNotificationState();
}

class _ShowNotificationState extends State<ShowNotification> {
//  Field
  String _title, _message;

//  Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _title = widget.title;
    _message = widget.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _title,
              style: MyStyle().titleH1,
            ),
            Text(
              _message,
              style: MyStyle().titleH2,
            )
          ],
        ),
      ),
    );
  }
}
