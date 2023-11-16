import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/data_model.dart';
import 'package:todolist/screens/home_page.dart';

List<TaskModel> filterTasksByCriteria(List<TaskModel> tasks, FilterCriteria selectedFilter, String search) {
  final now = DateTime.now();
  switch (selectedFilter) {
    case FilterCriteria.Daily:
      return tasks.where((task) {
        final taskDate = task.date;
        return taskDate.year == now.year &&
            taskDate.month == now.month &&
            taskDate.day == now.day;
      }).toList();
    case FilterCriteria.Weekly:
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final endOfWeek = startOfWeek.add(Duration(days: 6));
      return tasks.where((task) {
        final taskDate = task.date;
        return taskDate.isAfter(startOfWeek) &&
            taskDate.isBefore(endOfWeek.add(Duration(days: 1)));
      }).toList();
    case FilterCriteria.Monthly:
      final startOfMonth = DateTime(now.year, now.month, 1);
      final endOfMonth = DateTime(now.year, now.month + 1, 0);
      return tasks.where((task) {
        final taskDate = task.date;
        return taskDate.isAfter(startOfMonth) &&
            taskDate.isBefore(endOfMonth.add(Duration(days: 1)));
      }).toList();
    case FilterCriteria.All:
      return tasks;
  }
  
}
    void checkBoxchanged(bool? value, int index) async {
      final taskDb = Hive.box<TaskModel>('task_db');
      final task = taskDb.getAt(index);
      if (task != null) {
        task.tasComplete = value ?? false;
        taskDb.putAt(index, task);
      }
   
  }

  