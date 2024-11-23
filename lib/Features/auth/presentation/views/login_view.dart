import '../view_model/login_view_model/login_cubit.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../view_model/login_view_model/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  late LoginViewModel viewModel;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool rememberMe = false;

  @override
  void initState() {
    viewModel = getIt.get<LoginViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: BlocListener<LoginViewModel, LoginState>(
          listener: (context, state) {
            if (state is SuccessLoginState) {
              Navigator.pushReplacementNamed(
                  context, RoutesManager.layoutRoute);
            } else if (state is ErrorLoginState) {
              setState(() {
                _errorMessage = AppStrings.invalidEmailOrPassword;
              });
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: context.screenHeight * 0.06,
                      left: context.screenWidth * 0.08),
                  child: const Text(
                    AppStrings.login,
                    style: TextStyle(
                        color: ColorManager.lightGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Container(
                  width: context.screenWidth * 0.935,
                  padding: EdgeInsets.only(left: context.screenWidth * 0.06),
                  child: CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                    validator: (value) =>
                        validateNotEmpty(value, AppStrings.enterValidEmail),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s24,
                ), //
                Container(
                  width: context.screenWidth * 0.935,
                  padding: EdgeInsets.only(left: context.screenHeight * 0.03),
                  child: CustomTextFormField(
                    controller: _passwordController,
                    labelText: AppStrings.password,
                    hintText: AppStrings.enterYourPassword,
                    validator: (value) => validatePasswordMatch(
                        password: _passwordController.text,
                        confirmPassword: _passwordController.text,
                        message: AppStrings.passwordNotMatch),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: context.screenWidth * 0.1,
                      top: context.screenHeight * 0.03),
                  child: Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                            viewModel.rememberMe = rememberMe;
                          });
                        },
                      ),
                      const Text(
                        AppStrings.rememberMe,
                        style: TextStyle(
                            color: ColorManager.lightGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.22,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesManager.forgetPasswordRoute);
                        },
                        child: Column(
                          children: [
                            const Text(AppStrings.forgetPassword,
                                style: TextStyle(
                                    color: ColorManager.lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13)),
                            Container(
                              width: context.screenWidth * 0.26,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: ColorManager.lightGrey),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                if (_errorMessage != null)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                Center(
                  child: SizedBox(
                    width: context.screenWidth * 0.91,
                    height: context.screenHeight * 0.063,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _errorMessage = null;
                        });
                        if (_formKey.currentState?.validate() ?? false) {
                          viewModel.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: const Text(
                        AppStrings.login,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: SizedBox(
                    width: context.screenWidth * 0.9,
                    height: context.screenHeight * 0.063,
                    child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, RoutesManager.tryScreenRoute);
//                       },

                      onPressed: () {
                        Navigator.pushNamed(context, RoutesManager.layoutRoute);
                      },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: const BorderSide(
                                  color: ColorManager.placeHolderColor))),
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, RoutesManager.layoutRoute);
//                       },

                      child: const Text(
                        AppStrings.continueAsGuest,
                        style: TextStyle(
                            color: ColorManager.placeHolderColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.notHaveAnAccount,
                          style: TextStyle(
                              color: ColorManager.placeHolderColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context, RoutesManager.registerRoute,
                            // arguments: {'email':_emailController.text}
                          );
                        },
                        child: Column(
                          children: [
                            const Text(AppStrings.signUp,
                                style: TextStyle(
                                    color: ColorManager.pink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                            Container(
                              height: 0,
                              width: context.screenWidth * 0.15,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: ColorManager.pink),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
