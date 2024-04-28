import 'package:digital_wind_app/data/app_data.dart';
import 'package:digital_wind_app/pages/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dtos.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppData([]),
    child: const MaterialApp(
      home: TaskListWidget(index: 1),
    ),
  ));
}
