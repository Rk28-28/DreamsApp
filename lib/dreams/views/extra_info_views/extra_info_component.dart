import 'package:flutter/material.dart';
import '../../presenter/dreams_extra_info_presenter.dart';
import 'ButtonPages/sleep_amount_component.dart';
import 'ButtonPages/sleep_links_component.dart';
import 'ButtonPages/video_page_component.dart';
import 'ButtonPages/white_noise_component.dart';
import 'MoonButton.dart';
import 'extra_info_view.dart';

class ExtraInfoHomePage extends StatefulWidget{
  final EXTRAINFOPresenter extraInfoPresenter;

  ExtraInfoHomePage(this.extraInfoPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ExtraInfoHomePageState createState() => _ExtraInfoHomePageState();
}

class _ExtraInfoHomePageState extends State<ExtraInfoHomePage> implements EXTRAINFOView {
  var txt = TextEditingController();
  List<DropdownMenuItem<String>> ageRanges = [
    DropdownMenuItem(child: Text("1-2 years"), value: "1-2 years"),
    DropdownMenuItem(child: Text("3-5 years"), value: "3-5 years"),
    DropdownMenuItem(child: Text("6-12 years"), value: "6-12 years"),
    DropdownMenuItem(child: Text("13-18 years"), value: "13-18 years"),
    DropdownMenuItem(child: Text("18-60 years"), value: "18-60 years"),
    DropdownMenuItem(child: Text("61-64 years"), value: "61-64 years"),
    DropdownMenuItem(child: Text("65+ years"), value: "65+ years"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
        title: Text('Extra Information'),

    ),
    body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/blueplanetbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
      children: <Widget>[
        Container(
          height: 650,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(
                  height: 150,
                  width: 150,
                child: MoonButton (
                    text: "Recommended Sleep, Calories,   & Caffeine",
                  onPressed: () { // Navigator to Extra Info screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return SleepAmountScreen();
                    }));
                  },
                    imageAsset: 'assets/moon.png',
                ),
              ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(
                  height: 150,
                  width: 150,
                child: MoonButton (
                    text: "Extra Reading",
                  onPressed: () { // Navigator to Extra Info screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return SleepLinksScreen();
                    }));
                  },
                  imageAsset: 'assets/moon.png',
                ),
              ),
                SizedBox(
                  height: 150,
                  width: 150,
                child: MoonButton (
                    text: "Meditations",
                  onPressed: () { // Navigator to Extra Info screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return VideoLinksScreen();
                    }));
                  },
                  imageAsset: 'assets/moon.png',
                ),
              ),
          ]
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center (
                child: SizedBox(
                  height: 150,
                  width: 150,
                child: MoonButton (
                    text: "White Noise",
                  onPressed: () { // Navigator to Extra Info screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return WhiteNoiseScreen();
                    }));
                  },
                  imageAsset: 'assets/moon.png',
                ),
              ),
              ),
            ),
          ]
        )
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


class SleepLinksScreen extends StatefulWidget {
  @override
  _SleepLinksScreen createState() => _SleepLinksScreen();
}

class _SleepLinksScreen extends State<SleepLinksScreen> {
  @override
  Widget build(BuildContext context) {
    return new SleepLinksHomePage( title: 'Sleep Links', key: Key("SleepLinks"),);
  }
}

class SleepAmountScreen extends StatefulWidget {
  @override
  _SleepAmountScreen createState() => _SleepAmountScreen();
}

class _SleepAmountScreen extends State<SleepAmountScreen> {
  @override
  Widget build(BuildContext context) {
    return new SleepAmountHomePage( title: 'Sleep Amount', key: Key("SleepAmount"),);
  }
}


class VideoLinksScreen extends StatefulWidget {
  @override
  _VideoLinksScreen createState() => _VideoLinksScreen();
}

class _VideoLinksScreen extends State<VideoLinksScreen> {
  @override
  Widget build(BuildContext context) {
    return new VideoLinksHomePage( title: 'Video Links', key: Key("VideoLinks"),);
  }
}


class WhiteNoiseScreen extends StatefulWidget {
  @override
  _WhiteNoiseScreen createState() => _WhiteNoiseScreen();
}

class _WhiteNoiseScreen extends State<WhiteNoiseScreen> {
  @override
  Widget build(BuildContext context) {
    return new WhiteNoiseHomePage( title: 'White Noise', key: Key("WhiteNoise"),);
  }
}




