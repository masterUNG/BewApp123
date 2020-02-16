import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:enetb/models/job_model.dart';
import 'package:enetb/screens/play_video.dart';
import 'package:enetb/utility/my_style.dart';
import 'package:flutter/material.dart';

class ListVideo extends StatefulWidget {
  final String category;

  ListVideo({Key key, this.category}) : super(key: key);

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
//  Field
  String myCategory;
  List<JobModel> jobModels = List();
  List<String> titles = [
    'สื่อมัลติมีเดีย',
    'สื่อโปรดักชั่น',
    'สื่อเทคโนโลยี ความเป็นจริงเสมือน',
    'โปสเตอร์',
  ];

//  Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCategory = widget.category;
    print('myCategory = $myCategory');
    readData();
  }

  Future<void> readData() async {
    String url =
        'http://androidthai.in.th/bew/getJobWhereCategoryUng.php?isAdd=true&Category=$myCategory';

    try {
      Response response = await Dio().get(url);
      print('response = $response');

      var result = json.decode(response.data);
      print('result = $result');

      for (var map in result) {
        JobModel jobModel = JobModel.fromMap(map);
        setState(() {
          jobModels.add(jobModel);
        });
      }
    } catch (e) {}
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: Image.network(jobModels[index].pathImage),
    );
  }

  Widget showTitle(int index) {
    return Container(
      margin: EdgeInsets.only(left: 30.0),
      child: Row(
        children: <Widget>[
          Text(
            jobModels[index].name,
            style: MyStyle().titleH1,
          ),
        ],
      ),
    );
  }

  Widget showYear(int index) {
    return Container(
      margin: EdgeInsets.only(left: 30.0),
      child: Row(
        children: <Widget>[
          Text(
            jobModels[index].year,
            style: MyStyle().titleH2,
          ),
        ],
      ),
    );
  }

  Widget showTitleAppBar() {
    int i = int.parse(myCategory);
    return Text(titles[i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showTitleAppBar(),
      ),
      body: ListView.builder(
//        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        itemCount: jobModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return GestureDetector(
            onTap: () {
              MaterialPageRoute materialPageRoute =
                  MaterialPageRoute(builder: (BuildContext buildContext) {
                return PlayVideo(
                  jobModel: jobModels[index],
                );
              });
              Navigator.of(context).push(materialPageRoute);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.grey : Colors.grey.shade300),
              child: Column(
                children: <Widget>[
                  showImage(index),
                  showTitle(index),
                  showYear(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
