import 'package:flower_ecommerce/Features/address/saved_address/data/data_sources/online_data_source_impl/address_online_data_source_impl.dart';
import 'package:flower_ecommerce/Features/address/saved_address/data/models/response/address_dto.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../auth/data/data_source_impl/login_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late AddressOnlineDataSourceImpl addressOnlineDataSourceImpl;

  setUp(() {
    mockApiService = MockApiService();
    addressOnlineDataSourceImpl = AddressOnlineDataSourceImpl(mockApiService);
  });

  test(
      'when call getAddress function it should call '
      'api service and get address entity', () async {
    final mockResponse = AllAddressesDto();

    String token = 'token';

    when(mockApiService.getAddresses(token))
        .thenAnswer((_) async => mockResponse);

    var result = await addressOnlineDataSourceImpl.getAddresses(token);

    expect(result, isA<Success<AllAddressEntity>>());
    verify(mockApiService.getAddresses(token)).called(1);
  });
  test(
      'when call removeAddress function it should call '
      'api service and remove address', () async {
    final mockResponse = AllAddressesDto();

    String token = 'token';
    String address = 'address';

    when(mockApiService.removeAddress(token, address))
        .thenAnswer((_) async => mockResponse);

    var result =
        await addressOnlineDataSourceImpl.removeAddress(token, address);

    expect(result, isA<Success<AllAddressEntity>>());
    verify(mockApiService.removeAddress(token, address)).called(1);
  });
}
