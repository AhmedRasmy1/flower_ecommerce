import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/category_tap_bar.dart';
import '../widgets/custom_search.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomSearch(),
            CategoryTapBar(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal:8 ),
            //   child: ElevatedButton(
            //     style:ElevatedButton.styleFrom(
            //       backgroundColor: ColorManager.pink,
            //
            //     ) ,
            //     onPressed: (){},
            //     child:  Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //
            //       children: [
            //         SvgPicture.asset(AssetsManager.cart,width: 15,height: 15,colorFilter: const ColorFilter.mode(
            //           ColorManager.white,
            //           BlendMode.srcIn,
            //         ) ,),
            //         const SizedBox(
            //           width: AppSize.s8,
            //         ),
            //         Text('Add to cart',style: getBoldStyle(color: ColorManager.white,fontSize: AppSize.s12),),
            //       ],
            //     ),),
            // ),
          ],
        ),
      ),
    );
  }
}



