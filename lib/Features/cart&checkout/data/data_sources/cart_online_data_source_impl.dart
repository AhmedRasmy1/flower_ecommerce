import 'package:flower_ecommerce/Features/cart&checkout/data/contracts/cart_online_data_source.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/request/update_quantity_request.dart';
import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/core/api/api_extentions.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartOnlineDataSource)
class CartOnlineDataSourceImpl implements CartOnlineDataSource {
  final ApiService _apiService;

  CartOnlineDataSourceImpl(this._apiService);
  @override
  Future<Result<List<CartItemEntity>?>> fetchUserCart() async {
    final cachedToken = CacheService.getData(key: CacheConstants.userToken);
    debugPrint(cachedToken);
    final token = "Bearer $cachedToken";
    return await executeApi<List<CartItemEntity>>(
      () async {
        final List<CartItemEntity> cartItems = [];
        final userCartResponse = await _apiService.fetchUserCart(token);
        for (final item in userCartResponse!.cart!.cartItems!) {
          cartItems.add(item.toCartItemEntity());
        }
        return cartItems;
      },
    );
  }

  @override
  Future<Result<bool>> updateQuantity({
    required UpdateQuantityRequest updateQuantityRequest,
    required String productId,
  }) async {
    return await executeApi<bool>(
      () async {
        final cachedToken = CacheService.getData(key: CacheConstants.userToken);
        final updateResponse = await _apiService.updateProductQuantity(
            updateQuantityRequest, productId, "Bearer $cachedToken");
        return updateResponse?.message == "success";
      },
    );
  }

  @override
  Future<Result<bool>> deleteProduct(String productId) async {
    return await executeApi<bool>(
      () async {
        final cachedToken = CacheService.getData(key: CacheConstants.userToken);
        final deleteProductResponse = await _apiService.deleteProductFromCart(
          productId,
          "Bearer $cachedToken",
        );
        return deleteProductResponse?.message == "success";
      },
    );
  }
}
