import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalendarbPage extends StatefulWidget {
  @override
  _CalendarbPageState createState() => _CalendarbPageState();
}

class _CalendarbPageState extends State<CalendarbPage> {
//  Field

//  Method
  Widget showWebView() {
//    String url = 'http://acdserv.kmutnb.ac.th/academic-calendar';

    String url = 'https://www.androidthai.in.th';

    return Container(
      width: MediaQuery.of(context).size.width,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: showWebView(),
      ),
      appBar: AppBar(
        title: Text('ปฏิทินเพื่อ การศึกษา'),
      ),
    );
  }
}
