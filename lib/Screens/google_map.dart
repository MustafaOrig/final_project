import 'package:firstapp/Services/auth.dart';
import 'package:firstapp/authenticate/main_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   Set<Polyline> _polyline = Set<Polyline>();

//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();

//   final AuthService _auth = AuthService();
//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(21.485811, 39.192505),
//     zoom: 11.5,
//   );

//   GoogleMapController? _googleMapController;

//   Marker _origin = Marker(
//     markerId: const MarkerId('origin'),
//     infoWindow: const InfoWindow(title: 'Origin'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     position: LatLng(20, 40),
//   );
//   Marker _destination = Marker(
//     markerId: const MarkerId('origin'),
//     infoWindow: const InfoWindow(title: 'Origin'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     position: LatLng(24, 45),
//   );

//   // Directions _info;

//   @override
//   void dispose() {
//     _googleMapController?.dispose();
//     super.dispose();
//   }

//   void setPolylinesFunction() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       "AIzaSyBOuuPEcDUmhWi-B3uNT9k0rf9K3TWyDCU",
//       const PointLatLng(21.543333, 39.172779),
//       const PointLatLng(21.422510, 39.826168),
//     );

//     result.points.forEach((PointLatLng point) {
//       polylineCoordinates.add(LatLng(22, 23));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: const Text('Google Maps'),
//         actions: [
//           // if (_origin != null)
//           //   TextButton(
//           //     onPressed: () => _googleMapController?.animateCamera(
//           //       CameraUpdate.newCameraPosition(
//           //         CameraPosition(
//           //           target: _origin.position,
//           //           zoom: 14.5,
//           //           tilt: 50.0,
//           //         ),
//           //       ),
//           //     ),
//           //     style: TextButton.styleFrom(
//           //       primary: Colors.green,
//           //       textStyle: const TextStyle(fontWeight: FontWeight.w600),
//           //     ),
//           //     child: const Text('ORIGIN'),
//           //   ),
//           // if (_destination != null)
//           //   TextButton(
//           //     onPressed: () => _googleMapController?.animateCamera(
//           //       CameraUpdate.newCameraPosition(
//           //         CameraPosition(
//           //           target: _destination.position,
//           //           zoom: 14.5,
//           //           tilt: 50.0,
//           //         ),
//           //       ),
//           //     ),
//           //     style: TextButton.styleFrom(
//           //       primary: Colors.blue,
//           //       textStyle: const TextStyle(fontWeight: FontWeight.w600),
//           //     ),
//           //     child: const Text('DEST'),
//           //   )

//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('logout'),
//             onPressed: () async {
//               await _auth.signOut();
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Authentication()));
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           GoogleMap(
//             myLocationButtonEnabled: false,
//             zoomControlsEnabled: false,
//             initialCameraPosition: _initialCameraPosition,
//             onMapCreated: (controller) {
//               _googleMapController = controller;
//               setPolylinesFunction();
//             },
//             markers: {
//               if (_origin != null) _origin,
//               if (_destination != null) _destination
//             },
//             polylines: _polyline,
//             // polylines: {
//             //   if (_info != null)
//             //     Polyline(
//             //       polylineId: const PolylineId('overview_polyline'),
//             //       color: Colors.red,
//             //       width: 5,
//             //       points: _info.polylinePoints
//             //           .map((e) => LatLng(e.latitude, e.longitude))
//             //           .toList(),
//             //     ),
//             // },
//             onLongPress: _addMarker,
//           ),
//           // if (_info != null)
//           //   Positioned(
//           //     top: 20.0,
//           //     child: Container(
//           //       padding: const EdgeInsets.symmetric(
//           //         vertical: 6.0,
//           //         horizontal: 12.0,
//           //       ),
//           //       decoration: BoxDecoration(
//           //         color: Colors.yellowAccent,
//           //         borderRadius: BorderRadius.circular(20.0),
//           //         boxShadow: const [
//           //           BoxShadow(
//           //             color: Colors.black26,
//           //             offset: Offset(0, 2),
//           //             blurRadius: 6.0,
//           //           )
//           //         ],
//           //       ),
//           //       child: Text(
//           //         '${_info.totalDistance}, ${_info.totalDuration}',
//           //         style: const TextStyle(
//           //           fontSize: 18.0,
//           //           fontWeight: FontWeight.w600,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.black,
//         onPressed: () {},
//         // onPressed: () => _googleMapController.animateCamera(
//         //   _info != null
//         //       ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
//         //       : CameraUpdate.newCameraPosition(_initialCameraPosition),
//         // ),
//         child: const Icon(Icons.center_focus_strong),
//       ),
//     );
//   }

//   void _addMarker(LatLng pos) async {
//     if (_origin == null || (_origin != null && _destination != null)) {
//       // Origin is not set OR Origin/Destination are both set
//       // Set origin
//       setState(() {
//         _origin = Marker(
//           markerId: const MarkerId('origin'),
//           infoWindow: const InfoWindow(title: 'Origin'),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos,
//         );
//         // Reset destination
//         // _destination = null;

//         // Reset info
//         // _info = null;
//       });
//     } else {
//       // Origin is already set
//       // Set destination
//       setState(() {
//         _destination = Marker(
//           markerId: const MarkerId('destination'),
//           infoWindow: const InfoWindow(title: 'Destination'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           position: pos,
//         );
//       });

//       // Get directions
//       // final directions = await DirectionsRepository()
//       //     .getDirections(origin: _origin.position, destination: pos);
//       // setState(() => _info = directions);
//     }
//   }
// }

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  // double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  // double _destLatitude = 6.849660, _destLongitude = 3.648190;
  double _originLatitude = 21.558725, _originLongitude = 39.221773;
  double _destLatitude = 21.402543, _destLongitude = 39.772109;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyBOuuPEcDUmhWi-B3uNT9k0rf9K3TWyDCU";
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();

    /// origin marker
    /// Jeddah ( Lat, Long)
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// Makkah (Lat, Long)

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Google Maps'),
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Authentication()));
                },
              ),
            ],
          ),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(_originLatitude, _originLongitude), zoom: 15),
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
            polylines: Set<Polyline>.of(polylines.values),
          )),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}
