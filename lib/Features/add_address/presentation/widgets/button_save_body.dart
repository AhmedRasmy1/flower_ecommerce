import 'package:flower_ecommerce/core/resources/custom_loading.dart';
import 'package:flower_ecommerce/core/widgets/error_toast.dart';
import 'package:flower_ecommerce/core/widgets/success_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../manager/add_address_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonSaveBody extends StatefulWidget {
  const ButtonSaveBody({
    super.key,
    required this.viewModel,
    required this.phone,
    required this.street,
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
          CustomLoadingDialog();
        }
        if (state is ErrorAddAddressState) {
          showErrorToast(
            context: context,
            message: AppLocalizations.of(context)!.something_went_wrong,
          );
        }
        if (state is SuccessAddAddressState) {
          Navigator.pop(context);
          showSuccessToast(
            context: context,
            message: AppLocalizations.of(context)!.address_added_successfully,
            title: AppLocalizations.of(context)!.done,
          );
        }
      },
      child: CustomElevatedButton(
          buttonColor: ColorManager.pink,
          title: AppLocalizations.of(context)!.save_address,
          onPressed: () {
            widget.viewModel.addAddress(
                widget.viewModel.city, widget.phone.text, widget.street.text);
          }),
    );
  }
}
