import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter")),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blueGrey,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("user@flutter.com"),
              accountName: Text("Flutter"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/thumb/c/cb/Robert_Downey_Jr._as_Iron_Man_in_Avengers_Infinity_War.jpg/220px-Robert_Downey_Jr._as_Iron_Man_in_Avengers_Infinity_War.jpg"
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Data"),
              subtitle: Text("Subdata"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text("Email"),
              subtitle: Text("data@subdata.com"),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_alert),
      ),
    );
  }
}
