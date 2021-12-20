// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/change_task.dart';



class ListTask extends StatelessWidget{
  
  final List<Task> _listTask; 
  final Function _handleSwitchChange;
  final bool _isPortrait;
  final Function _removeItem;
  final Function _changeTask;

  //final Widget _description = ChangeTask(index);

  ListTask(this._listTask, this._handleSwitchChange, this._isPortrait, this._removeItem, this._changeTask);

  @override
  Widget build(BuildContext context) {
    final int _maxLength = _isPortrait ? 80 : 180;

    _handleLongPress(String title, String description){
      showDialog(context: context, builder: (_){
        return Platform.isIOS 
          ? CupertinoAlertDialog(
            title: Text(title),
            content: Text(description),)
          : SimpleDialog(
            title: Text(title),
            children: <Widget>[Padding(
              padding: const EdgeInsets.all(10),
              child: Text(description),
            )],
          );
      });
    }

    _change(int index, Function _changeTask, Task task){
      showDialog(context: context, builder: (_){
        return ChangeTask(index, _changeTask, task);
      });
    }

   

    return Material(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(
                _listTask[index].title, 
                style:_listTask[index].finished ? TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
              ),
              subtitle: _listTask[index].finished 
                ? null 
                : Text(_listTask[index].description.length > _maxLength 
                  ?'${_listTask[index].description.substring(0, _maxLength)}...'
                  : _listTask[index].description,
                ),
              leading: Switch.adaptive(
                value: _listTask[index].finished, 
                onChanged: (value) => _handleSwitchChange(index, value),
              ),
              onLongPress: () => _handleLongPress(
                _listTask[index].title, 
                _listTask[index].description
              ),
              
              onTap: () => _change(index,_changeTask, _listTask[index]),

              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red,), 
                onPressed: () => _removeItem(index),
              ),
            );
          },
          itemCount: _listTask.length,
          separatorBuilder: (_, index) => Divider(),
    
      ),
    );
  }

}