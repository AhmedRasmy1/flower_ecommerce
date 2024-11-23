import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/best_seller.dart';
import '../../../products_details/presentation/views/product_details_view.dart';
import '../../../../core/functions/extenstions.dart';
import 'package:flutter/material.dart';

class CustomBestSellerContainer extends StatelessWidget {
  const CustomBestSellerContainer({super.key, required this.bestSeller});

  final List<BestSeller> bestSeller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: context.screenHeight * 0.29,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bestSeller.length,
          itemBuilder: (context, index) {
            final bestSellerItem = bestSeller[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsView(
                            productId: bestSellerItem.id ?? '');
                      },
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: bestSellerItem.imgCover ?? '',
                      width: context.screenWidth * 0.4,
                      height: context.screenHeight * 0.2,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 32,
                        ),
                      ),
                    ),
                    Text(
                      bestSellerItem.title?.split(' ').take(3).join(' ') ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${bestSellerItem.price} EGP',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
