import '../manager/add_address_cubit.dart';
import '../../../../core/permissions/permissions.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../../../../core/resources/assets_manager.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key, required this.viewModel});

  final AddAddressCubit viewModel;

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  late GoogleMapController googleMapController;
  late loc.Location location;
  LatLng currentPosition = LatLng(30.045190011379873, 31.236255172107867);
  Set<Marker> markers = {};
  late BitmapDescriptor markerIcon;
  String _address = '';
  String _addressCountry = '';
  String _addressLocality = '';

  @override
  void initState() {
    super.initState();
    initializeApp();
    location = loc.Location();
  }

  void initializeApp() async {
    _getCurrentLocation();
    _loadMarkerIcon();
  }

  Future<void> _loadMarkerIcon() async {
    markerIcon = await BitmapDescriptor.asset(
      ImageConfiguration(),
      AssetsManager.imagesMarker,
    );
  }

  Future<void> _getAddress(LatLng position) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks.first;
        setState(() {
          _address = "${place.street}, ${place.locality}, ${place.country}";
          _addressLocality = '${place.locality}';
          _addressCountry = '${place.country}';
          widget.viewModel.changeAddress(' ${place.country}_'
              '${place.administrativeArea}'
              '_${place.locality}_'
              '${place.subAdministrativeArea}');
        });
      }
    } catch (e) {
      setState(() {
        _address = "تعذر جلب العنوان";
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    if (await PermissionService.checkLocationServiceAndPermission()) {
      loc.LocationData locationData = await location.getLocation();
      setState(() {
        currentPosition =
            LatLng(locationData.latitude!, locationData.longitude!);
        _getAddress(currentPosition);

        markers.add(
          Marker(
            markerId: MarkerId('currentLocation'),
            position: currentPosition,
            draggable: true,
            icon: markerIcon,
            onDragEnd: (newPosition) {
              setState(() {
                currentPosition = newPosition;
              });
            },
            infoWindow: InfoWindow(
              title: _addressLocality,
              snippet: _addressCountry,
            ),
          ),
        );
      });
    }
    googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(currentPosition, 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          markers: markers,
          initialCameraPosition: CameraPosition(
            target: currentPosition,
            zoom: 3,
          ),
          onTap: (position) async {
            setState(() {
              markers.clear();
              currentPosition = position;
              _getAddress(position);
              markers.add(
                Marker(
                  markerId: MarkerId('newLocation'),
                  position: position,
                  icon: markerIcon,
                  draggable: true,
                  onDragEnd: (newPosition) {
                    setState(() {
                      currentPosition = newPosition;
                    });
                  },
                  infoWindow: InfoWindow(
                    title: _addressLocality,
                    snippet: _addressCountry,
                  ),
                ),
              );
            });

            // Gradually zoom in with a new CameraPosition
            CameraPosition cameraPosition = CameraPosition(
              target: position,
              zoom: 10,
            );

            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(cameraPosition),
            );
          },
        ),
      ),
    );
  }
}
