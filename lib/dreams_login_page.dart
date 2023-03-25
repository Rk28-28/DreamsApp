import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dreams_home_page.dart';

// Adapted from dbestech on YouTube
class AuthenticationService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData){ // If user is logged in go to HomePage
            return HomePage();
          }
          else { // If user is not logged in go to login page
            return LoginPage();
          }
        });
  }
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

                          onPressed: (){
                            signup(context);
                          },
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

final FirebaseAuth auth = FirebaseAuth.instance;

// Adapted from ms471841 on GeeksForGeeks

Future<void> signup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(authCredential);

    final User? user = auth.currentUser;
    final uid = user?.uid;

    DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

    DatabaseEvent event = await ref.child(uid!).once();

    if (event.snapshot.value == null) {
      await ref.update({
        uid: {
          "sleep-times": ""
        },
      });
    }
  }
}