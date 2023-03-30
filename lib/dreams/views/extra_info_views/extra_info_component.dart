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

  openLink(String link) async {
        if (await canLaunchUrlString(link)){
          await launchUrlString(link);
        }
        else {
          throw "Could not launch $link";
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Behavior Tracker'),
    // TODO: Implement behavior track home page
    ),
    body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton (
          child: Text("Tips for Better Sleep"),
          onPressed:() {
            const url = "https://www.cdc.gov/sleep/about_sleep/sleep_hygiene.html";
            openLink(url);
          }
        )
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