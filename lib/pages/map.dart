import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resolved_conf/data.dart';
import 'package:resolved_conf/components/backbutton.dart' as backButton;

class Map extends StatelessWidget {
  Map({this.initialPosition, Key key}) : super(key: key);

  final CameraPosition initialPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.9),
        child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          GoogleMap(
            compassEnabled: false,
            mapToolbarEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: initialPosition,
            markers: markers,
          ),
          backButton.BackButton(
            centered: true,
          )
        ]));
  }
}
