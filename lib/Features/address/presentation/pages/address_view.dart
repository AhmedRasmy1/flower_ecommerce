import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flower_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CustomAppBar(
            title: 'Address',
            onTap: () {},
          ),
          SizedBox(
            height: 24,
          ),
          MyLocation(),
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            controller: TextEditingController(),
            labelText: 'address',
            hintText: 'Enter the address',
          ),
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            controller: TextEditingController(),
            labelText: 'Phone number',
            hintText: 'Enter the the phone number',
          ),
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            controller: TextEditingController(),
            labelText: 'Recipient name',
            hintText: 'Enter the recipient name',
          ),
        ],
      ),
    );
  }
}

class MyLocation extends StatefulWidget {
  const MyLocation({
    super.key,
  });

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(),
        child: GoogleMap(

            initialCameraPosition: CameraPosition(
                target: LatLng(30.045190011379873, 31.236255172107867))),
      ),
    );
  }
}
