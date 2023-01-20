import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginuicolors/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowPage(),
    );
  }
}

class ShowPage extends StatefulWidget {
  const ShowPage({key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  void updateList(String value) {
    // function that will filter our list
  }
  String roomFind = '';
  String Find = '';
  String userPost = '';

  final _textController = TextEditingController();
  _getdata() async {
    final response = await http.get(Uri.parse("$URL/findroom"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search Room Number",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  Find = text;
                });
              },
              controller: _textController,
              style: TextStyle(color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 146, 197, 239),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "eg: 6111",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () async {
                  final response =
                      await http.get(Uri.parse("$URL/findroom?room_no=${Find}"));
                  final decode = json.decode(response.body);
                  setState(() {
                    _getdata();
                    roomFind = decode["result"];
                  });
                },
                color: Color.fromARGB(255, 146, 197, 239),
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(),
            ),
            Container(
              child: Center(
                child: Text(
                  roomFind,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                height: 230.0,
                child: Container(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/search.png"),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
