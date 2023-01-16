import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:latlong2/latlong.dart';

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
    this.Destinations = [
      {"val": 1, "Name": "Block 2", "ParentID": 1},
      {"val": 2, "Name": "Block 3", "ParentID": 1},
      {"val": 3, "Name": "Block 4", "ParentID": 1},
      {"val": 4, "Name": "Block 5", "ParentID": 1},
      {"val": 5, "Name": "Block 6", "ParentID": 1},
      {"val": 6, "Name": "Block 7", "ParentID": 1},
      {"val": 1, "Name": "Raza Block", "ParentID": 2},
      {"val": 2, "Name": "Block 3", "ParentID": 2},
      {"val": 3, "Name": "Block 4", "ParentID": 2},
      {"val": 4, "Name": "Block 5", "ParentID": 2},
      {"val": 5, "Name": "Block 6", "ParentID": 2},
      {"val": 6, "Name": "Block 7", "ParentID": 2},
      {"val": 1, "Name": "Raza Block", "ParentID": 3},
      {"val": 2, "Name": "Block 2", "ParentID": 3},
      {"val": 3, "Name": "Block 4", "ParentID": 3},
      {"val": 4, "Name": "Block 5", "ParentID": 3},
      {"val": 5, "Name": "Block 6", "ParentID": 3},
      {"val": 6, "Name": "Block 7", "ParentID": 3},
      {"val": 1, "Name": "Raza Block", "ParentID": 4},
      {"val": 2, "Name": "Block 2", "ParentID": 4},
      {"val": 3, "Name": "Block 3", "ParentID": 4},
      {"val": 4, "Name": "Block 5", "ParentID": 4},
      {"val": 5, "Name": "Block 6", "ParentID": 4},
      {"val": 6, "Name": "Block 7", "ParentID": 4},
      {"val": 1, "Name": "Raza Block", "ParentID": 5},
      {"val": 2, "Name": "Block 2", "ParentID": 5},
      {"val": 3, "Name": "Block 3", "ParentID": 5},
      {"val": 4, "Name": "Block 4", "ParentID": 5},
      {"val": 5, "Name": "Block 6", "ParentID": 5},
      {"val": 6, "Name": "Block 7", "ParentID": 5},
      {"val": 1, "Name": "Raza Block", "ParentID": 6},
      {"val": 2, "Name": "Block 2", "ParentID": 6},
      {"val": 3, "Name": "Block 3", "ParentID": 6},
      {"val": 4, "Name": "Block 4", "ParentID": 6},
      {"val": 5, "Name": "Block 5", "ParentID": 6},
      {"val": 6, "Name": "Block 7", "ParentID": 6},
      {"val": 1, "Name": "Raza Block", "ParentID": 7},
      {"val": 2, "Name": "Block 2", "ParentID": 7},
      {"val": 3, "Name": "Block 3", "ParentID": 7},
      {"val": 4, "Name": "Block 4", "ParentID": 7},
      {"val": 5, "Name": "Block 5", "ParentID": 7},
      {"val": 6, "Name": "Block 6", "ParentID": 7}
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
            },
            (onValidateVal) {
              if (onValidateVal == null) {
                return "Please select a Location";
              }
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            optionValue: "id",
            //  "id", //purpose: in the dropdown we always have a value and a label
            optionLabel: "name",
            //"label" // we assign a value to the label so when we select a label, the id is returned
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
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            optionValue:
                "val", //purpose: in the dropdown we always have a value and a label
            optionLabel:
                "Name", // we assign a value to the label so when we select a label, the id is returned
          )
        ],
      )),
    );
  }
}
