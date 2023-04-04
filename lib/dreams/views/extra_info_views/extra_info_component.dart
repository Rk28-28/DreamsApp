import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../presenter/dreams_extra_info_presenter.dart';
import 'extra_info_view.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyWebView.dart';
import 'CloudButtonEI.dart';

class ExtraInfoHomePage extends StatefulWidget{
  final EXTRAINFOPresenter extraInfoPresenter;

  ExtraInfoHomePage(this.extraInfoPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ExtraInfoHomePageState createState() => _ExtraInfoHomePageState();
}

class _ExtraInfoHomePageState extends State<ExtraInfoHomePage> implements EXTRAINFOView {

  String _url = 'url';
  @override
  Widget build(BuildContext context) {
    var agePicked;
    return Scaffold(
        appBar: AppBar(
        title: Text('Extra Information'),

    ),
    body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sunset_extra_infro.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
      children: <Widget>[
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: Text('Enter your age to see your recommended amount of sleep:',
                style: TextStyle(fontSize: 18.0))
            ),

            DropdownButton<int>(
              value: agePicked,
              items: <int>[0, 1, 3].map((int value){
                return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
              );
              }).toList(),
              onChanged: (newValue) async {
                setState(() {
                  agePicked = newValue;
                });
              })
          ],
        ),
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
                    text: "Nighttime Routine Tips",
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
                    text: "General Sleep Data",
                    onPressed: () {
                      _url = 'https://www.cdc.gov/sleep/data_statistics.html';
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
    );
  }


  @override
  void initState() {
    super.initState();
    this.widget.extraInfoPresenter.extraInfoView = this;
  }

  set extraInfoView(EXTRAINFOView value) {
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
