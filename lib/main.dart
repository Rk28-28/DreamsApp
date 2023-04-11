import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:units/dreams_home_page.dart';
import 'dreams_login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: AuthenticationService().handleAuthState(),
    );
  }
}