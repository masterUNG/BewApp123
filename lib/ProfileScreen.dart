import 'package:enetb/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enetb/HomeScreen.dart';

const PrimaryColor = const Color(0xFFFF6B00);
const profileColor = const Color(0xFFFFFFFF);
const blackColor = const Color(0xFF000000);
const topicColor = const Color(0xFF3A85FB);

double mainPadding = 10.0;
double eachPadding = 5.0;
double imageWidth = 80;
double fontSizeButt = 18;
double fontSizeTopic = 20;
String fontFam = 'Quark';

class ProfileStudentScreen extends StatefulWidget {
  ProfileStudentScreen({
    @required this.userId,

  });
  final userId;

  @override
  ProfileScreenState createState() => new ProfileScreenState(userId);

}



class ProfileScreenState extends State<ProfileStudentScreen> {
  bool visible = true;

  ProfileScreenState(this.userId);  //constructor
  final userId;
  var data = {};


  @override
   void initState () {
    // TODO: implement initState
    super.initState();
    print('userid');
    print(userId);

    this.getUserData();

  }


  Future getUserData() async {
    var url = 'http://128.199.170.20/api_enetb/getUser.php?userId=' + userId;
    print(url);

    // Starting Web API Call.
    var response = await http.get(url);
    var value =  jsonDecode(response.body);
    print(value);


    if (response.statusCode == 200) {
       if(value['text'] == 'success'){
         print('success');
          await this.setState(() {
            data = value;
            visible = false;
         });

       }
       print(data);

    }
  }





  alertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('คุณต้องการออกจากระบบใช่หรือไม่ '),
          actions: <Widget>[
            FlatButton(
              child: new Text("ตกลง"),
              onPressed: () => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => HomeScreen(userId: null, type: null)),
                ModalRoute.withName('/'),
                )
              },
            ),
            FlatButton(
              child: new Text("ยกเลิก"),
              onPressed: () => {
                Navigator.of(context).pop()
              },
            ),

          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PrimaryColor,
        appBar: AppBar(
          title: Text(

            'โปรไฟล์',
            style: TextStyle(

              fontFamily: fontFam,fontWeight: FontWeight.bold,
              fontSize: 20,

            ),
          ),

          centerTitle: true,
          backgroundColor: PrimaryColor,
        ),

        body:
         Column(
//            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 300.00,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                decoration: BoxDecoration(color: profileColor,
                  boxShadow: [BoxShadow(offset: Offset(0.00,3.00),color: blackColor.withOpacity(0.16),blurRadius: 6 )],
                  borderRadius: BorderRadius.circular(9.00),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(24.0, 10.0, 10.0, 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('ชื่อ' , style: TextStyle(fontFamily: fontFam,color: topicColor ,fontWeight: FontWeight.bold,fontSize: fontSizeTopic ),),
                                Text(data['firstName'] + " " + data['lastName'], style: TextStyle(fontFamily: fontFam,color: blackColor ,fontWeight: FontWeight.bold,fontSize: 22),)
                              ],
                            ),
                          ),

                          data['type'] == 'student' ?
                          Container(
                            margin: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('รหัสนักศึกษา' , style: TextStyle(fontFamily: fontFam,color: topicColor ,fontWeight: FontWeight.bold,fontSize: fontSizeTopic ),),
                                Text(data['studentId'], style: TextStyle(fontFamily: fontFam,color: blackColor ,fontWeight: FontWeight.bold,fontSize: 18 ),)
                              ],
                            ),
                          )
                              :
                          Container(
                            margin: EdgeInsets.fromLTRB(3.0, 4.0, 3.0, 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('รหัสอาจารย์' , style: TextStyle(fontFamily: fontFam,color: topicColor ,fontWeight: FontWeight.bold,fontSize: fontSizeTopic ),),
                                Text(data['studentId'], style: TextStyle(fontFamily: fontFam,color: blackColor ,fontWeight: FontWeight.bold,fontSize: 18 ),)
                              ],
                            ),
                          ),

                          data['type'] == 'student' ?
                          Container(
                             margin: EdgeInsets.fromLTRB(3.0, 4.0, 3.0, 1.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                 Text('ชั้นปีที่ ' , style: TextStyle(fontFamily: fontFam,color: topicColor ,fontWeight: FontWeight.bold,fontSize: fontSizeTopic ),),
                                 Text(data['year'] , style: TextStyle(fontFamily: fontFam,color: blackColor ,fontWeight: FontWeight.bold,fontSize: 18 ),)
                               ],
                             ),
                          ) :  Container(
                            margin: EdgeInsets.fromLTRB(3.0, 4.0, 3.0, 1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('' , style: TextStyle(fontFamily: fontFam,color: topicColor ,fontWeight: FontWeight.bold,fontSize: fontSizeTopic ),),
                              ],
                            ),
                          ),
                        ],



                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(12.0, 12.0, 5.0, 1.0),
                      child:
                        Image.network(
                          data['image'],
                          width: 200,
                          height: 300,
                        )
                    ),




                    Visibility(
                        visible: visible,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: CircularProgressIndicator( backgroundColor: Colors.black)
                        )
                    ),




                  ],
                ),



              ),

              SizedBox(
                height: 30,
              ),

              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                padding: EdgeInsets.only(top : 100.0),
                child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text('ออกจากระบบ'),
                  onPressed: () => {
                      alertDialog()
                  },
                ),
              ),
            ]
        ),




    );





  }
}
