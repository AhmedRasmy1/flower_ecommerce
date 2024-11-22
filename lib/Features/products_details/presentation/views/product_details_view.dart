import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower_ecommerce/Features/products_details/presentation/view_model/product_details_cubit.dart';
import 'package:flower_ecommerce/Features/products_details/presentation/view_model/product_details_state.dart';
import 'package:flower_ecommerce/Features/products_details/presentation/widgets/custom_text.dart';
import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flower_ecommerce/core/widgets/error_indicator.dart';
import 'package:flower_ecommerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsView extends StatefulWidget {
  String productId;

  ProductDetailsView({required this.productId, super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late ProductDetailsViewModel viewModel;

  int activeIndex = 0;
  String? _errorMessage;

  List<String> carouselSliderItems = [
    'assets/images/bouquet.png',
    'assets/images/bouquet.png',
    'assets/images/bouquet.png',
    'assets/images/bouquet.png',
  ];

  @override
  void initState() {
    viewModel = getIt.get<ProductDetailsViewModel>();
    // ..getProductDetails("6737c7b1d485ca1c2879ce7f");
    //viewModel.getProductDetails("6737c7b1d485ca1c2879ce7f");
    // viewModel.getProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => viewModel..getProductDetails(widget.productId),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<ProductDetailsViewModel, ProductDetailsState>(
              builder: (context, state) {
                if (state is LoadingProductDetailsState) {
                  return LoadingIndicator();
                } else if (state is ErrorProductDetailsState) {
                  print(state.exception);
                  return ErrorIndicator();
                } else if (state is SuccessProductDetailsState) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        stretch: true,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            textAlign: TextAlign.center,
                            state.productDetailsEntity.title!,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          background: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CarouselSlider.builder(
                                  itemCount:
                                      state.productDetailsEntity.images!.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final imageUrl = state
                                        .productDetailsEntity.images![index];
                                    return buildImage(imageUrl, index);
                                  },
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    reverse: true,
                                    height: 400.h,
                                    onPageChanged: (index, reason) =>
                                        setState(() {
                                      activeIndex = index;
                                    }),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: buildIndicator(),
                              ),
                            ],
                          ),
                        ),
                        // title: Text(
                        //   state.productDetailsEntity.title!,
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.w700),
                        // ),
                        expandedHeight: 400,
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding: EdgeInsets.only(left: 16.h, top: 5.w),
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
                                        fontSize: 20.sp),
                                    SizedBox(
                                      width: 150.w,
                                    ),
                                    CustomText(
                                        text: AppStrings.status,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp),
                                    CustomText(
                                        text: " In stock",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp),
                                  ],
                                ),
                                CustomText(
                                    text: AppStrings.taxes,
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.grey,
                                    fontSize: 13.sp),
                                CustomText(
                                    text: state.productDetailsEntity.title!,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                                SizedBox(
                                  height: 8.h,
                                ),
                                CustomText(
                                    text: AppStrings.description,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.cyan,
                                    fontSize: 16.sp),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: CustomText(
                                      text: state
                                          .productDetailsEntity.description!,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                CustomText(
                                    text: AppStrings.bouquetInclude,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                                CustomText(
                                    text: "Pink roses:15",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp),
                                CustomText(
                                    text: "White wrap",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 48.h,
                              width: 343.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.pink,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.r))),
                                child: Text(
                                  AppStrings.addToCart,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ]),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            )),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: carouselSliderItems.length,
      effect: SlideEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: ColorManager.pink,
      ),
    );
  }
}

Widget buildImage(String imageUrl, int index) {
  return Container(
    width: double.infinity,
    // margin: EdgeInsets.symmetric(horizontal: 4),
    child: Image.network(
      imageUrl,
      fit: BoxFit.fill,
    ),
  );
}
