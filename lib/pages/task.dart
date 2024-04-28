import 'package:digital_wind_app/data/app_data.dart';
import 'package:digital_wind_app/pages/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../dtos.dart';

class TaskWidget extends StatefulWidget {
  final Task task;

  TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    String initialVideoId = YoutubePlayer.convertUrlToId(widget.task.url) ?? '';
    controller = YoutubePlayerController(
      initialVideoId: initialVideoId,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Цифровой ветер'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepOrangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.task.title),
              YoutubePlayer(controller: controller),
              Text(widget.task.description)
            ],
          ),
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                navigateBack();
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                });
              },
              child: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ));
  }

  void navigateBack() {
    widget.task.competed = true; // Устанавливаем флаг completed в true
    List<Task> tasks = Provider.of<AppData>(context, listen: false).tasks;
    int currentIndex =
        tasks.indexWhere((task) => task.index == widget.task.index);
    if (currentIndex < tasks.length - 1) {
      Task nextTask = tasks[currentIndex + 1];
      nextTask.started = true;
      Provider.of<AppData>(context, listen: false)
          .updateTasks(nextTask.index, nextTask); // Обновляем следующую задачу
    }
    Provider.of<AppData>(context, listen: false).updateTasks(
        widget.task.index, widget.task); // Обновляем текущую задачу
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TaskListWidget(index: 1),));
  }
}
