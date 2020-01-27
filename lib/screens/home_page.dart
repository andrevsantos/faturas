import 'package:faturas/screens/settings.dart';
import 'package:faturas/screens/users.dart';
import 'package:flutter/material.dart';

import 'faturas.dart';
import 'home.dart';

class MainHome extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MainHome> {
  int _selectedPage = 0;
  final _pageOptions = [HomePage(), FaturasPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'App Faturas',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
            //elevation:defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
            backgroundColor: Colors.lightBlue),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.lightBlue,
                  size: 26.0,
                ),
                title: Text(
                  '',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance,
                  color: Colors.lightBlue,
                  size: 26.0,
                ),
                title: Text(
                  '',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.lightBlue,
                  size: 26.0,
                ),
                title: Text(
                  '',
                )),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('André Vieira dos Santos'),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Shop'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('About me'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      leading: Icon(Icons.location_city),
    ),); 
  }
}
