import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
//  Field
  LatLng latLng = LatLng(13.819142, 100.514317);

//  Method

  Marker university() {
    return Marker(
      position: latLng,
      markerId: MarkerId('University'),
      infoWindow: InfoWindow(title: 'มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ',
        snippet: '1518​ ถนน​ประชา​ราษฎร์​1​ แขวง วงศ์สว่าง เขตบางซื่อ กรุงเทพมหานคร 10800',
      ),
    );
  }

  Set<Marker> myMarkers() {
    return <Marker>[
      university(),
    ].toSet();
  }

  Widget showMap() {
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16,
    );

    return GoogleMap(
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController controller) {},
      markers: myMarkers(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: showMap(),
    );
  }
}
