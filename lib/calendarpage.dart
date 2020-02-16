import 'package:flutter/material.dart';
import 'package:enetb/calendara.dart';
import 'package:enetb/calendarb.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.deepOrangeAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('images/calendar.png'),
                  width: 250.0,
                  height: 250.0,),
                SizedBox(
                  height: 20.0,),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> CalendaraPage()));
                  },
                  color: Colors.white,
                  child: Text('ภาคเรียนที่ 1',style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> CalendarbPage()));},
                  color: Colors.white,
                  child: Text('ภาคเรียนที่ 2',style: TextStyle(
                      fontSize: 30.0,
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