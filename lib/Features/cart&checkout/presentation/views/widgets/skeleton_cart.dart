// import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// import '../../../../../core/resources/color_manager.dart';
// import '../../../../../core/resources/values_manager.dart';
// import '../../../../../core/widgets/custom_app_bar.dart';
// import '../../../../../core/widgets/custom_elevated_button.dart';
// import 'cart_item/product_cart_item.dart';
// import 'delivered_to.dart';
// import 'order_details.dart';
//
// class SkeletonCart extends StatelessWidget {
//   const SkeletonCart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       child:ListView(
//         children: [
//           SizedBox(
//             width: MediaQuery.sizeOf(context).width,
//             height: 120,
//             child: Material(
//               color: ColorManager.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//                   15,
//                 ),
//                 side: const BorderSide(
//                   color: Colors.grey,
//                   width: 0.5,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(
//                   8,
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ItemImage(
//                       image: cartItemEntity.imgCover!,
//                     ),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ItemDetails(
//                             title: cartItemEntity.title!,
//                             description: cartItemEntity.description!,
//                           ),
//                           Text(
//                             " ${cartItemEntity.price}${AppLocalizations.of(context)!.currencyEGP}",
//                             style: const TextStyle().copyWith(
//                               fontWeight: FontWeight.w600,
//                               fontSize: AppSize.s14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         BlocProvider(
//                           create: (context) =>
//                               GetIt.instance.get<DeleteProductViewModel>(),
//                           child: Builder(builder: (context) {
//                             final deleteProductViewModel =
//                             DeleteProductViewModel.of(context);
//                             final fetchCartViewModel =
//                             FetchUserCartViewModel.of(context);
//                             return InkWell(
//                               onTap: () async {
//                                 showWarningDialogue(
//                                   message: AppLocalizations.of(context)!
//                                       .deleteConfirmation,
//                                   onPressed: () {
//                                     deleteProductViewModel
//                                         .deleteProduct(cartItemEntity.id!)
//                                         .then(
//                                           (_) async {
//                                         await fetchCartViewModel.fetchUserCart();
//                                       },
//                                     );
//                                   },
//                                   context: context,
//                                 );
//                               },
//                               child: SvgPicture.asset(
//                                 AppAssets.cartDeleteSvgIcon,
//                                 width: 24,
//                                 height: 24,
//                               ),
//                             );
//                           }),
//                         ),
//                         const SizedBox(
//                           height: 48,
//                         ),
//                         BlocProvider(
//                           create: (context) =>
//                               GetIt.instance.get<UpdateProductQuantityViewModel>(),
//                           child: ControlItemQuantity(
//                             quantity: cartItemEntity.quantity!,
//                             productId: cartItemEntity.id!,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
//
// List<ProductCartItem>ddd=[
//   ProductCartItem(
//     cartItemEntity: CartItemEntity(
//       id: 'sdsdsd',
//         totalPrice: 5456,
//         title: 'sadsdsd',
//         imgCover: 'adadasdsadsasas',
//         quantity: 5,
//         price: 55,
//         description: 'sadsad'),),
//   ProductCartItem(
//     cartItemEntity: CartItemEntity(
//         id: 'sdsdsd',
//         totalPrice: 5456,
//         title: 'sadsdsd',
//         imgCover: 'adadasdsadsasas',
//         quantity: 5,
//         price: 55,
//         description: 'sadsad'),),
//   ProductCartItem(
//     cartItemEntity: CartItemEntity(
//         id: 'sdsdsd',
//         totalPrice: 5456,
//         title: 'sadsdsd',
//         imgCover: 'adadasdsadsasas',
//         quantity: 5,
//         price: 55,
//         description: 'sadsad'),),
// ];