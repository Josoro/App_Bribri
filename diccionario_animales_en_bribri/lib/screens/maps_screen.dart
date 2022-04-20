import 'dart:async';

import 'package:diccionario_animales_en_bribri/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  static String id = 'maps_screen';

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MapSample(),
        Positioned(
          top: 50.0,
          left: 10.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(100)),
            // child: FloatingActionButton(
            //   onPressed: () => _changeType(),
            //   child: Icon(Icons.change_circle_rounded),
            // ),
          ),
        ),
      ],
    ));
  }
}

class MapSample extends StatefulWidget {
  MapSample({Key? key}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _type = MapType.hybrid;
  int _typeNumber = 0;
  Set<Marker> _markers = {};

  void marcadores() {
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId('bribri'),
      position: LatLng(9.625434, -82.853196),
      infoWindow: InfoWindow(
        // title is the address
        title: 'Limon, Bribrí',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId('salitre'),
      position: LatLng(9.190395, -83.303431),
      infoWindow: InfoWindow(
        // title is the address
        title: 'Salitre',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.625434, -82.853196),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      //bearing: 359.8334901395799,
      target: LatLng(9.625434, -82.853196),
      //tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: const Drawer(
        child: NavBar(),
      ),
      appBar: AppBar(
        title: const Text('Territorio Bribri'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.change_circle_rounded),
            onPressed: () {
              _changeType();
            },
          )
        ],
      ),
      body: GoogleMap(
        markers: _markers,
        mapType: _type,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Territorio Bribri!'),
        icon: Icon(Icons.camera_alt_outlined),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void _changeType() {
    setState(() {
      switch (_typeNumber) {
        case 0:
          _type = MapType.normal;
          _typeNumber++;
          break;
        case 1:
          _type = MapType.hybrid;
          _typeNumber++;
          break;
        case 2:
          _type = MapType.satellite;
          _typeNumber++;
          break;
        case 3:
          _type = MapType.terrain;
          _typeNumber++;
          break;
        default:
          _type = MapType.normal;
          _typeNumber = 0;
      }
      marcadores();
    });
  }
}