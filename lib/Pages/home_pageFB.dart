import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/login_page.dart';
import 'package:flutter_app/drawer.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../name_card_widget.dart';

class HomePageFB extends StatefulWidget {
  static const String routeName = "/homepageFB";
  @override
  _HomePageFBState createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  //var myText = "Change Name";
  //TextEditingController _nameController = TextEditingController();

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    return data;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Flutter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.pref.setBool("loggedIn", false);

              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            return Center(
              child: Text("Fetch Something"),
            );
            case ConnectionState.active:
            case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            case ConnectionState.done:
            if (snapshot.hasError){
              return Center(
              child: Text("Fetch Something"),
            );
                
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["title"]),
                  subtitle: Text("ID: ${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"]),
                );
              },
              itemCount: data.length,
            );
            
       
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //myText = _nameController.text;
          //setState(() {});
        },
        child: Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }
}
