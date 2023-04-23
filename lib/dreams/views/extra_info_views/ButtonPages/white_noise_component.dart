import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyWebView.dart';
import '../CloudButtonEI.dart';

class WhiteNoiseHomePage extends StatefulWidget{

  WhiteNoiseHomePage({required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WhiteNoiseHomePageState createState() => _WhiteNoiseHomePageState();
}

class _WhiteNoiseHomePageState extends State<WhiteNoiseHomePage> {
  var txt = TextEditingController();
  String _url = 'url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('White Noise'),
          backgroundColor: Colors.black
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/moonbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
            children: <Widget>[
              Container(
                  height: 600,
                  child : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: CloudButton (
                                    text: "White Noise",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=wzjWIxXBs_s';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/cloud-clipart-md.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: CloudButton (
                                    text: "Brown Noise",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=DunIRy0PPCs';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/cloud-clipart-md.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: CloudButton (
                                    text: "Ambient Music",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=SqqMS8QBPPE';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/cloud-clipart-md.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: CloudButton (
                                    text: "Rain Sounds",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=QAINEz_TFvs';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/cloud-clipart-md.png',
                                  ),
                                ),
                              ),
                            ]
                        )
                      ]
                  )
              )
            ]
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }

}
void _navigateToWebView(BuildContext context, String url) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MyWebView(url: url),
    ),
  );
}