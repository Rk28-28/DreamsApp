import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../presenter/dreams_extra_info_presenter.dart';
import 'extra_info_view.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ExtraInfoHomePage extends StatefulWidget{
  final EXTRAINFOPresenter extraInfoPresenter;

  ExtraInfoHomePage(this.extraInfoPresenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ExtraInfoHomePageState createState() => _ExtraInfoHomePageState();
}

class _ExtraInfoHomePageState extends State<ExtraInfoHomePage> implements EXTRAINFOView {

  //late Uri _url = Uri.parse('https://flutter.dev');

  _launchURLApp() async {
    var url = Uri.parse("https://www.geeksforgeeks.org/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Extra Information'),
    // TODO: Implement behavior track home page
    ),
    body: Padding(
        padding: const EdgeInsets.all(16.0),
      child: Center (
        child: ElevatedButton (
          child: Text("Tips for Better Sleep"),
          onPressed: _launchURLApp
        )
    ),
    ),
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