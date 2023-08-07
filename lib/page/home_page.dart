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

  late List<dynamic>? _elements = [];

  var _taskDetails;

  bool _showNoElementsMessage=false;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(flex: 7,child: FutureBuilder(future: _getAllTasks(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print("$TAG.snapshot=${snapshot}");
              if (snapshot.hasData && snapshot.data!=null && _elements!=null && _elements!.length>0) {
                return GroupedListView<dynamic, String>(
                  elements: _elements!,
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
                                  if (_elements==null || _elements?.length==0) {
                                    _showNoElementsMessage=true;
                                  }else{
                                    _showNoElementsMessage=false;
                                  }
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
              }else{
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Your ToDo list is empty.',style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColorDark)),
                      ],
                    )
                );
              }

              return Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator()));

            },)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) {
              return AddTask(viewMode: ViewMode.ADD);
            })).then((value) {
          if(mounted){
            setState(() {
              if (_elements==null || _elements?.length==0) {
                _showNoElementsMessage=true;
              }else{
                _showNoElementsMessage=false;
              }
            });
          }
        });
      },child: Icon(Icons.add,color: Theme.of(context).primaryColorLight),),
    );
  }

  Future<List<dynamic>?> _getAllTasks() async {
    List<dynamic>? temp = await TaskFunctions().generateListGroupedByDate();
    print('$TAG._getAllTasks.temp=$temp');
    if (temp==null  || temp.length==0 || temp.isEmpty) {
      _showNoElementsMessage=true;
    }else{
      _showNoElementsMessage=false;
    }
    print('$TAG._getAllTasks._showNoElementsMessage=$_showNoElementsMessage');
    _elements = temp;
    return _elements;
  }

}