import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/add_address_cubit.dart';
import 'button_save_body.dart';
import 'city_area_selection.dart';

class AddAddressBody extends StatefulWidget {
  const AddAddressBody({
    super.key,
    required this.viewModel,
  });

  final AddAddressCubit viewModel;

  @override
  State<AddAddressBody> createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController recipientNameController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    cityController.dispose();
    recipientNameController.dispose();
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is ChangeAddressState) {
          addressController.text = state.address;
        }
      },
      child: Expanded(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              controller: addressController,
              labelText: 'Address',
              hintText: 'Enter the add_address',
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              labelText: 'Phone number',
              hintText: 'Enter the phone number',
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              controller: recipientNameController,
              labelText: 'Recipient name',
              hintText: 'Enter the recipient name',
            ),
            const SizedBox(height: 24),
            CityAreaSelection(
              viewModel: widget.viewModel,
            ),
            const SizedBox(height: 48),
            ButtonSaveBody(
              phone: phoneController,
              street: addressController,
              viewModel: widget.viewModel,
            ),
          ],
        ),
      ),
    );
  }
}
