import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams/presenter/dreams_sleep_diaryview_presenter.dart';
import 'package:units/dreams/views/sleep_diaryview_view/dreams_sleep_diaryview_view.dart';

class SleepDiaryViewHomePage extends StatefulWidget {
  final SleepDiaryViewPresenter sleepDiaryViewPresenter;

  final String title;

  SleepDiaryViewHomePage(this.sleepDiaryViewPresenter, {required Key? key, required this.title}) : super(key: key);
  @override
  _SleepDiaryViewHomePageState createState() => _SleepDiaryViewHomePageState();


}

class _SleepDiaryViewHomePageState extends State<SleepDiaryViewHomePage> implements SleepDiaryViewView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Sleep Diary View Page'),
    // TODO: Implement Sleep Diary Page home page
    ),
    body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/backgrounds/earthbg.png'),
    fit: BoxFit.cover,
    ),
    ),
      child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: TextField(

                 decoration: InputDecoration(
                   filled: true,
                   fillColor: Colors.white.withOpacity(0.3),
                   border: OutlineInputBorder(),

                 )

             )
           ),
           Padding(
               padding: const EdgeInsets.all(16.0),
               child: TextField(

                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white.withOpacity(0.3),
                     border: OutlineInputBorder(),

                   )

               )
           ),
           Padding(
               padding: const EdgeInsets.all(16.0),
               child: TextField(

                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white.withOpacity(0.3),
                     border: OutlineInputBorder(),

                   )

               )
           ),
           Padding(
               padding: const EdgeInsets.all(16.0),
               child: TextField(

                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white.withOpacity(0.3),
                     border: OutlineInputBorder(),

                   )

               )
           ),
           Padding(
               padding: const EdgeInsets.all(16.0),
               child: TextField(

                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white.withOpacity(0.3),
                     border: OutlineInputBorder(),

                   )

               )
           ),

         ],
      )
    )
    );
    // TODO: implement build
  }

}