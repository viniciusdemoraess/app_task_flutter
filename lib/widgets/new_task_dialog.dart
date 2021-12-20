// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../adaptative/adaptative_button.dart';

import '../models/task.dart';

class NewTaskDialog extends StatelessWidget {

  final Function _saveTask;

  NewTaskDialog(this._saveTask);

  static final _titleController = TextEditingController();
  static final _descriptionController = TextEditingController();


  final Widget _title = Platform.isIOS 
    ? CupertinoTextField(
      placeholder: 'Título',
      controller: _titleController,
      ) 
    : TextField(
      decoration: InputDecoration(labelText: 'Título'),
      controller: _titleController,
    );

  final Widget _description = Platform.isIOS 
    ? CupertinoTextField(
      placeholder: 'Descrição',
      controller: _descriptionController,
      minLines: 5,
      maxLines: 10,
    )
    : TextField(
      decoration: InputDecoration(labelText: 'Descrição'),
      controller: _descriptionController,
      minLines: 5,
      maxLines: 10,
    );

   @override
  Widget build(BuildContext context) {
    void _handleSave() {
      final Task task = Task(
        _titleController.text,
        _descriptionController.text,
        false
        );
        _titleController.clear();
        _descriptionController.clear();
        _saveTask(task);
        Navigator.of(context).pop();
    }

    return Platform.isIOS 
      ? CupertinoAlertDialog(
        title: Text('Adicionar Tarefa'),
        content: Column(
          children: <Widget>[
            _title,
            _description,
          ],
        ),
        actions: <Widget>[CupertinoDialogAction(
          child: Text('Salvar'),
          onPressed: _handleSave,
        )],
        )
      : AlertDialog(
        title: Text('Adicionar Tarefa'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _title,
            _description,
          ],
        ),
        actions: <Widget>[
          AdaptativeButton(
            text: 'Salvar', 
            callback: _handleSave,
          ),
         /* ElevatedButton(
            onPressed: _handleSave, 
            child: Text('Salvar')),*/
        ],
      );
  }

}