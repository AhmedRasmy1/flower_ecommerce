import 'package:flower_ecommerce/core/functions/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/signup_view_model/signup_cubit.dart';
import '../widgets/bloc_consumer_signin_page.dart';
import '../widgets/choose_gender.dart';
import '../widgets/custom_auth_prompt.dart';

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
  Color buttonColor = ColorManager.darkGrey;
  bool _hasStartedTyping = false;

  @override
  void initState() {
    viewModel = getIt.get<RegisterViewModel>();
    super.initState();
  }

  void _onTextChanged(String text) {
    if (!_hasStartedTyping && text.isNotEmpty) {
      _hasStartedTyping = true;
      _phoneController.text = '+2$text';
      _phoneController.selection =
          TextSelection.collapsed(offset: _phoneController.text.length);
    }
    if (text.isEmpty) {
      _hasStartedTyping = false;
    }
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
                              validator: (value) => validateString(
                                value: value!,
                                messageLength: AppStrings.messageLength3,
                                messageInvalid: AppStrings.invalidInput,
                                message: AppStrings.entervalidLastName,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _lastNameController,
                              labelText: AppStrings.lastName,
                              hintText: AppStrings.enterYourLastName,
                              validator: (value) => validateString(
                                value: value!,
                                messageLength: AppStrings.messageLength3,
                                messageInvalid: AppStrings.invalidInput,
                                message: AppStrings.entervalidLastName,
                              ),
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
                        validator: (value) => validateEmail(
                          value: value!,
                          message: AppStrings.emailIsEmpty,
                          messageInvalid: AppStrings.enterValidEmail,
                        ),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _passwordController,
                              labelText: AppStrings.password,
                              hintText: AppStrings.enterYourPassword,
                              obscureText: true,
                              validator: (value) => validatePassword(
                                  password: _passwordController.text,
                                  messageInvalid:
                                      AppStrings.passwordInvalidFormat,
                                  messageLength:
                                      AppStrings.passwordCharactersLong,
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
                              obscureText: true,
                              validator: (value) => validatePasswordMatch(
                                  messageIsEmpty: AppStrings.passwordIsEmpty,
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
                        onChanged: _onTextChanged,
                        obscureText: false,
                        validator: (value) => validateNotEmpty(
                          value,
                          AppStrings.enterValidPhoneNumber,
                        ),
                      ),
                      const SizedBox(height: AppSize.s16),
                      ChooseGender(viewModel: viewModel),
                      const AuthPrompt(
                        message: AppStrings.agreeTermsConditions,
                        userAccess: AppStrings.termsConditions,
                        color: ColorManager.black,
                        routeName: RoutesManager.loginRoute,

                        /// change
                      ),
                      const SizedBox(height: AppSize.s48),
                      BlocConsumerForSignupPage(
                        isSelectGender: isSelectGender,
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        rePasswordController: _rePasswordController,
                        phoneController: _phoneController,
                        buttonColor: buttonColor,
                        viewModel: viewModel,
                        updateButtonColor: (newColor) {
                          setState(() {
                            if (isSelectGender) {
                              buttonColor = newColor;
                              viewModel.isSelectGender = false;
                            } else {
                              viewModel.isSelectGender = true;
                            }
                          });
                        },
                      ),
                      const AuthPrompt(
                        message: AppStrings.alreadyHaveAccount,
                        userAccess: AppStrings.login,
                        routeName: RoutesManager.loginRoute,
                      )
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
