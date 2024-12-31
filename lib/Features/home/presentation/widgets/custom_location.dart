import '../../../../core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';

class CustomLocation extends StatefulWidget {
  const CustomLocation({
    super.key,
    this.icon,
    this.arrow,
  });
  final String? icon;
  final String? arrow;

  @override
  State<CustomLocation> createState() => _CustomLocationState();
}

class _CustomLocationState extends State<CustomLocation> {
  String _address = '';
  LatLng _currentMarkerPosition =
      LatLng(37.7749, -122.4194); // Default location
  late loc.Location location;

  @override
  void initState() {
    super.initState();
    location = loc.Location();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // If service is not enabled, return
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // If permission is denied, return
        return;
      }
    }
    loc.LocationData locationData = await location.getLocation();
    LatLng currentPosition =
        LatLng(locationData.latitude!, locationData.longitude!);
    if (mounted) {
      setState(() {
        _currentMarkerPosition = currentPosition;
      });

      _getAddress(_currentMarkerPosition);
    }
  }

  Future<void> _getAddress(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _address = "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      setState(() {
        _address = "تعذر جلب العنوان";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          width: AppSize.s20,
          height: AppSize.s20,
          widget.icon!,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(width: AppSize.s5),
        Expanded(
          child: Text(
            _address.isEmpty ? '...' : _address,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: AppSize.s16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: AppSize.s5),
        SvgPicture.asset(
          width: AppSize.s20,
          height: AppSize.s20,
          widget.arrow!,
          fit: BoxFit.scaleDown,
        ),
      ],
    );
  }
}
