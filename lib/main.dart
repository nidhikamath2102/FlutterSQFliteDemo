import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/DatabaseHelper.dart';
import 'package:flutter_sqflite/model/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userName = "";
  String contact = "";

  void addUser(){
    setState((){
      Future<void> user = DatabaseHelper.insertUser(User(userName: userName, contact: int.parse(contact)));
      DatabaseHelper.getAllUsers().then((value) => print("user returned is " + value.toString()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "SqFlite App",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("SQFlite App"),
        ),
        body: new Container(
            margin: EdgeInsets.all(15.0),
            child: new Column(
              children: [
                new TextField(
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                      hintText: "Enter User Name"),
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: (text){
                    userName = text;
                    print("contact" +  userName.toString());
                  },
                ),
                new TextField(
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                        hintText: "Enter Contact Number"),
                    keyboardType: TextInputType.number,
                  onChanged: (text){
                      contact = text;
                      print("contact" +  contact.toString());
                  },
                ),
                new SizedBox(
                  height: 40.0,
                ),
                new RaisedButton(
                  child: new Text("Add",
                    style: new TextStyle(fontSize: 20.0),),
                  onPressed: addUser,
                )
              ],
            )),
      ),
    );
  }
}

