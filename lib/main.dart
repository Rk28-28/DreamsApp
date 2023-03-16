import 'package:flutter/material.dart';

import 'dreams/views/dreams_component.dart';
import 'dreams/presenter/dreams_presenter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Sweet Dreams"),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text("Welcome to the sweet dreams app!",style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent), textScaleFactor: 2.6, textAlign: TextAlign.center,)
                  ,),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Sleep Calculator'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return SplashScreen();
                            }));
                          },
                        ),
                    ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Track Sleep'),
                          onPressed: () {
                            // Route here
                          },
                        )
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Track Sleep'),
                          onPressed: () {
                              // Route here
                          },
                        )
                    )
                ),
              ],
            )
          ),
        )
      )
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new HomePage(new BasicPresenter(), title: 'Sweet Dreams', key: Key("UNITS"),);
  }
}
