import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginuicolors/pages/homepage.dart';
import 'pages/homepage.dart';


class GotIt extends StatelessWidget {
  GotIt({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage2(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
