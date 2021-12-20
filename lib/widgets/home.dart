// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


import '../adaptative/adaptative_button.dart';
import '../models/task.dart';
import './list_task.dart';
import './new_task_dialog.dart';

/*DESAFIO - Saber qual localizacao do Aparelho pelo withLocale */

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget{
  @override  
  State<StatefulWidget> createState(){
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<Task>_listTask  = [
    Task('Compras', 'Ir ao supermercado e comprar mantimentos', false),
    Task('Outra Tarefa 1', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 2', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 3', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 4', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 5', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 6', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 7', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 8', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 9', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task(
        'Mecânico',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices purus a eros eleifend, ac viverra magna iaculis. Maecenas a lorem est. Cras vitae ornare metus, ac ornare diam. Sed tristique rhoncus iaculis. Quisque id condimentum augue. Proin ullamcorper interdum facilisis. Sed tempus quis sapien id laoreet. Aliquam auctor ex non magna ultricies consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi consequat convallis urna, a luctus arcu eleifend vestibulum. Mauris et varius lorem.',
        false),
  ];

  void _handleSwitchChange(int index, bool value){
    setState(() {
      _listTask[index].finished = value;
    });
  }

  void _saveTask(Task task) {
    setState(() {
      _listTask.add(task);
    });
  }

  void _changeTask(String _description, int index){
    setState(() {
      _listTask[index].description = _description;
      //_listTask.removeAt(index);
      //_saveTask(_listTask[index]);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _listTask.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    final _mediaQuery = MediaQuery.of(context);
    final _isPortrait = _mediaQuery.orientation == Orientation.portrait;
    final _landscapeHeight = _mediaQuery.size.height * 0.15;
    final _portraitHeight = _mediaQuery.size.height * 0.2;

    final _appBarHeight = _isPortrait ? _portraitHeight : _landscapeHeight;

    _handleAddPress(){
      showDialog(context: context, builder: (_){
        return NewTaskDialog(_saveTask);
      });
    }

    return Platform.isIOS ? CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Task App'),
        trailing: AdaptativeButton(text: 'Adicionar', callback: _handleAddPress, padding: 0.0 ),
        /*trailing: CupertinoButton (
          child: Text('Adicionar'), 
          onPressed:_handleAddPress,
          padding: EdgeInsets.all(0),
          ),*/
        ),
        child: ListTask(_listTask, _handleSwitchChange, _isPortrait, _removeItem, _changeTask),
    )
    : Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Task App', 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      ],
                  ),
                 

                  Row(
                    children: <Widget>[
                      Text(
                        DateFormat.yMMMMEEEEd('pt_BR').format(DateTime.now()), 
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(_appBarHeight),
          ),
          /*centerTitle: true, //Add a mais */
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add), 
              onPressed: _handleAddPress,
              ),
          ],
          flexibleSpace: Image(
            image: AssetImage('assets/images/task.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _handleAddPress, 
          child: Icon(Icons.add),),
        body: ListTask(_listTask, _handleSwitchChange, _isPortrait, _removeItem, _changeTask),
    );
  }
}