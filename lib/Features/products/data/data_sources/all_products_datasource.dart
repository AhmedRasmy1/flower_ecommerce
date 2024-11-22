
import 'package:flower_ecommerce/Features/auth/domain/entities/forget_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/verify_password_entity.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/LoginModelDto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';
import 'package:flower_ecommerce/Features/categories/domain/entities/categories_entities.dart';
import 'package:flower_ecommerce/Features/products/domain/entities/ProductsEntities.dart';


import '../../../../core/common/api_result.dart';


abstract class AllProductsDatasource {
  Future<Result<AllProductsEntities?>> getAllProducts();

}
