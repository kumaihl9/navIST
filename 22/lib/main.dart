import 'package:flutter/material.dart';
import 'package:loginuicolors/login.dart';
import 'package:loginuicolors/register.dart';
import 'package:firedart/firedart.dart';

const apiKey = 'AIzaSyAYLyHFerbSnftnP7YxXU3zDL5a0CnAsEI';
const projectId= 'navist-23f7f';

void main() async{
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
    },
  ));
}
