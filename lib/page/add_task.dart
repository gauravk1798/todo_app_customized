import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_list/entity/Task.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/util/task_functions.dart';
import 'package:todo_list/util/utils.dart';

class AddTask extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _AddTaskState();
  }

}

class _AddTaskState extends State<AddTask> {

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  String? _taskTitle;

  String? _dropDownSelectedPriority;

  var ddlItemStyle=TextStyle(color: Colors.black,fontSize: 14);

  var _dropDownPriorityList=['High','Normal','Low'];

  var _taskDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.90,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    initialValue: _taskTitle,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val){
                      _taskTitle=val;
                    },
                  ),
                  TextFormField(
                    initialValue: _taskDescription,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val){
                      _taskDescription=val;
                    },
                    maxLines: 10,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Priority',textAlign: TextAlign.center,),flex: 3),
                      Expanded(child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          isExpanded: true,
                          value: _dropDownSelectedPriority,
                          items: _dropDownPriorityList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            if(mounted){
                              setState(() {
                                _dropDownSelectedPriority=value;
                              });
                            }
                          }
                      ),flex: 7),
                    ],
                  ),
                  SizedBox(
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: _selectedDate.toString()), // Display selected date
                      onTap: () {
                        _openDatePickerDialog(context);
                      },
                      decoration: InputDecoration(
                        hintText: 'Date',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            _openDatePickerDialog(context);
                          },
                        ),
                      ),
                    )
                  ),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        onPressed: (){
                          TaskFunctions().addTask(Task(title: _taskTitle,description: _taskDescription,priority: _dropDownSelectedPriority,date: _selectedDate)).then((value) {
                            print("$TAG.value=${value}");
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: Text('Add Task'),
                        ),
                      )),
                      SizedBox(width: 20),
                      Expanded(child: ElevatedButton(
                          style:ElevatedButton.styleFrom(foregroundColor: Colors.black,backgroundColor:Colors.white),
                        onPressed: (){},
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: Text('Cancel'),
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openDatePickerDialog(BuildContext context) async {
    String? temp;
    DateTimeRange selectedDateRange;

    if (_selectedDate=="") {
      selectedDateRange = DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(Duration(days: 7)),
          );
    }else{
      selectedDateRange = DateTimeRange(start: Utils().parseDateTime(_selectedDate), end: Utils().parseDateTime(_selectedDate));
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 0.90,
            width:  MediaQuery.of(context).size.width * 0.90,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.single,
              initialDisplayDate: DateTime.now(),
              initialSelectedDate: _selectedDate!="" ? Utils().parseDateTime(_selectedDate) : null,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
                  // ignore: lines_longer_than_80_chars
                      ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
                } else if (args.value is DateTime) {
                  var dateTimeFormat = DateFormat('dd/MM/yyyy').format(args.value);
                  temp = dateTimeFormat;
                } else if (args.value is List<DateTime>) {
                  _dateCount = args.value.length.toString();
                } else {
                  _rangeCount = args.value.length.toString();
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if(mounted){
                  setState(() {
                    if (temp!=null && temp!="") {
                      _selectedDate = temp!;
                    }
                  });
                }
                print("$TAG._selectedDate=$_selectedDate");
                Navigator.of(context).pop();
              },
              child: Text('Select'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

}