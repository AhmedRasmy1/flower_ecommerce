import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/signup_view_model/signup_cubit.dart';
import '../widgets/bloc_consumer_signin_page.dart';
import '../widgets/choose_gender.dart';
import '../widgets/custom_auth_prompt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    // final arguments =
    // ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // final String? email = arguments['email'] as String??'';
    // print("=========================$email========================");
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
                        title: AppLocalizations.of(context)!.signUp,
                        color: ColorManager.black,
                        onTap: () {
                          Navigator.pop(context);
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
                              labelText:
                                  AppLocalizations.of(context)!.firstName,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourFirstName,
                              validator: (value) => validateString(
                                value: value!,
                                messageLength: AppLocalizations.of(context)!
                                    .messageLength3,
                                messageInvalid:
                                    AppLocalizations.of(context)!.invalidInput,
                                message: AppLocalizations.of(context)!
                                    .entervalidLastName,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _lastNameController,
                              labelText: AppLocalizations.of(context)!.lastName,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourLastName,
                              validator: (value) => validateString(
                                value: value!,
                                messageLength: AppLocalizations.of(context)!
                                    .messageLength3,
                                messageInvalid:
                                    AppLocalizations.of(context)!.invalidInput,
                                message: AppLocalizations.of(context)!
                                    .entervalidLastName,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        labelText: AppLocalizations.of(context)!.email,
                        hintText: AppLocalizations.of(context)!.enterYourEmail,
                        validator: (value) => validateEmail(
                          value: value!,
                          message: AppLocalizations.of(context)!.emailIsEmpty,
                          messageInvalid:
                              AppLocalizations.of(context)!.enterValidEmail,
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
                              labelText: AppLocalizations.of(context)!.password,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourPassword,
                              obscureText: true,
                              validator: (value) => validatePassword(
                                  password: _passwordController.text,
                                  messageInvalid: AppLocalizations.of(context)!
                                      .passwordInvalidFormat,
                                  messageLength: AppLocalizations.of(context)!
                                      .passwordCharactersLong,
                                  message: AppLocalizations.of(context)!
                                      .passwordNotMatch),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _rePasswordController,
                              labelText:
                                  AppLocalizations.of(context)!.confirmPassword,
                              hintText: AppLocalizations.of(context)!
                                  .enterYourConfirmPassword,
                              obscureText: true,
                              validator: (value) => validatePasswordMatch(
                                  messageIsEmpty: AppLocalizations.of(context)!
                                      .passwordIsEmpty,
                                  password: _passwordController.text,
                                  confirmPassword: _rePasswordController.text,
                                  message: AppLocalizations.of(context)!
                                      .passwordNotMatch),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: AppLocalizations.of(context)!.phoneNumber,
                        hintText:
                            AppLocalizations.of(context)!.enterPhoneNumber,
                        onChanged: _onTextChanged,
                        obscureText: false,
                        validator: (value) => validateNotEmpty(
                          value,
                          AppLocalizations.of(context)!.enterValidPhoneNumber,
                        ),
                      ),
                      const SizedBox(height: AppSize.s16),
                      ChooseGender(viewModel: viewModel),
                      AuthPrompt(
                        message:
                            AppLocalizations.of(context)!.agreeTermsConditions,
                        userAccess:
                            AppLocalizations.of(context)!.termsConditions,
                        color: ColorManager.black,
                        routeName: RoutesManager.loginRoute,

                        /// change
                      ),
                      const SizedBox(height: AppSize.s48),
                      BlocConsumerForSignupPage(
                        isSelectGender: viewModel.isSelectGender,
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
                            if (viewModel.isSelectGender) {
                              buttonColor = newColor;
                              if (viewModel.isSelectGender2 == true) {
                                viewModel.isSelectGender = true;
                              }
                            } else {
                              if (viewModel.isSelectGender2 == false) {
                                viewModel.isSelectGender = true;
                              }
                            }
                          });
                        },
                      ),
                      AuthPrompt(
                        message:
                            AppLocalizations.of(context)!.alreadyHaveAccount,
                        userAccess: AppLocalizations.of(context)!.login,
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
