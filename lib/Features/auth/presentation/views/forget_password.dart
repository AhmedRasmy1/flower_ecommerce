import '../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../../../core/widgets/show_loading_dialog.dart';
import '../view_model/forget_password_view_model/forget_password_cubit.dart';
import '../view_model/forget_password_view_model/forget_password_state.dart';
import 'email_verification_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late ForgetPasswordViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ForgetPasswordViewModel>();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.password),
        ),
        body: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
          listenWhen: (previous, current) {
            if (current is LoadingForgetPasswordState ||
                current is ErrorForgetPasswordState ||
                current is SuccessForgetPasswordState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is LoadingForgetPasswordState) {
              showLoadingDialog(context);
            } else if (state is ErrorForgetPasswordState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is SuccessForgetPasswordState) {
              final email = _emailController.text;
              Navigator.of(context).popUntil((route) =>
                  route.isFirst); // Close dialogs before showing success
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OtpVerificationPage(),
                      settings: RouteSettings(arguments: email)));
            }
          },
          child: Form(
            key: _formKey,
            onChanged: validateInputs,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(AppStrings.forgetPassword),
                    const SizedBox(height: AppSize.s24),
                    const Text(
                      AppStrings.forgetPasswordMessageHeader,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterYourEmail,
                      obscureText: false,
                      validator: (value) =>
                          validateNotEmpty(value, AppStrings.enterValidEmail),
                    ),
                    const SizedBox(height: AppSize.s48),
                    BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
                      builder: (context, state) {
                        if (state is LoadingForgetPasswordState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isButtonEnabled == true) {
                                  forgetPassword();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.pink),
                              child: const Text(
                                AppStrings.confirmButton,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void forgetPassword() {
    String email = _emailController.text;
    viewModel.doIntent(ForgetPasswordIntent(email));
  }
}
