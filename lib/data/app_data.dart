import 'package:flutter/cupertino.dart';

import '../dtos.dart';

class AppData with ChangeNotifier {
  List<Task> tasks;


  AppData(this.tasks) {
    tasks.insert(0, Task(
        0,
        'Благородное дело',
        'В этой серии вы узнаете, как правильно хранить деньги',
        'https://www.youtube.com/watch?v=1yPm1j2Q5q4&list=PLeVA7eICJ6d2C8ExAG2XR4W6LFPYzSlXY&index=1',
        true,
        false));
    tasks.insert(1, Task(
        1,
        'Райский остров',
        'В этой серии вы узнаете, что такое инвестирование',
        'https://www.youtube.com/watch?v=rmAm5P80asU&list=PLeVA7eICJ6d2C8ExAG2XR4W6LFPYzSlXY&index=2',
        false,
        false));
    tasks.insert(2, Task(
        2,
        'Золушка',
        'В этой серии вы узнаете про кредиты',
        'https://www.youtube.com/watch?v=I2K0UT18cco&list=PLeVA7eICJ6d2C8ExAG2XR4W6LFPYzSlXY&index=1',
        false,
        false));
    tasks.insert(3, Task(
        3,
        'Золтое яблоко',
        'В этой серии вы узнаете об экономии',
        'https://www.youtube.com/watch?v=_nShANCaJgU&list=PLeVA7eICJ6d2C8ExAG2XR4W6LFPYzSlXY&index=4',
        false,
        false));
    tasks.insert(4, Task(
        4,
        'Кактус в мешке',
        'В этой серии вы узнаете, что такое СКАМ',
        'https://www.youtube.com/watch?v=PYaybBhE5E4&list=PLeVA7eICJ6d2C8ExAG2XR4W6LFPYzSlXY&index=5',
        false,
        false));

  }

  void updateTasks(int index, Task task) {
    tasks.replaceRange(index, index + 1, [task]);
    notifyListeners();
  }
}
