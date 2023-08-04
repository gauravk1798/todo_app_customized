import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:todo_list/entity/Task.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/page/add_task.dart';
import 'package:todo_list/util/task_functions.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{

  late List<dynamic> _elements = [];

  var _taskDetails;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(flex: 7,child: FutureBuilder(future: _getAllTasks(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print("$TAG.snapshot=${snapshot}");
              if (snapshot.hasData && snapshot.data!=null) {
                return GroupedListView<dynamic, String>(
                  elements: _elements,
                  groupBy: (element) => element['date'],
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1['title'].compareTo(item2['title']),
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  itemBuilder: (c, element) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) {
                              return AddTask(viewMode: ViewMode.VIEW,task: Task(title: element['title'],description: element['description'],date: element['date'],priority: element['priority'],id: element['id']));
                            })).then((value) {
                              if(mounted){
                                setState(() {

                                });
                              }
                        });
                      },
                      child: Card(
                        elevation: 8.0,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: SizedBox(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: const Icon(Icons.account_circle),
                              title: Text(element['title']),
                              trailing: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator()));
            },)),
            /*Expanded(flex: 3,child: _taskDetails!=null ? Column(
              children: [
                Expanded(child: Center()),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(
                          '${_taskDetails?['title']}',
                          textAlign: TextAlign.left,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [Colors.blue, Colors.green],
                              ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                          ),
                        ))
                      ],
                    ),
                    Text(
                      '${_taskDetails?['description']}',
                      textAlign: TextAlign.left,
                      maxLines: 20,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${_taskDetails?['priority']}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )),
                Expanded(child: Center()),
              ],
            ) : Center())*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) {
              return AddTask(viewMode: ViewMode.ADD);
            }));
      },child: Icon(Icons.add,color: Theme.of(context).primaryColorLight),),
    );
  }

  Future<List<dynamic>?> _getAllTasks() async {
    return _elements = await TaskFunctions().generateListGroupedByDate();
  }

}