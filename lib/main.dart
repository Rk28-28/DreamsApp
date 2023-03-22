import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage()); // Change this to HomePage to get to home page for now
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Sweet Dreams"),
          ),
          body: Center(
            child: Card(
              margin: EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
              elevation: 20,

              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[200], // Color of card

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: MaterialButton(
                        color: Colors.teal[200],
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container( // Container for Google image
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                      AssetImage('assets/googlelogo.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),

                            SizedBox( // Used for padding
                              width: 20,
                            ),

                            Text( // Sign up text
                                "Sign in with Google"
                            )
                          ],
                        ),

                        onPressed: signup,
                      ),
                    ),
                  ],
                ),
              )
              ),
            ),
          ),
        ),
      );
  }
}

void signup(){

}