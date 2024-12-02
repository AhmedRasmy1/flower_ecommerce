import '../../domain/entities/best_seller_entity.dart';

sealed class BestSellerState {}

class InitialState extends BestSellerState {}

class SuccessBestSellerState extends BestSellerState {
  List<BestSellerEntity>? bestSellerEntities;

  SuccessBestSellerState(this.bestSellerEntities);
}

class LoadingBestSellerState extends BestSellerState {}

class ErrorBestSellerState extends BestSellerState {
  Exception? exception;

  ErrorBestSellerState(this.exception);
}
