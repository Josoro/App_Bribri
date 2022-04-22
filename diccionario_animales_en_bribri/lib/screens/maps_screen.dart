import 'dart:async';
import 'package:diccionario_animales_en_bribri/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  static String id = 'maps_screen';

  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  //Para que sirve esta f?
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const MapSample(),
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
  const MapSample({Key? key}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType _type = MapType.hybrid;
  int _typeNumber = 0;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    marcadores();
    super.initState();
  }

  void marcadores() {
    _markers.add(const Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId('bribri'),
      position: LatLng(9.625434, -82.853196),
      infoWindow: InfoWindow(
        // title is the address
        title: 'Limon, Bribrí',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    _markers.add(const Marker(
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

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.625434, -82.853196),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      //bearing: 359.8334901395799,
      target: LatLng(9.625434, -82.853196),
      //tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: NavBar(),
      ),
      appBar: AppBar(
        title: const Text('Territorio Bribrí'),
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
        label: const Text('Territorio Bribrí!'),
        icon: const Icon(Icons.camera_alt_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    });
  }
}
