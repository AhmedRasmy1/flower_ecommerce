import 'package:flower_ecommerce/Features/home/presentation/viewmodels/home_cubit.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_bestseller_container.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_card.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_category_container.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_header.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_location.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_occasion_container.dart';
import 'package:flower_ecommerce/Features/home/presentation/widgets/custom_search_field.dart';
import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flower_ecommerce/core/resources/values_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
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
                if (state is HomeLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Loading...'),
                    ),
                  );
                } else if (state is HomeFail) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.exception.toString()),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                    child: Image.asset(AssetsManager.loadingLoading1),
                  );
                } else if (state is HomeSuccess) {
                  var bestSeller = state.homeEntity.bestSeller;
                  var occasions = state.homeEntity.occasions;
                  var product = state.homeEntity.products;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            CustomAppBar(
                              image: AssetsManager.appLogo,
                              title: AppStrings.flowry,
                              color: ColorManager.pink,
                            ),
                            SizedBox(
                              width: AppSize.s16,
                            ),
                            Expanded(child: CustomTextFieldForSearch())
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
                        const CustomHeader(
                          title: AppStrings.categories,
                          viewAll: AppStrings.viewAll,
                        ),
                        const SizedBox(height: AppSize.s16),
                        const CustomCategoryContainer(),
                        const SizedBox(height: AppSize.s24),
                        const CustomHeader(
                          title: AppStrings.bestSeller,
                          viewAll: AppStrings.viewAll,
                        ),
                        const SizedBox(height: AppSize.s16),
                        CustomBestSellerContainer(
                          bestSeller: bestSeller ?? [],
                        ),
                        const SizedBox(height: AppSize.s16),
                        const CustomHeader(
                          title: AppStrings.occasion,
                          viewAll: AppStrings.viewAll,
                        ),
                        const SizedBox(height: AppSize.s16),
                        CustomOccasionContainer(
                          occasion: occasions ?? [],
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Image.asset(AssetsManager.loadingLoading1),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
