import '../../data/models/home_categories.dart';

import '../../data/models/best_seller.dart';
import '../../data/models/occasion.dart';
import '../../data/models/product.dart';

class HomeEntity {
  String? message;
  List<Product>? products;
  List<BestSeller>? bestSeller;
  List<Occasion>? occasions;
  List<HomeCategories>? categories;

  HomeEntity({
    this.message,
    this.products,
    this.bestSeller,
    this.occasions,
    this.categories,
  });
}
