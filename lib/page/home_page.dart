import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/util/task_functions.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{

  late List<dynamic> _elements = [];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grouped List View Example'),
        ),
        body: Center(
          child: FutureBuilder(future: _getAllTasks(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                            return Card(
                              elevation: 8.0,
                              margin:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                              child: SizedBox(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  leading: const Icon(Icons.account_circle),
                                  title: Text(element['title']),
                                  trailing: const Icon(Icons.arrow_forward),
                                ),
                              ),
                            );
                          },
                        );
            }

            return Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator()));
          },),
        ),
      ),
    );
  }

  Future<List<dynamic>?> _getAllTasks() async {
    return _elements = await TaskFunctions().generateListGroupedByDate();
  }

}