// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Features/auth/data/data_source_impl/auth_offline_datasoure_impl.dart'
    as _i1004;
import '../../Features/auth/data/data_source_impl/auth_online_datasource_impl.dart'
    as _i453;
import '../../Features/auth/data/data_sources/auth_offline_datasource.dart'
    as _i406;
import '../../Features/auth/data/data_sources/auth_online_datasource.dart'
    as _i318;
import '../../Features/auth/data/repositories/auth_repo_impl.dart' as _i118;
import '../../Features/auth/domain/repositories/auth_repo.dart' as _i1049;
import '../../Features/auth/domain/use_cases/register_usecase.dart' as _i284;
import '../../Features/auth/presentation/view_model/signup_view_model/signup_cubit.dart'
    as _i674;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i406.AuthOffLineDataSource>(
        () => _i1004.AuthOffLineDataSourceImpl());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i318.AuthOnLineDataSource>(
        () => _i453.AuthOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i1049.AuthRepo>(() => _i118.AuthRepoImpl(
          gh<_i406.AuthOffLineDataSource>(),
          gh<_i318.AuthOnLineDataSource>(),
        ));
    gh.factory<_i284.RegisterUseCase>(
        () => _i284.RegisterUseCase(gh<_i1049.AuthRepo>()));
    gh.factory<_i674.RegisterViewModel>(
        () => _i674.RegisterViewModel(gh<_i284.RegisterUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
