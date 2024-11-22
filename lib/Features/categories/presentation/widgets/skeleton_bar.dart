import 'package:flower_ecommerce/Features/products/presentation/widgets/skeleton_body.dart';
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
              indicatorPadding:
              const EdgeInsets.symmetric(horizontal: 16),

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
                height: MediaQuery.sizeOf(context).height*.6,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: .6

                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CartProduct(
                      productsEntities: productsEntities,
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
