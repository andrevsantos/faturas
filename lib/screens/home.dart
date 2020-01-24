import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Image.asset('assets/home_3.png', fit: BoxFit.cover),
            ListTile(
              leading: Icon(Icons.card_travel),
              title: Text('Ut pulvinar nec lacus id tempus'),
              subtitle: Text('cras varius eros risus',style: TextStyle(color: Colors.grey),),
              trailing: Icon(Icons.more_vert),
            ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('In porta, eros vel ultrices'),
            subtitle: Text(' sapien efficitur lectus',style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.more_vert),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nullam velit ante'),
            subtitle: Text('aliquet non velit porta',style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.more_vert),
          ),
          ListTile(
            leading: Icon(Icons.airport_shuttle),
            title: Text('In non blandit tellus'),
            subtitle: Text('suspendisse in urna lacus',style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
