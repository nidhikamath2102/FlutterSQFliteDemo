import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/DatabaseHelper.dart';
import 'package:flutter_sqflite/model/User.dart';

class ViewUsers extends StatefulWidget {
  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  List<User> users = new List();

  @override
  void initState(){
    DatabaseHelper.getAllUsers().then((value) {
      setState(() {
        value.forEach((user) {
          users.add(new User.withId(id: user.id, userName: user.userName, contact: user.contact));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Users"),
      ),
      body: new Container(
          child: new ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return new ListTile(
                  title: new Text(users[i].userName),
                  subtitle: new Text(
                    users[i].contact.toString(),
                    style: new TextStyle(fontSize: 15.0),
                  ),
                );
              })),
    );
  }
}
