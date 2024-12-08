import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../best_seller/domain/entities/best_seller_entity.dart';
import '../../../products_details/presentation/views/product_details_view.dart';
import '../../domain/entities/products_entities.dart';
import '../manager/all_products_cubit.dart';
import '../manager/all_products_state.dart';
import '../widgets/cart_product.dart';
import '../widgets/skeleton_body.dart';

class GirdBodyOfProducts extends StatefulWidget {
  const GirdBodyOfProducts({
    super.key,
    required this.page,
    required this.pageId,
  });

  final EnumPage page;
  final String pageId;

  @override
  State<GirdBodyOfProducts> createState() => _GirdBodyOfProductsState();
}

class _GirdBodyOfProductsState extends State<GirdBodyOfProducts> {
  late AllProductsViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AllProductsViewModel>()
      ..doIntent(GetAllProductsAction());
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager.pink,
      onRefresh: () async {
        getIt.get<AllProductsViewModel>().doIntent(GetAllProductsAction());
      },
      child: BlocProvider(
        create: (context) => viewModel,
        child: BlocConsumer<AllProductsViewModel, AllProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SuccessAllProductsState) {
              List<ProductsEntities> allData =
                  //! chat gpt
                  state.categoriesEntities?.products ?? [];
              List<ProductsEntities> filteredByOccasion =
                  allData.where((product) {
                if (widget.pageId.isEmpty) {
                  return true;
                }
                if (widget.page.name == 'Category') {
                  return product.category == widget.pageId;
                } else if (widget.page.name == 'Occasion') {
                  return product.occasion == widget.pageId;
                } else {
                  return true;
                }
              }).toList();
              return CustomCardAll(filteredByOccasion: filteredByOccasion);
            } else {
              return const SkeletonBody();
            }
          },
        ),
      ),
    );
  }
}

class CustomCardAll extends StatelessWidget {
  const CustomCardAll({
    super.key,
    this.filteredByOccasion,
    this.bestSellerEntity,
  });

  final List<ProductsEntities>? filteredByOccasion;
  final List<BestSellerEntity>? bestSellerEntity;

  @override
  Widget build(BuildContext context) {
    final activeList = filteredByOccasion?.isNotEmpty == true
        ? filteredByOccasion
        : bestSellerEntity;

    return LayoutBuilder(
      builder: (context, constraints) {
        double aspectRatio = (constraints.maxWidth > 500) ? 0.67 : 0.6;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: activeList != null && activeList.isNotEmpty
              ? GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 500 ? 3 : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: activeList.length,
                  itemBuilder: (context, index) {
                    //! here we change InkWell to GestureDetector
                    return GestureDetector(
                      // splashColor: Colors.pink.withOpacity(.2),
                      // borderRadius: BorderRadius.circular(12),
                      // highlightColor: Colors.pink.withOpacity(0.1),
                      onTap: () {
                        log('go to details');
                        if (activeList is List<ProductsEntities>) {
                          final product = activeList[index];

                          if (product.id?.isNotEmpty == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsView(
                                  productId: product.id ?? '',
                                ),
                              ),
                            );
                          }
                        } else if (activeList is List<BestSellerEntity>) {
                          final bestSeller = activeList[index];

                          if (bestSeller.id?.isNotEmpty == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsView(
                                  productId: bestSeller.id ?? '',
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: activeList is List<ProductsEntities>
                          ? CartProduct(
                              productId: activeList[index].id!,
                              priceAfterDiscount:
                                  activeList[index].priceAfterDiscount,
                              price: activeList[index].price,
                              imgCover: activeList[index].imgCover,
                              title: activeList[index].title,
                            )
                          : CartProduct(
                              priceAfterDiscount:
                                  (activeList as List<BestSellerEntity>)[index]
                                      .priceAfterDiscount,
                              productId: activeList[index].id!,
                              price: (activeList)[index].price,
                              imgCover: (activeList)[index].imgCover,
                              title: (activeList)[index].title,
                            ),
                    );
                  },
                )
              : Center(
                  child: SvgPicture.asset(
                    'assets/images/rose-day.svg',
                    width: 300,
                    height: 300,
                  ),
                ),
        );
      },
    );
  }
}

enum EnumPage {
  category('Category'),
  occasion('Occasion');

  final String name;

  const EnumPage(this.name);

  String getName() {
    return name;
  }
}
