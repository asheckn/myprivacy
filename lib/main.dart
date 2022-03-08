import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myprivacy/views/home/home.dart';
import 'package:myprivacy/views/users/subscriber_list.dart';

import 'constants/routes.dart';

void main() {
  runApp(const MyPrivacy());
}

class MyPrivacy extends StatelessWidget {
  const MyPrivacy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Privacy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber)
        )
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const Home(),
        Routes.users: (context) => const Subscribers(),

      },
    );
  }
}

