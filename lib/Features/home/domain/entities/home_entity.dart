import 'package:flower_ecommerce/Features/home/data/models/best_seller.dart';
import 'package:flower_ecommerce/Features/home/data/models/occasion.dart';
import 'package:flower_ecommerce/Features/home/data/models/product.dart';

class HomeEntity {
  String? message;
  List<Product>? products;
  List<BestSeller>? bestSeller;
  List<Occasion>? occasions;

  HomeEntity({
    this.message,
    this.products,
    this.bestSeller,
    this.occasions,
  });
}
