import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

class UsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _UsersLister();
}


RandomColor _randomColor = RandomColor();
var _refreshKey = GlobalKey<RefreshIndicatorState>();

 class _UsersLister extends State<UsersPage> {
  static Future<List<User>> _getUsers() async {
    _refreshKey.currentState?.show();
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
        body: RefreshIndicator(
      key: _refreshKey,
      onRefresh: _getUsers,
      child: Container(
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
                    leading: InkWell(
                      onLongPress: () => print("image clicked"),
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        child: Text(
                          snapshot.data[index].name[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(
                      snapshot.data[index].fatura,
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    ));
  }
}

class User {
  final String fatura;
  final String picture;
  final String id;
  final String name;

  User(this.fatura, this.picture, this.id, this.name);
}
