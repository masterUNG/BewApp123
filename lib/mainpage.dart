import 'package:enetb/screens/show_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:enetb/FirstScreen.dart';
import 'package:enetb/notipage.dart';
import 'package:enetb/jobpage.dart';
import 'package:enetb/newspage.dart';
import 'package:enetb/qrpage.dart';
import 'package:enetb/homepage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
//  Field
  int currentIndex = 0;
  List pages = [HomePage(), NewsPage(), QrPage(), FirstScreen(), JobPage()];
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

//  Method

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    findToken();
    receiveNotification();
  }

  Future<void> findToken() async {
    await firebaseMessaging.getToken().then((response) {
      print('Token ===>>> ${response.toString()}');
    });
  }

  Future<void> receiveNotification() async {
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> map) {
        print('onLanch ==> $map');
      },
      onMessage: (Map<String, dynamic> map) {
        return fromOnMessage(map);
      },
      onResume: (Map<String, dynamic> map) {
        print('onResume ===> $map');
      },
    );
  }

  Future<void> fromOnMessage(Map<String, dynamic> map) async {
    print('onMessage ===> $map');
    var result = map['notification'];
    print('result = $result');

    Map<dynamic, dynamic> myMap = result;
    String title = myMap['title'];
    String message = myMap['body'];

    MaterialPageRoute route =
        MaterialPageRoute(builder: (BuildContext buildContext) {
      return ShowNotification(
        title: title,
        message: message,
      );
    });
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Text('EnetB App'),
      backgroundColor: Colors.deepOrange,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NotiPage()));
            })
      ],
    );
    Widget bottomNavBar = BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), title: Text('หน้าหลัก')),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text('ข่าวสาร')),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), title: Text('QR Scan')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('เข้าสู่ระบบ')),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_late), title: Text('งาน')),
        ]);
    return Scaffold(
      appBar: appBar,
      body: pages[currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
