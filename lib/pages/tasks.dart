import 'package:digital_wind_app/data/app_data.dart';
import 'package:digital_wind_app/widgets/task_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dtos.dart';

class TaskListWidget extends StatefulWidget {
  final int index;

  const TaskListWidget({super.key, required this.index});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Цифровой ветер'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepOrangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        body: Container(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  print(index);
                  return TaskPreviewWidget(
                    task: tasks()[index],
                  );
                },
                itemCount: tasks().length)));
  }

  List<Task> tasks() {
    return context.watch<AppData>().tasks;
  }
}
