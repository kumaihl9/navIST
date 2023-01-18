import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RoomPage(),
    );
  }
}

class RoomPage extends StatefulWidget {
  const RoomPage({key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  void updateList(String value) {
    // function that will filter our list
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
              style: TextStyle(color: Colors.white),
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
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(),
            ),
            Container(
              width: double.maxFinite,
              height: 230.0,
              child: Container(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/search.png"),
                      fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }
}
