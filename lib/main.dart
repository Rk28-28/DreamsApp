import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Home',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
    );
  }
}