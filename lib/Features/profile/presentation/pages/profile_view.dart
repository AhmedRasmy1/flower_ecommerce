import 'package:flower_ecommerce/Features/auth/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entities/profile_entity.dart';
import '../view_model/profile_state.dart';
import '../view_model/profile_view_model.dart';
import '../widgets/build_profile_content.dart';
import 

  ProfileView({super.key});'../widgets/option_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String savedToken = SharedData.getData(key: StringCache.userToken);

  late ProfileViewModel viewModel;

  @override
  void initState() {
    super.initState();
    String token = "Bearer $savedToken";

    viewModel = getIt.get<ProfileViewModel>();
    viewModel.getProfileData(token); // Adjust parameters if needed
  }

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text('ProfileView'),
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p8,
        right: AppPadding.p16,
        left: AppPadding.p16,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => const LogoutConfirmationDialog(),
                        barrierDismissible: false);
                  },
                  icon: const Icon(Icons.logout,))),
         // LogoutConfirmationDialog(),
        ],
      ),
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppBar(
                  image: AssetsManager.appLogo,
                  title: AppStrings.flowry,
                  color: ColorManager.pink,
                  fontFamily: GoogleFonts.imFellEnglish().fontFamily,
                ),
                const Stack(
                  children: [
                    Icon(Icons.notifications, size: 28, color: Colors.grey),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            BlocProvider(
              create: (context) => viewModel,
              child: BlocBuilder<ProfileViewModel, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingProfileState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessProfileState) {
                    final profile = state.profileEntity;
                    return Expanded(
                        child: buildProfileContent(context, profile));
                  } else if (state is ErrorProfileState) {
                    return Center(
                      child: Text(
                        state.exception?.toString() ?? "An error occurred",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("No data available"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
