import 'package:enetb/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:enetb/FirstScreen.dart';

const PrimaryColor = const Color(0xFFFF6B00);


class RegisterTeacher extends StatefulWidget {
  RegisterTeacher() : super();

  final String title = "ลงทะเบียนสำหรับบุคลากร";
  @override
  RegisterTeacherState createState() => RegisterTeacherState();
}

class RegisterTeacherState extends State<RegisterTeacher> {
  //
  static final String uploadEndPoint =
      'http://128.199.170.20/api_enetb/register_teacher.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  bool visible = false ;

  // Getting value from TextField widget.
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final studentIdController = TextEditingController();
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  final citizenIdController = TextEditingController();

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });

    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String teacherId = studentIdController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String citizenId = citizenIdController.text;

    if(tmpFile == null || firstName.isEmpty || lastName.isEmpty || teacherId.isEmpty || password.isEmpty || username.isEmpty){
      alertDialog();
    }else{
      String fileName = tmpFile.path.split('/').last;
      uploadData(fileName,firstName,lastName,teacherId, username ,password,citizenId);
    }
  }

  alertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('กรุณาใส่ข้อมูลให้ครบถ้วน !'),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  uploadData (String fileName, String firstName, String lastName, String teacherId, String username, String password, String citizenId) async {


    // Store all data with Param Name.
    var data = {
      'image' : base64Image,
      'name' : fileName,
      'firstName': firstName,
      'lastName': lastName,
      'studentId': teacherId,
      'username' : username,
      'password': password,
      'citizenId' : citizenId
    };

    // Starting Web API Call.
    var response = await http.post(uploadEndPoint, body: json.encode(data));

    print(response.body);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    if(message == 'ลงทะเบียนสำเร็จ !'){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlerSuccess();
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }


  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return  Container(
              decoration: BoxDecoration(color: Colors.teal),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(snapshot.data, fit: BoxFit.fill),
              )
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return new Container(
            height: 127.00,
            width: 127.00,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/profile.png"),
              ),
            ),
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ลงทะเบียนสำหรับบุคลากร'),centerTitle: true, backgroundColor: PrimaryColor
      ),
      body:  Container(padding: EdgeInsets.only(top : 50.0, left: 80, right: 80),
          child: SingleChildScrollView(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                showImage(),
                SizedBox(
                  height: 20.0,
                ),
                OutlineButton(
                  onPressed: chooseImage,
                  child: Text('เลือกรูปภาพ'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: citizenIdController,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'เลขบัตรประจำตัวประชาชน',
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    )
                ),

                Container(
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: firstNameController,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'ชื่อจริง',
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    )
                ),

                Container(
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: lastNameController,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'นามสกุล',
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    )
                ),

                Container(
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: studentIdController,
                      autocorrect: true,
                      decoration:
                      InputDecoration(hintText: 'รหัสประจำตัวอาจารย์',
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),

                    )
                ),

                Container(
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: usernameController,
                      autocorrect: true,
                      decoration:
                      InputDecoration(hintText: 'ชื่อเข้าใช้งาน',
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),

                    )
                ),

                Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passwordController,
                      autocorrect: true,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'รหัสผ่าน',
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    )
                ),

                ButtonTheme(
                  minWidth: 300.0,
                  height: 50.0,
                  padding: EdgeInsets.all(20.0),
                  child:  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xfffe0000),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('ลงทะเบียน'),
                    onPressed: startUpload,
                  ),
                ),


              ],
            ),
          )),
    );

  }
}

class AlerSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: const Text(''),
//        ),
        body: Center (
            child : Container(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 90.00,
                    width: 90.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/clipboard.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ลงทะเบียนสำเร็จแล้ว",
                    style: TextStyle(
                      fontFamily: "Quark",fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color:Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child:  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Color(0xfffe0000),
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text('กลับไปที่หน้าเข้าใช้งาน'),
                      onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                          return new HomeScreen(userId: null, type: null);
                        }))
                      },
                    ),
                  ),
                ],
              ),
            ) )
    );
  }

}



