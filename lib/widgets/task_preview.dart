import 'package:digital_wind_app/pages/task.dart';
import 'package:flutter/material.dart';

import '../dtos.dart';

class TaskPreviewWidget extends StatefulWidget {
  Task task;

  TaskPreviewWidget({required this.task});

  @override
  State<TaskPreviewWidget> createState() => _TaskPreviewWidgetState();
}

class _TaskPreviewWidgetState extends State<TaskPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: TextButton(
          onPressed: () {
            openTask();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.task.title),
              if (widget.task.started)
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/previews/${widget.task.index}.png'),
                        fit: BoxFit.cover),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 4 * 3,
                )
              else
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xC7C5C5FF), Colors.black45],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 4 * 3,
                  child: Icon(
                    Icons.block,
                    color: Colors.white,
                  ),
                )
            ],
          ),
        ));
  }

  void openTask() {
    if (widget.task.started) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => TaskWidget(task: widget.task)));
    }
  }
}
