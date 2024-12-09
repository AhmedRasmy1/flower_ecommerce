import 'package:flower_ecommerce/Features/best_seller/data/data_source/best_online_data_source.dart';
import 'package:flower_ecommerce/Features/best_seller/data/repositories/best_repo_impl.dart';
import 'package:flower_ecommerce/Features/best_seller/domain/entities/best_seller_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_repo_test.mocks.dart';

@GenerateMocks([BestOnLineDataSource])
void main() {
  test(
      'when call BestRepo for get best seller it should call it from online data source for best seller',
      () async {
    var mockBestOnLineDataSource = MockBestOnLineDataSource();
    var bestRepo = BestRepoImpl(mockBestOnLineDataSource);

    var bestSellerList = <BestSellerEntity>[];
    var mockedResult = Success<List<BestSellerEntity>>(bestSellerList);
    //Stub
    when(mockBestOnLineDataSource.getBestSeller())
        .thenAnswer((_) async => mockedResult);
    //Act
    var result = await bestRepo.getBestSeller();
    //assert
    verify(mockBestOnLineDataSource.getBestSeller()).called(1);
    expect(result, mockedResult);
  });
}
