import 'package:flower_ecommerce/core/functions/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/signup_view_model/signup_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterViewModel viewModel;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.pink;
  bool isPasswordHidden1 = true;
  bool isPasswordHidden2 = true;

  @override
  void initState() {
    viewModel = getIt.get<RegisterViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p16,
                    right: AppPadding.p16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: AppStrings.signUp,
                        color: ColorManager.black,
                        onTap: () {
                          ///  Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _firstNameController,
                              labelText: AppStrings.firstName,
                              hintText: AppStrings.enterYourFirstName,
                              obscureText: false,
                              validator: (value) => validateNotEmpty(
                                  value, AppStrings.entervalidfirstName),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _lastNameController,
                              labelText: AppStrings.lastName,
                              hintText: AppStrings.enterYourLastName,
                              obscureText: false,
                              validator: (value) => validateNotEmpty(
                                  value, AppStrings.entervalidLastName),
                            ),
                          ),
                        ],
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
                      const SizedBox(height: AppSize.s24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _rePasswordController,
                              labelText: AppStrings.password,
                              hintText: AppStrings.enterYourPassword,
                              obscureText: isPasswordHidden2,
                              validator: (value) => validatePasswordMatch(
                                  password: _passwordController.text,
                                  confirmPassword: _rePasswordController.text,
                                  message: AppStrings.passwordNotMatch),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _rePasswordController,
                              labelText: AppStrings.confirmPassword,
                              hintText: AppStrings.enterYourConfirmPassword,
                              obscureText: isPasswordHidden2,
                              validator: (value) => validatePasswordMatch(
                                  password: _passwordController.text,
                                  confirmPassword: _rePasswordController.text,
                                  message: AppStrings.passwordNotMatch),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: AppStrings.phoneNumber,
                        hintText: AppStrings.enterPhoneNumber,
                        obscureText: false,
                        validator: (value) => validateNotEmpty(
                          value,
                          AppStrings.enterValidPhoneNumber,
                        ),
                      ),
                      const SizedBox(height: AppSize.s48),
                      CustomElevatedButton(
                        buttonColor: buttonColor,
                        title: AppStrings.signUp,
                        onPressed: () {
                          viewModel.register(
                              // firstName: _firstNameController.text,
                              // lastName: _lastNameController.text,
                              // email: _emailController.text,
                              // password: _passwordController.text,
                              // rePassword: _rePasswordController.text,
                              // phone:'+201200131125',
                              // gender: 'male'
                              );
                        },
                      )
                      // BlocConsumerForSignupPage(
                      //   formKey: _formKey,
                      //   emailController: _emailController,
                      //   passwordController: _passwordController,
                      //   userNameController: _userNameController,
                      //   firstNameController: _firstNameController,
                      //   lastNameController: _lastNameController,
                      //   confirmPasswordController: _confirmPasswordController,
                      //   phoneController: _phoneController,
                      //   buttonColor: buttonColor,
                      //   viewModel: viewModel,
                      //   updateButtonColor: (newColor) {
                      //     setState(() {
                      //       buttonColor = newColor;
                      //     });
                      //   },
                      // ),
                      // const AuthPrompt(
                      //   message: AppStrings.alreadyHaveAccount,
                      //   userAccess: AppStrings.login,
                      //   routeName: RoutesManager.loginRoute,
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
