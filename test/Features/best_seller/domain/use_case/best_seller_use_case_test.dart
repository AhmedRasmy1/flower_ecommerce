import 'package:flower_ecommerce/Features/best_seller/domain/entities/best_seller_entity.dart';
import 'package:flower_ecommerce/Features/best_seller/domain/repositories/best_repo.dart';
import 'package:flower_ecommerce/Features/best_seller/domain/use_case/best_seller_use_case.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_seller_use_case_test.mocks.dart';

@GenerateMocks([BestRepo])
void main() {
  test("when call invoke it should call bestRepo", () async {
    //arrange
    var mockBestRepo = MockBestRepo();
    var bestSellerUseCase = BestSellerUseCase(mockBestRepo);
    var bestSellerList = <BestSellerEntity>[];
    var mockedResult = Success<List<BestSellerEntity>>(bestSellerList);
    //Stub
    when(mockBestRepo.getBestSeller()).thenAnswer((_) async => mockedResult);
    //Act
    var result = await bestSellerUseCase.invoke();
    //assert
    verify(mockBestRepo.getBestSeller()).called(1);
    expect(result, mockedResult);
  });
}
