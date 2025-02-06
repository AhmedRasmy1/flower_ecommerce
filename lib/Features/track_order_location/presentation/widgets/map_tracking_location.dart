import 'dart:async';
import 'dart:developer';
import '../../../../core/firebase_core/firebase_utils/firebase_utils.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/firebase_core/model/order_details_add_firestore.dart';
import '../../../../core/resources/assets_manager.dart';

class MapTrackingLocation extends StatefulWidget {
  const MapTrackingLocation({
    super.key, this.orderData,

  });

  final  Orders? orderData;

  @override
  State<MapTrackingLocation> createState() => _MapTrackingLocationState();
}

class _MapTrackingLocationState extends State<MapTrackingLocation> {
  Set<Marker> markers = {};
  late CameraPosition initialCameraPosition;
  late BitmapDescriptor markerStore;
  late BitmapDescriptor markerDriver;
  late BitmapDescriptor markerUser;
  GoogleMapController? googleMapController;

  @override
  void initState() {
    super.initState();
    initialCameraPosition =
        CameraPosition(zoom: 14, target: LatLng(30.021284, 31.229236));

    _initializeMarkers().then((_) {
      _addMarkers();
    });
  }

  Future<void> _initializeMarkers() async {
    final List<BitmapDescriptor> icons = await Future.wait([
      BitmapDescriptor.asset(
          ImageConfiguration(), AssetsManager.markerDelivery),
      BitmapDescriptor.asset(
          ImageConfiguration(), AssetsManager.markerApartment),
      BitmapDescriptor.asset(ImageConfiguration(), AssetsManager.markerStore),
    ]);

    markerDriver = icons[0];
    markerUser = icons[1];
    markerStore = icons[2];
  }

  void _addMarkers() {
    if (!mounted) return;

    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId("Driver_location"),
          icon: markerDriver,
          position: LatLng(30.027182, 31.228989),
          infoWindow: const InfoWindow(title: "Driver"),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId("user_location"),
          icon: markerUser,
          position: LatLng(30.020531, 31.235555),
          infoWindow: const InfoWindow(title: "User"),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId("Store_location"),
          icon: markerStore,
          position: LatLng(30.014177, 31.224698),
          infoWindow: const InfoWindow(title: "Store"),
        ),
      );
    });
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .88,
      width: double.infinity,
      child: StreamBuilder<Orders?>(
        stream: FirebaseUtils.fetchLocationDriver(widget.orderData?.id??''),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final driverLocation = snapshot.data!.driver!;

            log(driverLocation.lat.toString());
            log(driverLocation.long.toString());
            log(driverLocation.email.toString());
            log(driverLocation.phone.toString());

            double latD = double.tryParse(driverLocation.lat ?? '0') ?? 0;
            double longD = double.tryParse(driverLocation.long ?? '0') ?? 0;

            LatLng driverLatLng = LatLng(latD, longD);

            WidgetsBinding.instance.addPostFrameCallback((_) {
              markers.removeWhere(
                  (marker) => marker.markerId.value == 'Driver_location');
              markers.add(
                Marker(
                  markerId: const MarkerId("Driver_location"),
                  icon: markerDriver,
                  position: driverLatLng,
                  infoWindow: const InfoWindow(title: "Driver"),
                ),
              );
            });

            return GoogleMap(
              markers: markers,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                googleMapController = controller;
              },
              initialCameraPosition: initialCameraPosition,
            );
          }

          return Center(
              child: CircularProgressIndicator(color: ColorManager.pink));
        },
      ),
    );
  }
}