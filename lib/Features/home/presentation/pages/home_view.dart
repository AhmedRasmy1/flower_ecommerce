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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const SkeletonHome();
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
                        CustomLocation(
                          icon: AssetsManager.locationIcon,
                          // address: AppLocalizations.of(context)!.address,
                          arrow: AssetsManager.arrowIcon,
                        ),
                        const SizedBox(height: AppSize.s24),
                        CustomHeader(
                            title: AppLocalizations.of(context)!.discover),
                        const SizedBox(height: AppSize.s16),
                        const CustomCard(),
                        const SizedBox(height: AppSize.s24),
                        CustomHeader(
                          title: AppLocalizations.of(context)!.categories,
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
                          title: AppLocalizations.of(context)!.bestSeller,
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
                          title: AppLocalizations.of(context)!.occasion,
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
