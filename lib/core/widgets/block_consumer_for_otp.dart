
import 'package:flower_ecommerce/Features/auth/presentation/view_model/verify_password_view_model/verify_password_state.dart';
import 'package:flower_ecommerce/core/widgets/show_error_dialog.dart';
import 'package:flower_ecommerce/core/widgets/show_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/auth/presentation/view_model/verify_password_view_model/verify_password_cubit.dart';
import '../resources/routes_manager.dart';
import '../utils/utilss.dart';

class BlocConsumerForOtpVerificationPage extends StatelessWidget {
  final ValueChanged<bool> onCodeInvalid; // Callback for invalid code

  const BlocConsumerForOtpVerificationPage({
    super.key,
    required this.onCodeInvalid, // Required callback
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyPasswordViewModel, VerifyPasswordState>(
      listener: (context, state) {

        if (state is LoadingVerifyPasswordState) {
          showLoadingDialog(context);
        } else if (state is ErrorVerifyPasswordState) {
          var message = extractErrorMessage(state.exception);
          Navigator.of(context).pop(); // Close loading dialog
          showErrorDialog(context, message);
        } else if (state is SuccessVerifyPasswordState) {

          Navigator.of(context).popUntil((route)=>route.isFirst); // Close dialogs before showing success
          Navigator.pushNamed(context, RoutesManager.resetPasswordRoute);

        }
      },
      listenWhen: (previous, current) {
        if(current is LoadingVerifyPasswordState || current is ErrorVerifyPasswordState || current is SuccessVerifyPasswordState)
        {
          return true;
        }
        return false ;
      },
     child: SizedBox.shrink()// Placeholder when no loading state

    );
  }
}