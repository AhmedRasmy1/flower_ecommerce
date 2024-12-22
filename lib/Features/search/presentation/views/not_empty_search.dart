import 'package:flower_ecommerce/Features/products_details/presentation/views/product_details_view.dart';
import 'package:flower_ecommerce/core/resources/assets_manager.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../products/domain/entities/products_entities.dart';

class NotEmptySearch extends StatelessWidget {
  List<ProductsEntities> filteredProducts;

  int index;

  NotEmptySearch(
      {required this.filteredProducts, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 14,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsView(
                  productId: filteredProducts[index].id ?? '',
                ),
              ),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      "${filteredProducts[index].imgCover}",
                      height: 80,
                      fit: BoxFit.fill,
                      width: 100,
                    )),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        "${filteredProducts[index].title}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "No of items: ${filteredProducts[index].quantity}",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.67)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Price: ${filteredProducts[index].priceAfterDiscount} EGP",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.67)),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Divider(
          thickness: 1,
          color: Colors.black.withOpacity(0.4),
          indent: 10,
          endIndent: 10,
        )
      ],
    );
  }
}
