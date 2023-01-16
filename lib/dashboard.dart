import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main(){
  runApp(MaterialApp(
    home: MapPage(),
  ));
}

class MapPage extends StatefulWidget {

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        child: Column(
          children: [
            Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(33.521000, 73.17475),
                    zoom: 17
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
            ),),
          ],
        ),
      ),),
    );
  }
}
