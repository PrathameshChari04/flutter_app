import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/login_page.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.pref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          Constants.pref.getBool("loggedIn") == true ? HomePage() : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
