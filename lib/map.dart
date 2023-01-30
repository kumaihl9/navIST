import 'package:flutter/material.dart';
import 'package:loginuicolors/directions_model.dart';
import 'package:loginuicolors/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'nav.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.521000, 73.1747),
    zoom: 16.8,
  );
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIcon7 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIcon2 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIcon1 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIcon3 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIcon4 = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    addCustomIcon();
    addCustomIcon7();
    addCustomIcon2();
    addCustomIcon1();
    addCustomIcon3();
    addCustomIcon4();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/block12.png")
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }
  void addCustomIcon7() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/block7.png")
        .then((icon2) {
      setState(() {
        markerIcon7 = icon2;
      });
    });
  }
  void addCustomIcon2() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/block2.png")
        .then((icon3) {
      setState(() {
        markerIcon2 = icon3;
      });
    });
  }
  void addCustomIcon1() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/raza_block.png")
        .then((icon4) {
      setState(() {
        markerIcon1 = icon4;
      });
    });
  }
  void addCustomIcon3() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/block3.png")
        .then((icon5) {
      setState(() {
        markerIcon3 = icon5;
      });
    });
  }
  void addCustomIcon4() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/mess.png")
        .then((icon6) {
      setState(() {
        markerIcon4 = icon6;
      });
    });
  }

  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  List<LatLng> polygonPoints = const [
    LatLng(33.51906911224181, 73.17768056996827),
    LatLng(33.52041125107627, 73.17764594545446),
    LatLng(33.52049356323002, 73.17697570757106),
    LatLng(33.52182316170506, 73.17700760459029),
    LatLng(33.52198803049165, 73.17731381597495),
    LatLng(33.5228708709049, 73.17748605987885),
    LatLng(33.52294000862904, 73.17683536068643),
    LatLng(33.52336015207693, 73.17612724686158),
    LatLng(33.52290809892192, 73.17571896501535),
    LatLng(33.52251986314991, 73.17628673195775),
    LatLng(33.52135514537765, 73.17571896501535),
    LatLng(33.521250359724384, 73.17597776225504),
    LatLng(33.52116181436712, 73.17595879617393),
    LatLng(33.521269638669864, 73.17374326880639),
    LatLng(33.521668516779506, 73.17374964821006),
    LatLng(33.5216791535039, 73.1740622389897),
    LatLng(33.523083189659076, 73.1741579300434),
    LatLng(33.52312573585294, 73.1729777403652),
    LatLng(33.522306717944225, 73.17293308453954),
    LatLng(33.520790982525654, 73.17243549105359),
    LatLng(33.51927736781463, 73.17273495759977),
    LatLng(33.51904335305074, 73.17507619874559),
    LatLng(33.51920822713588, 73.17508257814924),
  ];

  List<LatLng> holesPoints = const [
    LatLng(33.51906911224181, 73.17768056996827),
    LatLng(33.52041125107627, 73.17764594545446),
    LatLng(33.52049356323002, 73.17697570757106),
    LatLng(33.52182316170506, 73.17700760459029),
    LatLng(33.52198803049165, 73.17731381597495),
    LatLng(33.5228708709049, 73.17748605987885),
    LatLng(33.52294000862904, 73.17683536068643),
    LatLng(33.52336015207693, 73.17612724686158),
    LatLng(33.52290809892192, 73.17571896501535),
    LatLng(33.52251986314991, 73.17628673195775),
    LatLng(33.52135514537765, 73.17571896501535),
    LatLng(33.521250359724384, 73.17597776225504),
    LatLng(33.52116181436712, 73.17595879617393),
    LatLng(33.521269638669864, 73.17374326880639),
    LatLng(33.521668516779506, 73.17374964821006),
    LatLng(33.5216791535039, 73.1740622389897),
    LatLng(33.523083189659076, 73.1741579300434),
    LatLng(33.52312573585294, 73.1729777403652),
    LatLng(33.522306717944225, 73.17293308453954),
    LatLng(33.520790982525654, 73.17243549105359),
    LatLng(33.51927736781463, 73.17273495759977),
    LatLng(33.51904335305074, 73.17507619874559),
    LatLng(33.51920822713588, 73.17508257814924),
  ];

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tap and hold to select location and destination',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        backgroundColor: Colors.indigo,
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('Origin'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination!.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('Destination'),
            )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              Marker(
                  markerId: MarkerId('Block_6'),
                  position: const LatLng(33.52089663820322, 73.17655964371727),
                  icon: markerIcon,
              ),

              Marker(
                markerId: MarkerId('Block_7'),
                position: const LatLng(33.52228223902618, 73.1770603330611),
                icon: markerIcon7,
              ),
              Marker(
                markerId: MarkerId('Block_2'),
                position: const LatLng(33.519894995775736, 73.17496357231174),
                icon: markerIcon2,
              ),
              Marker(
                markerId: MarkerId('Block_1'),
                position: const LatLng(33.51984934256272, 73.17598900964433),
                icon: markerIcon1,
              ),
              Marker(
                markerId: MarkerId('Block_3'),
                position: const LatLng(33.52041309901447, 73.17532236193796),
                icon: markerIcon3,
              ),
              Marker(
                markerId: MarkerId('mess'),
                position: const LatLng(33.5210353542315, 73.17433036463123),
                icon: markerIcon4,
              ),

              if (_origin != null) _origin!,
              if (_destination != null) _destination!
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
            polygons: {
              Polygon(
                polygonId: PolygonId('1'),
                points: polygonPoints,
                fillColor: Color(0xFF006491).withOpacity(0.05),
                strokeWidth: 3,
                strokeColor: Color(0xFF006491),
              ),
              new Polygon(
                  strokeWidth: 1,
                  strokeColor: Color(0xFF006491),
                  fillColor: Color(0xFF006491).withOpacity(0.5),
                  polygonId: new PolygonId('test'),
                  holes: [
                    holesPoints
                  ],
                  points: <LatLng>[
                    new LatLng(33.51919221632063, 73.21287820325243),
                    new LatLng(33.5326293846866, 73.18973672374014),
                    new LatLng(50, 50),
                    new LatLng(33.48749174457534, 73.17744675405892)
                  ])
            },
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController?.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}
