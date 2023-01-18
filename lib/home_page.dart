import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:loginuicolors/apis.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<dynamic> Locations = [];
  List<dynamic> Destinations = [];
  List<dynamic> State = [];

  String? locationsid;
  String? stateid;
  final apiHandler = ApiManager();
  //dummy api call
  getCities() async {

    // make request
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    // sample info available in response
    final statusCode = response.statusCode;
    final headers = response.headers;
    final contentType = headers['content-type'];
    final json = response.body;

    // TODO convert json to object...

   return response;
  }

  @override
  void initState() {
    super.initState();
    this.Locations.add({"id": 1, "name": "Raza Block"});
    this.Locations.add({"id": 2, "name": "Block 2"});
    this.Locations.add({"id": 3, "name": "Block 3"});
    this.Locations.add({"id": 4, "name": "Block 4"});
    this.Locations.add({"id": 5, "name": "Block 5"});
    this.Locations.add({"id": 6, "name": "Block 6"});
    this.Locations.add({"id": 7, "name": "Block 7"});
    this.Locations.add({"id": 8, "name": "Mess"});
    this.Locations.add({"id": 9, "name": "Library"});
    this.Locations.add({"id": 10, "name": "Cafe"});
    this.Locations.add({"id": 11, "name": "Boys Hostel"});
    this.Locations.add({"id": 12, "name": "Girls Hostel"});
    this.Locations.add({"id": 13, "name": "Game Room"});
    this.Locations.add({"id": 14, "name": "BasketBall Court"});


    this.Destinations = [
      {"val": 1, "Name": "Block 2", "ParentID": 1},
      {"val": 2, "Name": "Block 3", "ParentID": 1},
      {"val": 3, "Name": "Block 4", "ParentID": 1},
      {"val": 4, "Name": "Block 5", "ParentID": 1},
      {"val": 5, "Name": "Block 6", "ParentID": 1},
      {"val": 6, "Name": "Block 7", "ParentID": 1},
      {"val": 7, "Name": "Mess", "ParentID": 1},
      {"val": 8, "Name": "Library", "ParentID": 1},
      {"val": 9, "Name": "Cafe", "ParentID": 1},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 1},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 1},
      {"val": 12, "Name": "Game Room", "ParentID": 1},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 1},


      {"val": 1, "Name": "Raza Block", "ParentID": 2},
      {"val": 2, "Name": "Block 3", "ParentID": 2},
      {"val": 3, "Name": "Block 4", "ParentID": 2},
      {"val": 4, "Name": "Block 5", "ParentID": 2},
      {"val": 5, "Name": "Block 6", "ParentID": 2},
      {"val": 6, "Name": "Block 7", "ParentID": 2},
      {"val": 7, "Name": "Mess", "ParentID": 2},
      {"val": 8, "Name": "Library", "ParentID": 2},
      {"val": 9, "Name": "Cafe", "ParentID": 2},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 2},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 2},
      {"val": 12, "Name": "Game Room", "ParentID": 2},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 2},

      {"val": 1, "Name": "Raza Block", "ParentID": 3},
      {"val": 2, "Name": "Block 2", "ParentID": 3},
      {"val": 3, "Name": "Block 4", "ParentID": 3},
      {"val": 4, "Name": "Block 5", "ParentID": 3},
      {"val": 5, "Name": "Block 6", "ParentID": 3},
      {"val": 6, "Name": "Block 7", "ParentID": 3},
      {"val": 7, "Name": "Mess", "ParentID": 3},
      {"val": 8, "Name": "Library", "ParentID": 3},
      {"val": 9, "Name": "Cafe", "ParentID": 3},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 3},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 3},
      {"val": 12, "Name": "Game Room", "ParentID": 3},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 3},


      {"val": 1, "Name": "Raza Block", "ParentID": 4},
      {"val": 2, "Name": "Block 2", "ParentID": 4},
      {"val": 3, "Name": "Block 3", "ParentID": 4},
      {"val": 4, "Name": "Block 5", "ParentID": 4},
      {"val": 5, "Name": "Block 6", "ParentID": 4},
      {"val": 6, "Name": "Block 7", "ParentID": 4},
      {"val": 7, "Name": "Mess", "ParentID": 4},
      {"val": 8, "Name": "Library", "ParentID": 4},
      {"val": 9, "Name": "Cafe", "ParentID": 4},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 4},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 4},
      {"val": 12, "Name": "Game Room", "ParentID": 4},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 4},

      {"val": 1, "Name": "Raza Block", "ParentID": 5},
      {"val": 2, "Name": "Block 2", "ParentID": 5},
      {"val": 3, "Name": "Block 3", "ParentID": 5},
      {"val": 4, "Name": "Block 4", "ParentID": 5},
      {"val": 5, "Name": "Block 6", "ParentID": 5},
      {"val": 6, "Name": "Block 7", "ParentID": 5},
      {"val": 7, "Name": "Mess", "ParentID": 5},
      {"val": 8, "Name": "Library", "ParentID": 5},
      {"val": 9, "Name": "Cafe", "ParentID": 5},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 5},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 5},
      {"val": 12, "Name": "Game Room", "ParentID": 5},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 5},

      {"val": 1, "Name": "Raza Block", "ParentID": 6},
      {"val": 2, "Name": "Block 2", "ParentID": 6},
      {"val": 3, "Name": "Block 3", "ParentID": 6},
      {"val": 4, "Name": "Block 4", "ParentID": 6},
      {"val": 5, "Name": "Block 5", "ParentID": 6},
      {"val": 6, "Name": "Block 7", "ParentID": 6},
      {"val": 7, "Name": "Mess", "ParentID": 6},
      {"val": 8, "Name": "Library", "ParentID": 6},
      {"val": 9, "Name": "Cafe", "ParentID": 6},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 6},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 6},
      {"val": 12, "Name": "Game Room", "ParentID": 6},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 6},

      {"val": 1, "Name": "Raza Block", "ParentID": 7},
      {"val": 2, "Name": "Block 2", "ParentID": 7},
      {"val": 3, "Name": "Block 3", "ParentID": 7},
      {"val": 4, "Name": "Block 4", "ParentID": 7},
      {"val": 5, "Name": "Block 5", "ParentID": 7},
      {"val": 6, "Name": "Block 6", "ParentID": 7},
      {"val": 7, "Name": "Mess", "ParentID": 7},
      {"val": 8, "Name": "Library", "ParentID": 7},
      {"val": 9, "Name": "Cafe", "ParentID": 7},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 7},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 7},
      {"val": 12, "Name": "Game Room", "ParentID": 7},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 7},

      {"val": 1, "Name": "Raza Block", "ParentID": 8},
      {"val": 2, "Name": "Block 2", "ParentID": 8},
      {"val": 3, "Name": "Block 3", "ParentID": 8},
      {"val": 4, "Name": "Block 4", "ParentID": 8},
      {"val": 5, "Name": "Block 5", "ParentID": 8},
      {"val": 6, "Name": "Block 6", "ParentID": 8},
      {"val": 7, "Name": "Block 7", "ParentID": 8},
      {"val": 8, "Name": "Library", "ParentID": 8},
      {"val": 9, "Name": "Cafe", "ParentID": 8},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 8},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 8},
      {"val": 12, "Name": "Game Room", "ParentID": 8},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 8},

      {"val": 1, "Name": "Raza Block", "ParentID": 9},
      {"val": 2, "Name": "Block 2", "ParentID": 9},
      {"val": 3, "Name": "Block 3", "ParentID": 9},
      {"val": 4, "Name": "Block 4", "ParentID": 9},
      {"val": 5, "Name": "Block 5", "ParentID": 9},
      {"val": 6, "Name": "Block 6", "ParentID": 9},
      {"val": 7, "Name": "Block 7", "ParentID": 9},
      {"val": 8, "Name": "Mess", "ParentID": 9},
      {"val": 9, "Name": "Cafe", "ParentID": 9},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 9},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 9},
      {"val": 12, "Name": "Game Room", "ParentID": 9},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 9},

      {"val": 1, "Name": "Raza Block", "ParentID": 10},
      {"val": 2, "Name": "Block 2", "ParentID": 10},
      {"val": 3, "Name": "Block 3", "ParentID": 10},
      {"val": 4, "Name": "Block 4", "ParentID": 10},
      {"val": 5, "Name": "Block 5", "ParentID": 10},
      {"val": 6, "Name": "Block 6", "ParentID": 10},
      {"val": 7, "Name": "Block 7", "ParentID": 10},
      {"val": 8, "Name": "Mess", "ParentID": 10},
      {"val": 9, "Name": "Library", "ParentID": 10},
      {"val": 10, "Name": "Boys Hostel", "ParentID": 10},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 10},
      {"val": 12, "Name": "Game Room", "ParentID": 10},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 10},

      {"val": 1, "Name": "Raza Block", "ParentID": 11},
      {"val": 2, "Name": "Block 2", "ParentID": 11},
      {"val": 3, "Name": "Block 3", "ParentID": 11},
      {"val": 4, "Name": "Block 4", "ParentID": 11},
      {"val": 5, "Name": "Block 5", "ParentID": 11},
      {"val": 6, "Name": "Block 6", "ParentID": 11},
      {"val": 7, "Name": "Block 7", "ParentID": 11},
      {"val": 8, "Name": "Mess", "ParentID": 11},
      {"val": 9, "Name": "Library", "ParentID": 11},
      {"val": 10, "Name": "Cafe", "ParentID": 11},
      {"val": 11, "Name": "Girls Hostel", "ParentID": 11},
      {"val": 12, "Name": "Game Room", "ParentID": 11},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 11},

      {"val": 1, "Name": "Raza Block", "ParentID": 12},
      {"val": 2, "Name": "Block 2", "ParentID": 12},
      {"val": 3, "Name": "Block 3", "ParentID": 12},
      {"val": 4, "Name": "Block 4", "ParentID": 12},
      {"val": 5, "Name": "Block 5", "ParentID": 12},
      {"val": 6, "Name": "Block 6", "ParentID": 12},
      {"val": 7, "Name": "Block 7", "ParentID": 12},
      {"val": 8, "Name": "Mess", "ParentID": 12},
      {"val": 9, "Name": "Library", "ParentID": 12},
      {"val": 10, "Name": "Cafe", "ParentID": 12},
      {"val": 11, "Name": "Boys Hostel", "ParentID": 12},
      {"val": 12, "Name": "Game Room", "ParentID": 12},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 12},

      {"val": 1, "Name": "Raza Block", "ParentID": 13},
      {"val": 2, "Name": "Block 2", "ParentID": 13},
      {"val": 3, "Name": "Block 3", "ParentID": 13},
      {"val": 4, "Name": "Block 4", "ParentID": 13},
      {"val": 5, "Name": "Block 5", "ParentID": 13},
      {"val": 6, "Name": "Block 6", "ParentID": 13},
      {"val": 7, "Name": "Block 7", "ParentID": 13},
      {"val": 8, "Name": "Mess", "ParentID": 13},
      {"val": 9, "Name": "Library", "ParentID": 13},
      {"val": 10, "Name": "Cafe", "ParentID": 13},
      {"val": 11, "Name": "Boys Hostel", "ParentID": 13},
      {"val": 12, "Name": "Girls Hostel", "ParentID": 13},
      {"val": 13, "Name": "BasketBall Court", "ParentID": 13},

      {"val": 1, "Name": "Raza Block", "ParentID": 14},
      {"val": 2, "Name": "Block 2", "ParentID": 14},
      {"val": 3, "Name": "Block 3", "ParentID": 14},
      {"val": 4, "Name": "Block 4", "ParentID": 14},
      {"val": 5, "Name": "Block 5", "ParentID": 14},
      {"val": 6, "Name": "Block 6", "ParentID": 14},
      {"val": 7, "Name": "Block 7", "ParentID": 14},
      {"val": 8, "Name": "Mess", "ParentID": 14},
      {"val": 9, "Name": "Library", "ParentID": 14},
      {"val": 10, "Name": "Cafe", "ParentID": 14},
      {"val": 11, "Name": "Boys Hostel", "ParentID": 14},
      {"val": 12, "Name": "Girls Hostel", "ParentID": 14},
      {"val": 13, "Name": "Game room", "ParentID": 14},

    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          FormHelper.dropDownWidget(
            context,
            "Select Your Current Location",
            this.locationsid,
            this.Locations,
            (onChangedVal) {
              this.locationsid = onChangedVal;
              print("Selected Location: $onChangedVal");

              this.State = this
                  .Destinations
                  .where(
                    (stateItem) =>
                        stateItem["ParentID"].toString() ==
                        onChangedVal.toString(),
                  )
                  .toList();
              this.stateid = null;
              setState(() {});

              var getApi = apiHandler.makePostRequest(this.locationsid);
              print(getApi);
            },
            (onValidateVal) {
              if (onValidateVal == null) {
                return "Please select a Location";
              }
              return null;
            },
            borderColor: Colors.lightBlue,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 5,
            optionValue: "id",
            //  "id", //purpose: in the dropdown we always have a value and a label
            optionLabel: "name",
            //"label" // we assign a value to the label so when we select a label, the id is returned
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.dropDownWidget(
            context,
            "Select Destination",
            this.stateid,
            this.State,
            (onChangedVal) {
              this.stateid = onChangedVal;
              print("Selected Location: $onChangedVal");
            },
            (onValidateVal) {
              return null;
            },
            borderColor: Colors.lightBlue,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 5,
            optionValue:
                "val", //purpose: in the dropdown we always have a value and a label
            optionLabel:
                "Name", // we assign a value to the label so when we select a label, the id is returned
          ),
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
      )),
    );
  }
}
