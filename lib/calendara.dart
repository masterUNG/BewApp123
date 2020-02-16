import 'package:enetb/MenuOnlineScreen.dart';
import 'package:enetb/calendarb.dart';
import 'package:flutter/material.dart';

class CalendaraPage extends StatefulWidget {
  @override
  _CalendaraPageState createState() => _CalendaraPageState();
}

class _CalendaraPageState extends State<CalendaraPage> {
//  Field

//Method
  Widget showImage() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('assets/images/calendar.png'),
    );
  }

  Widget showButton() {
    return RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text('ปฏิทินเพื่อ การศึกษา'),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return WebViewScreen(
            urlString: 'http://acdserv.kmutnb.ac.th/academic-calendar',
            titleString: 'ปฏิทินเพื่อ การศึกษา',
          );
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text('Calendar'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.deepOrange),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showImage(),
              SizedBox(
                height: 16.0,
              ),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
