import 'package:flower_ecommerce/Features/auth/data/data_source_impl/auth_online_datasource_impl.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/logout_response_dto.dart';
import 'package:flower_ecommerce/Features/auth/domain/entities/logout_entity.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'logout_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late AuthOnLineDataSourceImpl authOnLineDataSource;
  setUp(() {
    mockApiService = MockApiService();
    authOnLineDataSource = AuthOnLineDataSourceImpl(mockApiService);
  });

  test(
      'when call logout function it should call '
      'api service to send token and get success massage', () async {
    var mockedResult = LogoutResponseDto();

    String token = 'token';

    when(mockApiService.logout(token)).thenAnswer((_) async => mockedResult);

    var result = await authOnLineDataSource.logout(token);
    expect(result, isA<Success<LogoutEntity>>());
    verify(mockApiService.logout(token)).called(1);
  });
}
