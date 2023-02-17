import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:Newsreader()));
}

class Newsreader extends StatefulWidget {
  const Newsreader({Key? key}) : super(key: key);

  @override
  State<Newsreader> createState() => _NewsreaderState();
}

class _NewsreaderState extends State<Newsreader> {
  @override
  Widget build(BuildContext context) {
    return home();
  }
}


