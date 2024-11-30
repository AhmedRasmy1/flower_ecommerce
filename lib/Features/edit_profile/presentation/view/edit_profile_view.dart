import 'dart:developer';

import 'package:flower_ecommerce/Features/edit_profile/presentation/viewmodels/editprofile_cubit.dart';
import 'package:flower_ecommerce/Features/profile/domain/entities/profile_entity.dart';
import 'package:flower_ecommerce/core/common/custom_exception.dart';
import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flower_ecommerce/core/functions/helper.dart';
import 'package:flower_ecommerce/core/resources/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:motion_toast/motion_toast.dart';
import '../widgets/custom_circle_avatar.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<EditProfileView> {
  late ProfileEntity profileInfo;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  final TextEditingController _passwordController = TextEditingController();
  late TextEditingController _phoneController;
  late TextEditingController _userGenderController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.pink;
  late EditprofileCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<EditprofileCubit>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileInfo = ModalRoute.of(context)!.settings.arguments as ProfileEntity;
    _firstNameController =
        TextEditingController(text: profileInfo.user?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: profileInfo.user?.lastName ?? '');
    _emailController =
        TextEditingController(text: profileInfo.user?.email ?? '');
    _phoneController =
        TextEditingController(text: profileInfo.user?.phone ?? '');
    _userGenderController = TextEditingController(
        text: profileInfo.user?.gender == 'male'
            ? AppStrings.male
            : profileInfo.user?.gender == 'female'
                ? AppStrings.female
                : '');
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
                        title: AppStrings.editProfile,
                        color: ColorManager.black,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: AppSize.s24),
                      const CustomCircleAvatar(),
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
                      CustomTextFormField(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p16),
                          child: SvgPicture.asset('assets/images/password.svg'),
                        ),
                        enabled: true,
                        // keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        labelText: AppStrings.password,
                        // hintText: AppStrings.enterYourPassword,
                        // obscureText: true,
                        suffix: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, RoutesManager.changePasswordRoute);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: AppPadding.p16),
                            child: Text(
                              AppStrings.change,
                              style: TextStyle(
                                color: ColorManager.pink,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeightManager.semiBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus && _phoneController.text.isEmpty) {
                            _phoneController.text = '+2';
                          }
                        },
                        child: CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          labelText: AppStrings.phoneNumber,
                          hintText: AppStrings.enterPhoneNumber,
                          obscureText: false,
                          validator: (value) => validateNotEmpty(
                              value, AppStrings.enterValidPhoneNumber),
                        ),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        children: [
                          Text(
                            AppStrings.gender,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s22,
                              fontWeight: FontWeightManager.semiBold,
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s24,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio<String>(
                                  fillColor: WidgetStateProperty.all<Color>(
                                      ColorManager.pink),
                                  value: AppStrings.male,
                                  groupValue: _userGenderController.text,
                                  activeColor: ColorManager.pink,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _userGenderController.text = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  AppStrings.male,
                                  style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio<String>(
                                  fillColor: WidgetStateProperty.all<Color>(
                                      ColorManager.pink),
                                  value: AppStrings.female,
                                  groupValue: _userGenderController.text,
                                  activeColor: ColorManager.pink,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _userGenderController.text = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  AppStrings.female,
                                  style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s48),
                      BlocConsumer<EditprofileCubit, EditprofileState>(
                        listener: (context, state) {
                          if (state is EditprofileLoading) {
                            CustomLoadingDialog.show(context);
                          } else if (state is EditprofileSuccess) {
                            MotionToast.success(
                              description:
                                  const Text(AppStrings.profileUpdated),
                              animationType: AnimationType.fromLeft,
                            ).show(context);
                          } else if (state is EditprofileFail) {
                            String? message;
                            if (state.exception is ServerError) {
                              message = (state.exception as ServerError)
                                      .serverMessage ??
                                  'somethingWentWrong';
                              log('=================$message');
                            } else {
                              message = 'somethingWentWrong';
                            }
                            MotionToast.error(
                              description: Text(message),
                              animationType: AnimationType.fromLeft,
                            ).show(context);
                          }
                        },
                        builder: (context, state) {
                          return CustomElevatedButton(
                            buttonColor: buttonColor,
                            title: AppStrings.update,
                            onPressed: () {
                              validationMethod(
                                actionPress: () {
                                  viewModel.editProfile(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailController.text,
                                    _phoneController.text,
                                  );
                                },
                                updateButtonColor: (Color color) {
                                  setState(() {
                                    buttonColor = color;
                                  });
                                },
                                formKey: _formKey,
                              );
                            },
                          );
                        },
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
