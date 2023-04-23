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
          if (snapshot.hasData) {
            // If user is logged in go to HomePage
            return HomePage();
          } else {
            // If user is not logged in go to login page
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
          width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sunbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column( // Column with elements in it
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox( // Padding for "Sign In" from top
                height: 100,
              ),
              Text(
                "Sign In",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'OpenSans', color: Colors.white),
              ),
              SizedBox( // Padding from image to Google sign in
                height: 490,
              ),
              Padding(
                padding: const EdgeInsets.only(left:100, right: 100),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/googlelogo.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sign In With Google",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  onPressed: () { signup(context); },

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/* Most likely not needed; Will create entries on input instead
Future<void> createDatabaseUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Get UserID for database
  final User? user = auth.currentUser;
  final uid = user?.uid;

  DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

  // Check to see if UserID is already in database
  DatabaseEvent isUserInDB = await ref.child(uid!).once();

  DatabaseEvent userSleepTimes = await ref.child(uid+ "sleep-times").once();

  if (userSleepTimes.snapshot.value == null) {
    await ref.update({
      uid: {"sleep-times": ""},
    });
  }

  // If UserID is not in database add a new entry
  if (isUserInDB.snapshot.value == null) {
    await ref.update({
      uid: {"sleep-times": "",
        "sleep-information": "",
    "Calorie-Data": "",
    "Caffeine-Consumption": "",
        "Mood-Value": "",
         "diary-entries": ""},
    });
  }
}*/

// Adapted from ms471841 on GeeksForGeeks

Future<void> signup(BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(authCredential);

    //await createDatabaseUser();
  }
}

