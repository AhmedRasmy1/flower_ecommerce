import 'package:flower_ecommerce/Features/products/domain/entities/products_entities.dart';
import 'package:flower_ecommerce/Features/products/presentation/manager/all_products_cubit.dart';
import 'package:flower_ecommerce/Features/products/presentation/manager/all_products_state.dart';
import 'package:flower_ecommerce/Features/search/presentation/views/empty_search_view.dart';
import 'package:flower_ecommerce/Features/search/presentation/views/not_empty_search.dart';
import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/font_manager.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  late AllProductsViewModel viewModel;
  late List<ProductsEntities> allProducts;

  // List<ProductsEntities> filteredProducts = [];

  @override
  void initState() {
    viewModel = getIt.get<AllProductsViewModel>()
      ..doIntent(GetAllProductsAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p8,
              right: AppPadding.p16,
              left: AppPadding.p16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomAppBar(
                        image: AssetsManager.backIcon,
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (query) {
                        viewModel.searchProducts(query);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p8,
                          horizontal: AppPadding.p16,
                        ),
                        hintText: AppLocalizations.of(context)!.search,
                        hintStyle: TextStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.grey,
                          fontWeight: FontWeightManager.medium,
                        ),
                        prefixIcon: SizedBox(
                          width: AppSize.s18,
                          height: AppSize.s18,
                          child: SvgPicture.asset(
                            AssetsManager.searchIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorManager.offWhite,
                            width: AppSize.w1_5,
                          ),
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorManager.offWhite,
                          ),
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                      ),
                    ))
                  ],
                ),
                // SizedBox(
                //   height: 180,
                // ),
                Expanded(child:
                    BlocBuilder<AllProductsViewModel, AllProductsState>(
                        builder: (context, state) {
                     if (viewModel.filteredProducts.isEmpty) {
                      return const EmptySearchView();
                     } else {
                       return ListView.builder(
                        itemCount: viewModel.filteredProducts.length,
                        itemBuilder: (context, index) => NotEmptySearch(
                            index: index,
                            filteredProducts: viewModel.filteredProducts));
                  }
                })),
                //Container(height: 200, width: 350, child: NotEmptySearch()),
                //EmptySearchView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
