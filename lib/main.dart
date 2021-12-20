// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/home.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget{
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color.fromRGBO(49, 47, 100, 1),
          secondary: Color.fromRGBO(252, 92, 99, 1),          
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          barBackgroundColor: Color.fromRGBO(49, 47, 100, 1),
          textTheme: CupertinoTextThemeData(
            navTitleTextStyle: TextStyle(
              fontFamily: 'Playfair Display',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          primaryColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Righteous',
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(49, 47, 100, 1),
        ),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,

    );
  }

}