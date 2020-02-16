// import 'file:///C:/Users/Supanneew/Desktop/flutter_app-master/flutter_app-master/lib/MenuOnlineScreen.dart';
import 'package:enetb/calendara.dart';
import 'package:enetb/mappage.dart';
import 'package:enetb/webpage.dart';
import 'package:enetb/workpage.dart';
import 'package:flutter/material.dart';
import 'package:enetb/FirstScreen.dart';

import 'MenuOnlineScreen.dart';
// import 'file:///C:/Users/Supanneew/Desktop/flutter_app-master/flutter_app-master/lib/ProfileScreen.dart';

const PrimaryColor = const Color(0xFFFF6B00);
double mainPadding = 10.0;
double eachPadding = 5.0;
double imageWidth = 80;
double fontSizeButt = 14;
String fontFam = 'Quark';

String urlSche =
    "http://klogic.kmutnb.ac.th:8080/kris/tess/dataQuerySelector.jsp?query=studentTab";
String urlExam = "http://cit.kmutnb.ac.th/examination/";

class HomePage extends StatefulWidget {
  HomePage({
    @required this.userId,
    @required this.type,
  });

  final userId;
  final type;

  @override
  HomePagetState createState() =>
      new HomePagetState(userId == null ? '0' : userId, type);
}

class HomePagetState extends State<HomePage> {
  HomePagetState(this.userId, this.type); //constructor
  final userId;
  final type;

  onPressMenuOnline(context) {
    print(type);
    if (type == 'student') {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new MenuOnlineScreenStudent();
      }));
    } else if (type == 'teacher') {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new MenuOnlineScreenTeacher();
      }));
    } else {
      Navigator.of(context).pop();
    }
  }

  checkLogin() {
    if (userId == '0') {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new FirstScreen();
      }));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.fromLTRB(5.0, 30.0, 10.0, 5.0),
      padding: EdgeInsets.all(mainPadding),
      child: Table(
        children: [
          TableRow(children: [
            tableLearning(context),
            myCalenda(context),
            myWebSite()
          ]),
          TableRow(children: [subjectTeching(), officer(), classRoom()]),
          TableRow(children: [jobStudent(), dataGraph(), myMap()]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.all(eachPadding),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new WebViewScreen(urlString: urlExam);
                      }));
                    },
                    child: Image.asset(
                      'assets/images/test.png',
                      width: imageWidth,
                    ),
                  ),
                  Text(
                    'คลังข้อสอบเก่า',
                    style: TextStyle(
                      fontFamily: fontFam,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeButt,
                      color: PrimaryColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(eachPadding),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () =>
                        {this.checkLogin() && this.onPressMenuOnline(context)},
                    child: Image.asset(
                      'assets/images/service.png',
                      width: imageWidth,
                    ),
                  ),
                  Text(
                    'บริการออนไลน์',
                    style: TextStyle(
                      fontFamily: fontFam,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeButt,
                      color: PrimaryColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(eachPadding),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/images/load.png',
                      width: imageWidth,
                    ),
                  ),
                  Text(
                    'ดาวน์โหลด',
                    style: TextStyle(
                      fontFamily: fontFam,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeButt,
                      color: PrimaryColor,
                    ),
                  )
                ],
              ),
            )
          ])
        ],
      ),
    ));
  }

  Container myMap() {
    return Container(
        padding: EdgeInsets.all(eachPadding),
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {

                MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context){return MapPage();});
                Navigator.of(context).push(route);

              },
              child: Image.asset(
                'assets/images/map.png',
                width: imageWidth,
              ),
            ),
            Text(
              'แผนที่',
              style: TextStyle(
                fontFamily: fontFam,
                fontWeight: FontWeight.bold,
                fontSize: fontSizeButt,
                color: PrimaryColor,
              ),
            )
          ],
        ));
  }

  Container dataGraph() {
    return Container(
      padding: EdgeInsets.all(eachPadding),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Image.asset(
              'assets/images/data.png',
              width: imageWidth,
            ),
          ),
          Text(
            'ข้อมูลแขนง',
            style: TextStyle(
              fontFamily: fontFam,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeButt,
              color: PrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Container jobStudent() {
    return Container(
      padding: EdgeInsets.all(eachPadding),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (BuildContext context) {
                return WorkPage();
              });
              Navigator.of(context).push(route);
            },
            child: Image.asset(
              'assets/images/work.png',
              width: imageWidth,
            ),
          ),
          Text(
            'ผลงาน',
            style: TextStyle(
              fontFamily: fontFam,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeButt,
              color: PrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Container classRoom() {
    return Container(
      padding: EdgeInsets.all(eachPadding),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Image.asset(
              'assets/images/room.png',
              width: imageWidth,
            ),
          ),
          Text(
            'ห้องเรียน',
            style: TextStyle(
              fontFamily: fontFam,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeButt,
              color: PrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Container officer() {
    return Container(
      padding: EdgeInsets.all(eachPadding),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Image.asset(
              'assets/images/prof.png',
              width: imageWidth,
            ),
          ),
          Text(
            'บุคลากร',
            style: TextStyle(
              fontFamily: fontFam,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeButt,
              color: PrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Container subjectTeching() {
    return Container(
        padding: EdgeInsets.all(eachPadding),
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Image.asset(
                'assets/images/vr.png',
                width: imageWidth,
              ),
            ),
            Text(
              'วิชาที่เปิดสอน',
              style: TextStyle(
                fontFamily: fontFam,
                fontWeight: FontWeight.bold,
                fontSize: fontSizeButt,
                color: PrimaryColor,
              ),
            )
          ],
        ));
  }

  Container myWebSite() {
    return Container(
      padding: EdgeInsets.all(eachPadding),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (BuildContext context) {
                return WebPage();
              });
              Navigator.of(context).push(route);
            },
            child: Image.asset(
              'assets/images/web.png',
              width: imageWidth,
            ),
          ),
          Text(
            'เว็บไซต์',
            style: TextStyle(
              fontFamily: fontFam,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeButt,
              color: PrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Container myCalenda(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(eachPadding),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              print('You Click Calendar');

//                      Create Route to calendar.dart
              MaterialPageRoute materialPageRoute =
                  MaterialPageRoute(builder: (BuildContext buildContext) {
                return CalendaraPage();
              });
              Navigator.of(context).push(materialPageRoute);
            },
            child: Image.asset(
              'assets/images/calendar.png',
              width: imageWidth,
            ),
          ),
          Text(
            'ปฏิทิน',
            style: TextStyle(
              fontFamily: fontFam,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeButt,
              color: PrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Container tableLearning(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(eachPadding),
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new WebViewScreen(
                    urlString: urlSche,
                    titleString: 'เว็บไซต์',
                  );
                }));
              },
              child: Image.asset(
                'assets/images/study.png',
                width: imageWidth,
              ),
            ),
            Text(
              'ตารางเรียน',
              style: TextStyle(
                fontFamily: fontFam,
                fontWeight: FontWeight.bold,
                fontSize: fontSizeButt,
                color: PrimaryColor,
              ),
            )
          ],
        ));
  }
}
