// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../adaptative/adaptative_button.dart';


class ChangeTask extends StatelessWidget {

  final int index;
  final Function _changeTask;
  final Task _listTask;

  //static final _titleController = TextEditingController();
  static final _descriptionController = TextEditingController();

  ChangeTask(this.index,this._changeTask, this._listTask);


  /*final Widget _title = Platform.isIOS 
    ? CupertinoTextField(
      placeholder: 'Titulo',
      controller: _titleController,
      ) 
    : TextField(
      decoration: InputDecoration(labelText: 'Título'),
      controller: _titleController,
    );*/

  final Widget _description = Platform.isIOS 
    ? CupertinoTextField(
      placeholder: 'Nova Descrição',
      controller: _descriptionController,
      minLines: 5,
      maxLines: 10,
    )
    : TextField(
      decoration: InputDecoration(labelText: 'Nova Descrição'),
      controller: _descriptionController,
      minLines: 5,
      maxLines: 10,
    );

   @override
  Widget build(BuildContext context) {
    void _handleChange() {
         String text = _descriptionController.text;
        _changeTask(text, index);
        _descriptionController.clear();
        Navigator.of(context).pop();
    }

    return Platform.isIOS 
      ? CupertinoAlertDialog(
        title: Text('Alterar ${_listTask.title}'),
        content: Column(
          children: <Widget>[
            //_title,
            _description,
          ],
        ),
        actions: <Widget>[CupertinoDialogAction(
          child: Text('Salvar'),
          onPressed: _handleChange,
        )],
        )
      : AlertDialog(
        title: Text('Alterar ${_listTask.title}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //_title,
            _description,
          ],
        ),
        actions: <Widget>[
          AdaptativeButton(
            text: 'Salvar', 
            callback: _handleChange,
          ),
        ],
      );
  }

}