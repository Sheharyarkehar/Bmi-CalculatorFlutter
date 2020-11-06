import 'package:flutter/material.dart';
import 'package:structuredquerylang/TaskModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller=TextEditingController();
 List<TaskModel>t=[];
 TaskModel curr;
 final TodoHelper th=TodoHelper();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TextField(controller:this.controller,decoration:InputDecoration(labelText:"Add items:",)),
                            SizedBox(height:15,),
                             FlatButton(onPressed:(){setState(() {
                               curr=TaskModel(name:this.controller.text);
                               th.insertTask(curr);
                               
                             });}, child:Text("Insert Data"),color:Colors.pink,),
                            SizedBox(height:15,),
                             FlatButton(onPressed:()async{
                               List<TaskModel>l=await th.selectTasks();
                               setState(() {
                                 t=l;
                               
                             });}, child:Text("Generate List"),color:Colors.blue,),
                             Expanded(child:ListView.separated(itemBuilder:(context,index){
                
                               return ListTile(leading:Text("${t[index].id}"),title:Text("${t[index].name}"));
                             } , separatorBuilder:(context,index)=>Divider(), itemCount:t.length),)
           
          ],
        ),
      ),
          );
  }
}
