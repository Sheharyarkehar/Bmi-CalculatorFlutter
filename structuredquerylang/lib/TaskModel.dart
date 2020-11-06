import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
final String table_name="todo";
final String column_id="id";
final String column_name="name";
class TaskModel{
  final String name;
   final int id;
  TaskModel({this.name,this.id});
  Map<String,dynamic>toMap(){
    return{
      column_name:name
    };
  }
}
class TodoHelper{
  TodoHelper(){
  initDatabase();
  }
  Database db;
  Future<void>initDatabase() async{
db=await openDatabase(
  join(await getDatabasesPath(),"mydb.db"),
  onCreate: (db,version){
    return db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)");

  }
  ,version:1
);
  }
  Future<void>insertTask(TaskModel task) async{
  try{
     db.insert(table_name, task.toMap(),conflictAlgorithm:ConflictAlgorithm.replace);
     
  }
  catch(_){
 print(_);
  }
}
Future<List<TaskModel>>selectTasks() async{
  List<Map<String,dynamic>>task=await db.query(table_name);
  return List.generate(task.length,(i){
      return TaskModel(name:task[i][column_name],id:task[i][column_id]);
  
  });
  
}

}








