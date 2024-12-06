import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/repositories/address_repo.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/use_cases/address_use_cases.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_use_cases_test.mocks.dart';

@GenerateMocks([AddressRepo])
void main() {
  late MockAddressRepo mockAddressRepo;
  late AddressUseCases addressUseCases;
  setUp(() {
    mockAddressRepo = MockAddressRepo();
    addressUseCases = AddressUseCases(mockAddressRepo);
  });
  test(
      "when call getAddress function it should calls getAddress.repo "
      "with correct parameters", () async {
    var mockedResult = Success(AllAddressEntity());
    String token = 'token';
    when(mockAddressRepo.getAddresses(token))
        .thenAnswer((_) async => mockedResult);

    var result = await addressUseCases.getAddresses(token);
    expect(result, mockedResult);
    verify(mockAddressRepo.getAddresses(token)).called(1);
  });
  test(
      "when call removeAddress function it should calls removeAddress.repo "
      "with correct parameters", () async {
    var mockedResult = Success(AllAddressEntity());
    String token = 'token';
    String addressId = 'addressId';

    when(mockAddressRepo.removeAddress(token, addressId))
        .thenAnswer((_) async => mockedResult);

    var result = await addressUseCases.removeAddress(token, addressId);
    expect(result, mockedResult);
    verify(mockAddressRepo.removeAddress(token, addressId)).called(1);
  });
}
