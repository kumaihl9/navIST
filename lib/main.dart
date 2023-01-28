import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loginuicolors/login.dart';
import 'package:loginuicolors/register.dart';
import 'package:loginuicolors/nav.dart';
import 'package:firedart/firedart.dart';
const URL = 'http://172.20.10.4:5000';
const apiKey = 'AIzaSyAYLyHFerbSnftnP7YxXU3zDL5a0CnAsEI';
const projectId= 'navist-23f7f';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  FirebaseAuth.initialize(apiKey, VolatileStore());
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(
    projectId,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => HomePage(),
    },
  ));
}
