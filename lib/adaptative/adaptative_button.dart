// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, override_on_non_overriding_member
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  
  final String? text;
  final Function? callback;
  final double? padding;

  AdaptativeButton({this.text,  this.callback, this.padding});
  
  @override
  Widget build(BuildContext context) {
   return Platform.isIOS
    ? CupertinoButton(
      child: Text(text!), 
      padding: EdgeInsets.all(padding!),
      onPressed: () => callback!(),
    )
    : ElevatedButton(
      onPressed: () => callback!(), 
      child: Text(text!)
    );
  }


}