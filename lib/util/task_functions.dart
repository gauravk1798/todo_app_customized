import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:todo_list/entity/Task.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/util/shared_util.dart';

class TaskFunctions{


  Future<dynamic> addTask(Task task) async {
    String id ="${DateTime.timestamp().millisecond}";
    print("$TAG.id=${id}");
    task.id=id;
    print("$TAG.addTask=${Task.toMap(task)}");
    List<Task> temp = await getTasks();
    temp.add(task);
    return SharedUtil.instance.saveString("tasks", Task.encode(temp));
  }

  Future<List<Task>> getTasks() async {
    final String taskString = await SharedUtil.instance.getString('tasks');
    return Task.decode(taskString);
  }

  Future<Task?> getTaskById(String taskId) async {
    List<Task> temp = await getTasks();
    return temp.firstWhereOrNull((element) => element.id==taskId);
  }

  Future<dynamic> deleteTask(String taskId) async {
    List<Task> temp = await getTasks();
    temp.removeWhere((element) => element.id==taskId);
    return SharedUtil.instance.saveString("tasks", Task.encode(temp));
  }

  Future<dynamic> updateTask(Task task) async {
    Task? temp = await getTaskById(task.id!);
    deleteTask(task.id!);
    temp = Task.fromJson(Task.toMap(task));
    return addTask(temp);
  }
}