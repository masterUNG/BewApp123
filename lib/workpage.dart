import 'package:enetb/listvideo.dart';
import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
//  Field

//  Method

  Widget showIcon(String title, String pathImage, String category) {
    return GestureDetector(
      onTap: () {
        print('category = $category');

        int categoryInt = int.parse(category);

        switch (categoryInt) {
          case 2:
            {
              print('cat == 2');

            }
            break;

          case 3:
            {
              print('cat == 3');
            }
            break;

          default:
            {
              MaterialPageRoute materialPageRoute =
                  MaterialPageRoute(builder: (BuildContext buildContext) {
                return ListVideo(
                  category: category,
                );
              });
              Navigator.of(context).push(materialPageRoute);
            }
            break;
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 80.0,
              child: Image.asset(pathImage),
            ),
            Container(
              alignment: Alignment.center,
              width: 130.0,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        width: 140.0,
        height: 140.0,
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showIcon('สื่อมัลติมีเดีย', 'assets/images/movie1.png', '0'),
        showIcon('สื่อโปรดักชั่น', 'assets/images/camera1.png', '1'),
      ],
    );
  }

  Widget row2() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showIcon('สื่อเทคโนโลยี ความเป็นจริงเสมือน',
            'assets/images/cinema1.png', '2'),
        showIcon('โปสเตอร์', 'assets/images/identification1.png', '3'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลงาน'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.all(16.0),
//          color: Colors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              row1(),
              row2(),
            ],
          ),
        ),
      ),
    );
  }
}
