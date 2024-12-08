import 'package:flower_ecommerce/Features/address/saved_address/data/data_sources/online_data_source/address_online_data_source.dart';
import 'package:flower_ecommerce/Features/address/saved_address/data/repositories/address_repo_impl.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'address_repo_impl_test.mocks.dart';

@GenerateMocks([AddressOnlineDataSource])
void main() {
  late MockAddressOnlineDataSource mockAddressOnlineDataSource;
  late AddressRepoImpl addressRepoImpl;

  setUp(() {
    mockAddressOnlineDataSource = MockAddressOnlineDataSource();
    addressRepoImpl = AddressRepoImpl(mockAddressOnlineDataSource);
  });
  test(
      'when i call getAddress function it should call online datasource with'
      ' correct parameters', () async {
    String token = 'token';
    var mockedResult = Success(AllAddressEntity());

    when(mockAddressOnlineDataSource.getAddresses(token))
        .thenAnswer((_) async => mockedResult);

    var result = await addressRepoImpl.getAddresses(token);
    expect(result, mockedResult);
    verify(mockAddressOnlineDataSource.getAddresses(token)).called(1);
  });
  test(
      'when i call removeAddress function it should call online datasource with'
      ' correct parameters', () async {
    String token = 'token';
    String addressId = 'id';
    var mockedResult = Success(AllAddressEntity());

    when(mockAddressOnlineDataSource.removeAddress(token, addressId))
        .thenAnswer((_) async => mockedResult);

    var result = await addressRepoImpl.removeAddress(token, addressId);
    expect(result, mockedResult);
    verify(mockAddressOnlineDataSource.removeAddress(token, addressId))
        .called(1);
  });
}
