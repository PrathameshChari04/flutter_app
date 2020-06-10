import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var myText = "Change Name";
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/abc.jpg",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    myText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                        labelText: "Name",
                        icon: Icon(Icons.person_add),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    "https://upload.wikimedia.org/wikipedia/en/thumb/c/cb/Robert_Downey_Jr._as_Iron_Man_in_Avengers_Infinity_War.jpg/220px-Robert_Downey_Jr._as_Iron_Man_in_Avengers_Infinity_War.jpg"),
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
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }
}
