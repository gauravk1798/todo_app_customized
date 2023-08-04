import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/util/keys.dart';

class SharedUtil{

  factory SharedUtil() => _getInstance();

  static SharedUtil get instance => _getInstance();
  static SharedUtil _instance  = new SharedUtil._internal();


  SharedUtil._internal() {
    //初始化
  }

  static SharedUtil _getInstance() {
    return _instance;
  }


  Future<dynamic> saveString (String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("$TAG.saveString.prefs=${prefs}");
    return await prefs.setString(key, value);
  }

  Future saveInt (String key, int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future saveDouble (String key, double value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future saveBoolean (String key, bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key,value);
  }

  Future saveStringList (String key, List<String> list) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key,list);
  }


  Future<bool> readAndSaveList(String key, String data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strings = prefs.getStringList(key) ?? [];
    if(strings.length >= 10) return false;
    strings.add(data);
    await prefs.setStringList(key, strings);
    return true;
  }

  void readAndRemoveList(String key,int index) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strings = prefs.getStringList(key) ?? [];
    strings.removeAt(index);
    await prefs.setStringList(key, strings);
  }


  //-----------------------------------------------------get----------------------------------------------------


  Future<String?>? getString (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("$TAG.getTasks.prefs=$prefs");
    return Future.value(prefs.getString(key) ?? null);
  }

  Future<int?>? getInt (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getInt(key));
  }

  Future<double?>? getDouble (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getDouble(key));
  }

  Future<List<String?>?>? getStringList(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getStringList(key));
  }

}