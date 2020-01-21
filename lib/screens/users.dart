import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _UsersLister();
}

class _UsersLister extends State<UsersPage> {
  Future<List<User>> _getUsers() async {
    var data = await http
        .get('http://www.json-generator.com/api/json/get/bOpFFcoowO?indent=2');
    var jsonData = json.decode(data.body);
    List<User> users = [];
    for (var item in jsonData) {
      print(item);
      User u = User(item["fatura"], item["picture"], item["_id"], item["name"]);
      users.add(u);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[index].picture
                    ),
                  ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].fatura,style: TextStyle(color: Colors.grey),),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class User {
  final String fatura;
  final String picture;
  final String id;
  final String name;

  User(this.fatura, this.picture,this.id, this.name);
}
