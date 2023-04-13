import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyWebView.dart';
import '../CloudButtonEI.dart';

class SleepLinksHomePage extends StatefulWidget{

  SleepLinksHomePage({required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SleepLinksHomePageState createState() => _SleepLinksHomePageState();
}

class _SleepLinksHomePageState extends State<SleepLinksHomePage> {
  var txt = TextEditingController();
  String _url = 'url';
  @override
  Widget build(BuildContext context) {
    var agePicked;
    return Scaffold(
        appBar: AppBar(
          title: Text('Links'),
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
                              text: "Tips for Better Sleep",
                              onPressed: () {
                                _url = 'https://www.cdc.gov/sleep/about_sleep/sleep_hygiene.html';
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
                              text: "Health Benefits of Sleep",
                              onPressed: () {
                                _url = 'https://www.sleepfoundation.org/how-sleep-works/benefits-of-sleep';
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
                              text: "Bedtime Routine Tips",
                              onPressed: () {
                                _url = 'https://www.sleepfoundation.org/sleep-hygiene/bedtime-routine-for-adults';
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
                              text: "Not Enough Sleep Effects",
                              onPressed: () {
                                _url = 'https://www.healthline.com/health/sleep-deprivation/effects-on-body';
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