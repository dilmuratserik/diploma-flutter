import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(43.236345, 76.929023),
    zoom: 14.4746,
  );

  static final CameraPosition _goingCameraPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(43.237154, 76.945567),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  var marker1 = Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(43.236345, 76.929023),
      infoWindow: InfoWindow(title: 'КазНИТУ'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  var marker2 = Marker(
      markerId: MarkerId('id-2'),
      position: LatLng(43.237154, 76.945567),
      infoWindow: InfoWindow(title: 'Акимат'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));

  bool justBool = true;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Карта',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          bottomOpacity: 1,
          iconTheme: IconThemeData(color: Colors.black)),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: MapType.hybrid,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _onMapCreated(controller);
        },
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goTo,
        child: Icon(Icons.map),
      ),
    );
  }

  Future<void> _goTo() async {
    final GoogleMapController controller = await _controller.future;
    justBool
        ? controller
            .animateCamera(CameraUpdate.newCameraPosition(_goingCameraPosition))
        : controller.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition));
    justBool = !justBool;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(marker1);
      _markers.add(marker2);
    });
  }
}
