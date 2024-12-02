import 'package:flower_ecommerce/Features/auth/data/data_source_impl/auth_online_datasource_impl.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/login_model_dto.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/login_response_dto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/login_entities.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../home/data/data_sources_impl/home_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late AuthOnLineDataSourceImpl authOnLineDataSourceImpl;

  setUp(() {
    mockApiService = MockApiService();
    authOnLineDataSourceImpl = AuthOnLineDataSourceImpl(mockApiService);
  });

  test(
      'when call login function it should call '
      'api service and get login entity', () async {
    final mockResponse = LoginResponseDto();

    var loginModelDto = LoginModelDto(email: 'email', password: 'password');

    when(mockApiService.login(loginModelDto))
        .thenAnswer((_) async => mockResponse);

    var result = await authOnLineDataSourceImpl.login(loginModelDto);

    expect(result, isA<Success<LoginEntitie>>());
    // expect((result as Success<LoginEntitie>).data, mockResult);
    // expect(result, mockResult);
    verify(mockApiService.login(loginModelDto)).called(1);
  });
}
