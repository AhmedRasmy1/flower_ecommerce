
import 'package:flower_ecommerce/Features/auth/presentation/view_model/signup_view_model/signup_state.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/style_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/custom_exception.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../view_model/signup_view_model/signup_cubit.dart';

class BlocConsumerForSignupPage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController rePasswordController;
  final TextEditingController phoneController;
  final Color buttonColor;
  final Function(Color) updateButtonColor;
  final RegisterViewModel viewModel;

  const BlocConsumerForSignupPage({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.rePasswordController,
    required this.phoneController,
    required this.buttonColor,
    required this.updateButtonColor,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterViewModel, RegisterState>(
      listener: (context, state) {
        if (state is LoadingRegisterState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Dialog(
                backgroundColor: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.pink,
                  ),
                ),
              );
            },
          );
        }
        if (state is ErrorRegisterState) {
          Navigator.pop(context);
          String? message;
          if (state.exception is ServerError) {
            message = (state.exception as ServerError).serverMessage ;
          }
          showCustomDialog(context, message);

        }
        if (state is SuccessRegisterState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, RoutesManager.loginRoute);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          buttonColor: buttonColor,
          title: AppStrings.signUp,
          onPressed: () {
            validationMethod(
              actionPress: () {
                viewModel.register(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  password: rePasswordController.text,
                  rePassword: rePasswordController.text,
                  phone: phoneController.text,
                );
              },
              formKey: formKey,
              updateButtonColor: updateButtonColor,
            );
          },
        );
      },
    );
  }
}


void showCustomDialog(BuildContext context, String? message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message??'Error',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.pink,
                  ),
                  child:  Text('Close',style: getSemiBoldStyle(color: ColorManager.white,fontSize: AppSize.s14),),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
