import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/common/add_to_cart/data/models/request/add_to_cart_req_body.dart';
import '../../../../core/common/add_to_cart/manager/cubit/add_to_cart_view_model.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/error_toast.dart';
import '../../../../core/widgets/success_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../view_model/product_details_cubit.dart';
import '../view_model/product_details_state.dart';
import '../widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsView extends StatefulWidget {
  final String productId;

  const ProductDetailsView({required this.productId, super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late ProductDetailsViewModel viewModel;

  int activeIndex = 0;

  List<String> carouselSliderItems = [
    'assets/images/bouquet.png',
    'assets/images/bouquet.png',
    'assets/images/bouquet.png',
    'assets/images/bouquet.png',
  ];

  @override
  void initState() {
    viewModel = getIt.get<ProductDetailsViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getProductDetails(widget.productId),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ProductDetailsViewModel, ProductDetailsState>(
          builder: (context, state) {
            if (state is LoadingProductDetailsState) {
              return const LoadingIndicator();
            } else if (state is ErrorProductDetailsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessProductDetailsState) {
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: ColorManager.pink,
                          elevation: 0,
                          pinned: true,
                          stretch: true,
                          flexibleSpace: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              final double top = constraints.biggest.height;
                              final Color titleColor = top > 100
                                  ? Colors.transparent
                                  : ColorManager.white;

                              return FlexibleSpaceBar(
                                centerTitle: true,
                                title: Text(
                                  textAlign: TextAlign.center,
                                  state.productDetailsEntity.title!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: titleColor,
                                  ),
                                ),
                                background: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CarouselSlider.builder(
                                      itemCount: state.productDetailsEntity
                                              .images?.length ??
                                          0,
                                      itemBuilder: (context, index, realIndex) {
                                        final imageUrl = state
                                                .productDetailsEntity
                                                .images?[index] ??
                                            '';
                                        return buildImage(imageUrl, index);
                                      },
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            activeIndex = index;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: buildIndicator(state
                                              .productDetailsEntity
                                              .images
                                              ?.length ??
                                          0),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          expandedHeight: 400,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          text:
                                              "${AppLocalizations.of(context)!.egyptCurrency} ${state.productDetailsEntity.priceAfterDiscount ?? state.productDetailsEntity.price}",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                      Row(
                                        children: [
                                          CustomText(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .status,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                          CustomText(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .inStock,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ],
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                      text: AppLocalizations.of(context)!.taxes,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.grey,
                                      fontSize: 13),
                                  CustomText(
                                      text: state.productDetailsEntity.title!,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                      text: AppLocalizations.of(context)!
                                          .description,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.cyan,
                                      fontSize: 16),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: CustomText(
                                      text: state
                                          .productDetailsEntity.description!,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomText(
                                      text: AppLocalizations.of(context)!
                                          .bouquetInclude,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  CustomText(
                                      text: AppLocalizations.of(context)!
                                          .pinkRoses15,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  CustomText(
                                      text: AppLocalizations.of(context)!
                                          .whiteWrap,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocProvider.value(
                      value: GetIt.instance.get<AddToCartViewModel>(),
                      child: BlocConsumer<AddToCartViewModel, AddToCartState>(
                        listener: (context, state) {
                          if (state is AddToCartSuccess) {
                            showSuccessToast(
                              context: context,
                              message: AppLocalizations.of(context)!
                                  .addedToCartSuccess,
                              title: AppLocalizations.of(context)!.done,
                            );
                          } else if (state is AddToCartFailure) {
                            final String message;
                            if (CacheConstants.userToken == '') {
                              message =
                                  AppLocalizations.of(context)!.loginToPurchase;
                            } else {
                              message =
                                  AppLocalizations.of(context)!.loginToPurchase;
                            }
                            return showErrorToast(
                              context: context,
                              message: message,
                            );
                          }
                        },
                        builder: (context, state) {
                          return state is AddToCartLoading
                              ? const SizedBox(
                                  height: 4,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 100),
                                    child: LinearProgressIndicator(
                                      color: ColorManager.pink,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: CustomElevatedButton(
                                    buttonColor: ColorManager.pink,
                                    title:
                                        AppLocalizations.of(context)!.addToCart,
                                    onPressed: () async {
                                      final addToCartBody = AddToCartReqBody(
                                        productId: widget.productId,
                                      );
                                      await AddToCartViewModel.of(context)
                                          .addProductToCart(
                                        addToCartBody,
                                      );
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget buildIndicator(int count) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: ColorManager.pink,
      ),
    );
  }
}

Widget buildImage(String imageUrl, int index) {
  return SizedBox(
    width: double.infinity,
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
    ),
  );
}
