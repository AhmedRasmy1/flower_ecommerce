import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../products/presentation/widgets/cart_product.dart';

class SkeletonBar extends StatelessWidget {
  const SkeletonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
              isScrollable: true,
              indicator: const UnderlineTabIndicator(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                borderSide: BorderSide(
                  color: ColorManager.lightGrey3,
                  width: 4,
                ),
              ),
              indicatorColor: ColorManager.lightGrey3,
              indicatorWeight: 3,
              splashBorderRadius: BorderRadius.circular(20),
              physics: const BouncingScrollPhysics(),
              tabs: const [
                Tab(
                  text: 'dd',
                ),
                Tab(
                  text: 'dddddddd',
                ),
                Tab(
                  text: 'dddddd',
                ),
                Tab(
                  text: 'ddddddd',
                ),
                Tab(
                  text: 'ddddd',
                ),
                Tab(
                  text: 'dddddddd',
                ),
              ],
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height > 600
                    ? MediaQuery.sizeOf(context).width * 0.99
                    : MediaQuery.sizeOf(context).width * 1.2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.sizeOf(context).width > 600 ? 3 : 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: .6),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CartProduct(
                      productId: null,
                      imgCover:
                          'https://flower.elevateegy.com/uploads/39c641a6-4ec4-421a-8f55-5d8f5eeba5c3-flowers.png',
                      title: 'hhhhh',
                      price: 5454,
                      priceAfterDiscount: 5452,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
