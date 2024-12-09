import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../data/models/request/add_address_model.dart';
import '../manager/add_address_cubit.dart';

class ButtonSaveBody extends StatefulWidget {
  const ButtonSaveBody({
    super.key,

  required this.viewModel, required this.phone, required this.street,
  });


final TextEditingController phone;
final TextEditingController street;

  final AddAddressCubit viewModel;

  @override
  State<ButtonSaveBody> createState() => _ButtonSaveBodyState();
}

class _ButtonSaveBodyState extends State<ButtonSaveBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is LoadingAddAddressState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.pink,
                ),
              ),
            ),
          );
        }
        if(state is ErrorAddAddressState)
          {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon:Text('${state.exception}'),
              ),
            );
          }
        if(state is SuccessAddAddressState){
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon:Text('${state.addAddressEntity?.message}'),
            ),
          );
        }
      },
      child: CustomElevatedButton(
          buttonColor: ColorManager.pink,
          title: 'Save add_address ',
          onPressed: () {
            widget.viewModel.addAddress(widget.viewModel.city, widget.phone.text,  widget.street.text);
          }),
    );
  }
}
