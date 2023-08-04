import 'dart:convert';

class Task{
  String? id;
  String? title;
  String? description;
  String? priority;
  String? date;

  Task({this.id,this.title,this.description,this.date,this.priority});

  Task.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    description=json['description'];
    priority=json['priority'];
    date=json['date'];
  }

  static Map<String,dynamic> toMap(Task task){
    Map<String,dynamic> map = Map<String,dynamic>();
    map['id']=task.id;
    map['title']=task.title;
    map['description']=task.description;
    map['priority']=task.priority;
    map['date']=task.date;
    return map;
  }

  static String encode(List<Task> tasks) {
    return json.encode(
      tasks.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
    );
  }

  static List<Task> decode(String tasks) {
    return (json.decode(tasks) as List<dynamic>)
        .map<Task>((item) => Task.fromJson(item))
        .toList();
  }
}