import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:todo_list/entity/Task.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/util/shared_util.dart';

class TaskFunctions{


  Future<dynamic> addTask(Task task) async {
    String id ="${DateTime.timestamp().microsecondsSinceEpoch}";
    print("$TAG.id=${id}");
    task.id=id;
    print("$TAG.addTask=${Task.toMap(task)}");
    List<Task>? temp = await getTasks() ?? [];
    print("$TAG.addTask=${temp}");
    temp.add(task);
    print("$TAG.addTask=${temp.length}");
    return SharedUtil.instance.saveString("tasks", Task.encode(temp));
  }

  Future<List<Task>?>? getTasks() async {
    print("$TAG.getTasks.START");
    final String? taskString = await SharedUtil.instance.getString('tasks');
    print("$TAG.getTasks.taskString=$taskString");
    if (taskString!=null) {
      return Task.decode(taskString);
    }else{
      return null;
    }
  }

  Future<Task?>? getTaskById(String taskId) async {
    List<Task>? temp = await getTasks();
    return temp?.firstWhereOrNull((element) => element.id==taskId);
  }

  Future<dynamic>? deleteTask(String taskId) async {
    List<Task>? temp = await getTasks();
    temp?.removeWhere((element) => element.id==taskId);
    if (temp!=null) {
      return SharedUtil.instance.saveString("tasks", Task.encode(temp));
    }

    return null;
  }

  Future<dynamic> updateTask(Task task) async {
    Task? temp = await getTaskById(task.id!);
    deleteTask(task.id!);
    temp = Task.fromJson(Task.toMap(task));
    return addTask(temp);
  }

  Future<dynamic> generateListGroupedByDate() async {
    List<Task>? temp = await getTasks();

    List<dynamic> list= [];
    if (temp!=null && temp.isNotEmpty==true) {
      temp.forEach((task) {
            list.add({'title':"${task.title}","date":"${task.date}"});
          });
    }

    print("$TAG.list=$list");
    return list;
  }
}