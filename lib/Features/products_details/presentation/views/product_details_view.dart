import 'package:carousel_slider/carousel_slider.dart';
import '../view_model/product_details_cubit.dart';
import '../view_model/product_details_state.dart';
import '../widgets/custom_text.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/error_indicator.dart';
import '../../../../core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              return const ErrorIndicator();
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
                              // Change the color of the title based on the scroll position
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
                                      child: buildIndicator(),
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
                              padding: const EdgeInsets.only(left: 16, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text:
                                              "${AppStrings.egyptCurrency} ${state.productDetailsEntity.price}",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                      const SizedBox(
                                        width: 150,
                                      ),
                                      const CustomText(
                                          text: AppStrings.status,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                      const CustomText(
                                          text: " In stock",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ],
                                  ),
                                  const CustomText(
                                      text: AppStrings.taxes,
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
                                  const CustomText(
                                      text: AppStrings.description,
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: CustomText(
                                      text: state
                                          .productDetailsEntity.description!,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
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
                                  const CustomText(
                                      text: AppStrings.bouquetInclude,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  const CustomText(
                                      text: "Pink roses:15",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  const CustomText(
                                      text: "White wrap",
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
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        child: const Text(
                          AppStrings.addToCart,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
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

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: carouselSliderItems.length,
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
      fit: BoxFit.fill,
    ),
  );
}
