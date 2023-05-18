import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osm_flutter_hooks/osm_flutter_hooks.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({Key? key}) : super(key: key);

  // MapController mapController = MapController(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Location(),
    );
  }
}

class Location extends HookWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    // MapController controller = MapController(
    //   initMapWithUserPosition: true,
    //   //initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    //   areaLimit: BoundingBox(
    //     east: 10.4922941,
    //     north: 47.8084648,
    //     south: 45.817995,
    //     west: 5.9559113,
    //   ),
    // );
    final controller = useMapController(
      initMapWithUserPosition: true,
      // initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
      areaLimit: BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ),
    );
    useMapIsReady(
      controller: controller,
      mapIsReady: () async {
        await controller.zoomIn();
        await controller.zoomOut();
        await controller.currentLocation();
        await controller.setZoom(zoomLevel: 20);
      },
    );
    return OSMFlutter(
      controller: controller,
      trackMyPosition: true,
      initZoom: 12,
      minZoomLevel: 8,
      maxZoomLevel: 14,
      stepZoom: 1.0,
      userLocationMarker: UserLocationMaker(
        personMarker: MarkerIcon(
          icon: Icon(
            Icons.location_history_rounded,
            color: Colors.red,
            size: 48,
          ),
        ),
        directionArrowMarker: MarkerIcon(
          icon: Icon(
            Icons.double_arrow,
            size: 48,
          ),
        ),
      ),
      roadConfiguration: RoadConfiguration(
        startIcon: MarkerIcon(
          icon: Icon(
            Icons.person,
            size: 64,
            color: Colors.brown,
          ),
        ),
        roadColor: Colors.yellowAccent,
      ),
      markerOption: MarkerOption(
        defaultMarker: MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.blue,
            size: 56,
          ),
        ),
      ),
    );
    //   OSMFlutter(
    //   controller: controller,
    //   initZoom: 10,
    //   markerOption: MarkerOption(
    //     defaultMarker: MarkerIcon(
    //       icon: Icon(
    //         Icons.person_pin_circle,
    //         color: Colors.blue,
    //         size: 56,
    //       ),
    //     ),
    //   ),
    //   trackMyPosition: false,
    // );
  }
}
