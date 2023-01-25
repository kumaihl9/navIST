import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Container(
              width: 250,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Qawali Night",
                    style: TextStyle(
                        fontFamily: 'Montserrat Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("on 28/01/23",
                        style: TextStyle(fontFamily: 'Montserrat Regular')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 250,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "IST Sports Gala",
                    style: TextStyle(
                        fontFamily: 'Montserrat Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("on 13/02/23",
                        style: TextStyle(fontFamily: 'Montserrat Regular')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 250,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Live Concert",
                    style: TextStyle(
                        fontFamily: 'Montserrat Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("on 20/02/23",
                        style: TextStyle(fontFamily: 'Montserrat Regular')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 250,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Takhayyul",
                    style: TextStyle(
                        fontFamily: 'Montserrat Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("on 05/03/23",
                        style: TextStyle(fontFamily: 'Montserrat Regular')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
