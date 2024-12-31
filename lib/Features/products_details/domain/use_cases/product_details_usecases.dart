import '../entities/product_details_entity.dart';
import '../repositories/product_details_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';

@injectable
class ProductDetailsUseCases {
  ProductDetailsRepo productDetailsRepo;

  ProductDetailsUseCases(this.productDetailsRepo);

  Future<Result<ProductDetailsEntity>> getProductDetails(
    String productId,
  ) {
    return productDetailsRepo.getProductDetails(productId);
  }
}
