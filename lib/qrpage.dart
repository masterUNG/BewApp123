import 'package:barcode_scan/barcode_scan.dart';
import 'package:enetb/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
//  Field
  String resultCode = 'Please Click for Read Code';

//  Method
  Widget qrButton() {
    return Container(
      child: OutlineButton(
        child: Text(
          'QR or Bar Code',
          style: MyStyle().titleH1,
        ),
        onPressed: () {
          processReadCode();
        },
      ),
      width: 180.0,
      height: 180.0,
    );
  }

  Future<void> processReadCode() async {
    try {
      var object = await BarcodeScanner.scan();

      setState(() {
        resultCode = object;
      });
    } catch (e) {}
  }

  Widget showResult() {
    return GestureDetector(
      onTap: () {
        lancherToWeb();
      },
      child: Text(
        resultCode,
        style: MyStyle().titleH2,
      ),
    );
  }

Future<void> lancherToWeb()async{

    if (await canLaunch(resultCode)) {
      await launch(resultCode);
    } else {
      setState(() {
        resultCode = 'Cannot Launch $resultCode';
      });
    }

}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          qrButton(),
          SizedBox(
            height: 30.0,
          ),
          showResult(),
        ],
      ),
    );
  }
}
