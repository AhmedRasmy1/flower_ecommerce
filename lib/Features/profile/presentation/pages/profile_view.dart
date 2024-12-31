import 'package:flower_ecommerce/Features/notifications_list/presentation/view_model/notfications_list_state.dart';
import 'package:flower_ecommerce/Features/notifications_list/presentation/view_model/notifictions_list_cubit.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../view_model/profile_state.dart';
import '../view_model/profile_view_model.dart';
import '../widgets/build_profile_content.dart';
import '../widgets/build_profile_content_insted.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late NotificationsListViewModel notificationsViewModel;
  late ProfileViewModel viewModel;
  late String savedToken;
  int notificationsCount = 0;

  @override
  void initState() {
    super.initState();
    savedToken = CacheService.getData(key: CacheConstants.userToken) ?? '';
    viewModel = getIt<ProfileViewModel>();
    viewModel.getProfileData("Bearer $savedToken");
    notificationsViewModel = getIt<NotificationsListViewModel>();
    notificationsViewModel.getAllNotifications(
      "Bearer ${CacheService.getData(key: CacheConstants.userToken)}",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => notificationsViewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p8,
                right: AppPadding.p16,
                left: AppPadding.p16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppBar(
                    image: AssetsManager.appLogo,
                    title: AppStrings.flowry,
                    color: ColorManager.pink,
                    fontFamily: GoogleFonts.imFellEnglish().fontFamily,
                  ),
                  BlocBuilder<NotificationsListViewModel,
                      NotificationsListState>(builder: (context, state) {
                    if (state is SuccessNotificationsListState) {
                      notificationsCount =
                          state.notificationsListEntity.notifications?.length ??
                              0;
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesManager.notificationsListView);
                      },
                      child: Stack(
                        children: [
                          Icon(Icons.notifications,
                              size: 28, color: Colors.grey),
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: Text(
                                "${notificationsCount}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            BlocProvider(
              create: (_) => viewModel,
              child: BlocBuilder<ProfileViewModel, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingProfileState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessProfileState) {
                    return buildProfileContent(context, state.profileEntity);
                  } else if (state is ErrorProfileState) {
                    return buildProfileContentInstent(context, null);
                  } else {
                    return const Center(
                      child: Text("No data available"),
                    );
                  }
                },
              ),
            ),
          ]),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
        //   child: Center(
        //     child: IconButton(
        //       onPressed: () {
        //         showDialog(
        //           context: context,
        //           builder: (_) => const LogoutConfirmationDialog(),
        //           barrierDismissible: false,
        //         );
        //       },
        //       icon: const Icon(Icons.logout, size: 30, color: Colors.red),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
