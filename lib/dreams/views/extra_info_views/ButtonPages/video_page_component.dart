import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyWebView.dart';
import '../VideoButton.dart';

class VideoLinksHomePage extends StatefulWidget{

  VideoLinksHomePage({required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _VideoLinksHomePageState createState() => _VideoLinksHomePageState();
}

class _VideoLinksHomePageState extends State<VideoLinksHomePage> {
  var txt = TextEditingController();
  String _url = 'url';
  @override
  Widget build(BuildContext context) {
    var agePicked;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditations'),
          backgroundColor: Colors.black
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/spaceshipbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
            children: <Widget>[
              Container(
                height: 775,
                  //decoration: BoxDecoration( color: Colors.white70),
                  child : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: VideoButton2 (
                                    text: "FOR SLEEP",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=aEqlQvczMJQ';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/meditationSleep.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: VideoButton1 (
                                    text: "FOR STRESS",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=z6X5oEIg6Ak';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/meditationStress.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center (
                                  child: VideoButton (
                                    text: "FOR MORNINGS",
                                    onPressed: () {
                                      _url = 'https://www.youtube.com/watch?v=ENYYb5vIMkU';
                                      _navigateToWebView(context, _url);
                                    },
                                    imageAsset: 'assets/meditationMorning.png',
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