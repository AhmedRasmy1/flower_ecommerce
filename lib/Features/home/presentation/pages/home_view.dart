import '../widgets/skeleton_home.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../viewmodels/home_cubit.dart';
import '../widgets/custom_bestseller_container.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_category_container.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_location.dart';
import '../widgets/custom_occasion_container.dart';
import '../widgets/custom_search_field.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit viewModel;
  @override
  void initState() {
    viewModel = getIt<HomeCubit>();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getHomeData(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p8,
              right: AppPadding.p16,
              left: AppPadding.p16,
            ),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // if (state is HomeLoading) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Loading...'),
                //     ),
                //   );
                // } else if (state is HomeFail) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text(state.exception.toString()),
                //     ),
                //   );
                // }
              },
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const SkeletonHome();
                  //   Center(
                  //   child: Image.asset(
                  //     AssetsManager.loadingLoading1,
                  //     width: 100,
                  //     height: 100,
                  //   ),
                  // );
                } else if (state is HomeSuccess) {
                  var bestSeller = state.homeEntity.bestSeller;
                  var occasions = state.homeEntity.occasions;
                  var homeCategories = state.homeEntity.categories;
                  // var product = state.homeEntity.products;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomAppBar(
                              image: AssetsManager.appLogo,
                              title: AppStrings.flowry,
                              color: ColorManager.pink,
                              fontFamily:
                                  GoogleFonts.imFellEnglish().fontFamily,
                            ),
                            const SizedBox(
                              width: AppSize.s16,
                            ),
                            const Expanded(child: CustomTextFieldForSearch())
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),
                        const CustomLocation(
                          icon: AssetsManager.locationIcon,
                          address: AppStrings.address,
                          arrow: AssetsManager.arrowIcon,
                        ),
                        const SizedBox(height: AppSize.s24),
                        const CustomHeader(title: AppStrings.discover),
                        const SizedBox(height: AppSize.s16),
                        const CustomCard(),
                        const SizedBox(height: AppSize.s24),
                        CustomHeader(
                          title: AppStrings.categories,
                          viewAll: AppStrings.viewAll,
                          onTap: () {
                            LayoutCubit.get(context).changeIndex(1);
                          },
                        ),
                        const SizedBox(height: AppSize.s16),
                        CustomCategoryContainer(
                          categories: homeCategories ?? [],
                        ),
                        const SizedBox(height: AppSize.s24),
                        CustomHeader(
                          title: AppStrings.bestSeller,
                          viewAll: AppStrings.viewAll,
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesManager.bestSellerRoute);
                          },
                        ),
                        const SizedBox(height: AppSize.s16),
                        CustomBestSellerContainer(
                          bestSeller: bestSeller ?? [],
                        ),
                        const SizedBox(height: AppSize.s16),
                        CustomHeader(
                          title: AppStrings.occasion,
                          viewAll: AppStrings.viewAll,
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesManager.occassionViewRoute);
                          },
                        ),
                        const SizedBox(height: AppSize.s16),
                        CustomOccasionContainer(
                          occasion: occasions ?? [],
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('Error'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
