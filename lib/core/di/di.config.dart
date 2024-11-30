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
import '../../Features/auth/domain/use_cases/forget_password_usecase.dart'
    as _i762;
import '../../Features/auth/domain/use_cases/login_usecases.dart' as _i526;
import '../../Features/auth/domain/use_cases/register_usecase.dart' as _i284;
import '../../Features/auth/domain/use_cases/reset_password_usecase.dart'
    as _i785;
import '../../Features/auth/domain/use_cases/verify_uce_case.dart' as _i753;
import '../../Features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart'
    as _i191;
import '../../Features/auth/presentation/view_model/login_view_model/login_cubit.dart'
    as _i920;
import '../../Features/auth/presentation/view_model/reset_password_view_model/reset_password_cubit.dart'
    as _i14;
import '../../Features/auth/presentation/view_model/signup_view_model/signup_cubit.dart'
    as _i674;
import '../../Features/auth/presentation/view_model/verify_password_view_model/verify_password_cubit.dart'
    as _i396;
import '../../Features/best_seller/data/data_source/best_online_data_source.dart'
    as _i97;
import '../../Features/best_seller/data/data_source/best_online_data_source_impl.dart'
    as _i840;
import '../../Features/best_seller/data/repositories/best_repo_impl.dart'
    as _i762;
import '../../Features/best_seller/domain/repositories/best_repo.dart'
    as _i1010;
import '../../Features/best_seller/domain/use_case/best_seller_use_case.dart'
    as _i439;
import '../../Features/best_seller/presentation/best_seller_view_model/best_seller_cubit.dart'
    as _i1012;
import '../../Features/categories/data/data_sources/all_categories_datasource.dart'
    as _i939;
import '../../Features/categories/data/data_sources/all_categories_datasource_impl.dart'
    as _i421;
import '../../Features/categories/data/repositories/all_categories_repo_impl.dart'
    as _i485;
import '../../Features/categories/domain/repositories/categories_repo.dart'
    as _i2;
import '../../Features/categories/domain/use_cases/all_categories_usecase.dart'
    as _i953;
import '../../Features/categories/presentation/manager/all_categories_cubit.dart'
    as _i1001;
import '../../Features/edit_profile/data/data_source/edit_profile_data_source.dart'
    as _i964;
import '../../Features/edit_profile/data/data_source_impl/edit_profile_data_source_impl.dart'
    as _i602;
import '../../Features/edit_profile/data/repo_impl/edit_profile_repo_impl.dart'
    as _i615;
import '../../Features/edit_profile/domain/repo/edit_profile_repo.dart'
    as _i471;
import '../../Features/edit_profile/domain/use_cases/edit_profile_use_case.dart'
    as _i728;
import '../../Features/edit_profile/presentation/viewmodels/editprofile_cubit.dart'
    as _i516;
import '../../Features/home/data/data_sources/home_data_source.dart' as _i448;
import '../../Features/home/data/data_sources_impl/home_data_source_impl.dart'
    as _i824;
import '../../Features/home/data/repositories_impl/home_repo_impl.dart'
    as _i288;
import '../../Features/home/domain/repositories/home_repo.dart' as _i143;
import '../../Features/home/domain/use_cases/home_use_case.dart' as _i185;
import '../../Features/home/presentation/viewmodels/home_cubit.dart' as _i1022;
import '../../Features/occasions/data/data_source_impl/occasion_online_datasource_imp.dart'
    as _i864;
import '../../Features/occasions/data/data_sourses/occasion_datasource.dart'
    as _i679;
import '../../Features/occasions/data/repositories/occasion_repo_imp.dart'
    as _i971;
import '../../Features/occasions/domain/repositories/occasion_repo.dart'
    as _i390;
import '../../Features/occasions/domain/use_cases/occasion_details_use_case.dart'
    as _i71;
import '../../Features/occasions/domain/use_cases/occasion_use_case.dart'
    as _i536;
import '../../Features/occasions/presentation/viewmodel/occasion_view_model/occasion_cubit.dart'
    as _i251;
import '../../Features/products/data/data_sources/all_products_datasource.dart'
    as _i711;
import '../../Features/products/data/data_sources/all_products_datasource_impl.dart'
    as _i34;
import '../../Features/products/data/repositories/all_products_repo_impl.dart'
    as _i173;
import '../../Features/products/domain/repositories/products_repo.dart'
    as _i540;
import '../../Features/products/domain/use_cases/all_categories_usecase.dart'
    as _i232;
import '../../Features/products/presentation/manager/all_products_cubit.dart'
    as _i491;
import '../../Features/products_details/data/data_source_imp/product_details_online_datasource_impl.dart'
    as _i696;
import '../../Features/products_details/data/data_sources/product_details_online_datasource.dart'
    as _i178;
import '../../Features/products_details/data/repositories/product_details_repo_impl.dart'
    as _i174;
import '../../Features/products_details/domain/repositories/product_details_repo.dart'
    as _i368;
import '../../Features/products_details/domain/use_cases/product_details_usecases.dart'
    as _i364;
import '../../Features/products_details/presentation/view_model/product_details_cubit.dart'
    as _i942;
import '../../Features/profile/data/data_source/profile_data_source.dart'
    as _i537;
import '../../Features/profile/data/data_source_impl/profile_data_source_impl.dart'
    as _i917;
import '../../Features/profile/data/repositories/profile_repo_imp.dart'
    as _i663;
import '../../Features/profile/domain/repository/profile_repo.dart' as _i1054;
import '../../Features/profile/domain/use_cases/profile_usecase.dart' as _i937;
import '../../Features/profile/presentation/view_model/profile_view_model.dart'
    as _i149;
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
    gh.factory<_i711.AllProductsDatasource>(
        () => _i34.AllProductsDatasourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i939.AllCategoriesDatasource>(
        () => _i421.AuthOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i537.ProfileDataSource>(
        () => _i917.ProfileDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i964.EditProfileDataSource>(
        () => _i602.EditProfileDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i1054.ProfileRepo>(
        () => _i663.ProfileRepoImpl(gh<_i537.ProfileDataSource>()));
    gh.factory<_i679.OccasionOnLineDataSource>(
        () => _i864.OccasionOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i448.HomeDataSource>(
        () => _i824.HomeDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i2.CategoriesRepo>(
        () => _i485.CategoriesRepoImpl(gh<_i939.AllCategoriesDatasource>()));
    gh.factory<_i178.ProductDetailsOnlineDataSource>(
        () => _i696.ProductDetailsOnlineDataSourceImp(gh<_i680.ApiService>()));
    gh.factory<_i97.BestOnLineDataSource>(
        () => _i840.BestOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i953.CategoriesUseCase>(
        () => _i953.CategoriesUseCase(gh<_i2.CategoriesRepo>()));
    gh.factory<_i937.ProfileUseCase>(
        () => _i937.ProfileUseCase(gh<_i1054.ProfileRepo>()));
    gh.factory<_i318.AuthOnLineDataSource>(
        () => _i453.AuthOnLineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i471.EditProfileRepo>(
        () => _i615.EditProfileRepoImpl(gh<_i964.EditProfileDataSource>()));
    gh.factory<_i1001.AllCategoriesViewModel>(
        () => _i1001.AllCategoriesViewModel(gh<_i953.CategoriesUseCase>()));
    gh.factory<_i368.ProductDetailsRepo>(() => _i174.ProductDetailsRepoImpl(
        gh<_i178.ProductDetailsOnlineDataSource>()));
    gh.factory<_i540.ProductsRepo>(
        () => _i173.CategoriesRepoImpl(gh<_i711.AllProductsDatasource>()));
    gh.factory<_i390.OccasionRepo>(
        () => _i971.OccasionRepoImpl(gh<_i679.OccasionOnLineDataSource>()));
    gh.factory<_i149.ProfileViewModel>(
        () => _i149.ProfileViewModel(gh<_i937.ProfileUseCase>()));
    gh.factory<_i232.ProductsUseCase>(
        () => _i232.ProductsUseCase(gh<_i540.ProductsRepo>()));
    gh.factory<_i1010.BestRepo>(
        () => _i762.BestRepoImpl(gh<_i97.BestOnLineDataSource>()));
    gh.factory<_i439.BestSellerUseCase>(
        () => _i439.BestSellerUseCase(gh<_i1010.BestRepo>()));
    gh.factory<_i364.ProductDetailsUseCases>(
        () => _i364.ProductDetailsUseCases(gh<_i368.ProductDetailsRepo>()));
    gh.factory<_i143.HomeRepo>(
        () => _i288.HomeRepoImpl(gh<_i448.HomeDataSource>()));
    gh.factory<_i1012.BestSellerViewModel>(
        () => _i1012.BestSellerViewModel(gh<_i439.BestSellerUseCase>()));
    gh.factory<_i728.EditProfileUseCase>(
        () => _i728.EditProfileUseCase(gh<_i471.EditProfileRepo>()));
    gh.factory<_i1049.AuthRepo>(() => _i118.AuthRepoImpl(
          gh<_i406.AuthOffLineDataSource>(),
          gh<_i318.AuthOnLineDataSource>(),
        ));
    gh.factory<_i71.OccasionDetailsUseCase>(
        () => _i71.OccasionDetailsUseCase(gh<_i390.OccasionRepo>()));
    gh.factory<_i536.OccasionUseCase>(
        () => _i536.OccasionUseCase(gh<_i390.OccasionRepo>()));
    gh.factory<_i185.HomeUseCase>(
        () => _i185.HomeUseCase(gh<_i143.HomeRepo>()));
    gh.factory<_i1022.HomeCubit>(
        () => _i1022.HomeCubit(gh<_i185.HomeUseCase>()));
    gh.factory<_i491.AllProductsViewModel>(
        () => _i491.AllProductsViewModel(gh<_i232.ProductsUseCase>()));
    gh.factory<_i942.ProductDetailsViewModel>(() =>
        _i942.ProductDetailsViewModel(gh<_i364.ProductDetailsUseCases>()));
    gh.factory<_i762.ForgetPasswordUseCase>(
        () => _i762.ForgetPasswordUseCase(gh<_i1049.AuthRepo>()));
    gh.factory<_i526.LoginUseCases>(
        () => _i526.LoginUseCases(gh<_i1049.AuthRepo>()));
    gh.factory<_i284.RegisterUseCase>(
        () => _i284.RegisterUseCase(gh<_i1049.AuthRepo>()));
    gh.factory<_i785.ResetPasswordUseCase>(
        () => _i785.ResetPasswordUseCase(gh<_i1049.AuthRepo>()));
    gh.factory<_i753.VerifyUseCase>(
        () => _i753.VerifyUseCase(gh<_i1049.AuthRepo>()));
    gh.factory<_i516.EditprofileCubit>(
        () => _i516.EditprofileCubit(gh<_i728.EditProfileUseCase>()));
    gh.factory<_i920.LoginViewModel>(
        () => _i920.LoginViewModel(gh<_i526.LoginUseCases>()));
    gh.factory<_i251.OccasionViewModel>(
        () => _i251.OccasionViewModel(gh<_i536.OccasionUseCase>()));
    gh.factory<_i674.RegisterViewModel>(
        () => _i674.RegisterViewModel(gh<_i284.RegisterUseCase>()));
    gh.factory<_i191.ForgetPasswordViewModel>(
        () => _i191.ForgetPasswordViewModel(gh<_i762.ForgetPasswordUseCase>()));
    gh.factory<_i396.VerifyPasswordViewModel>(
        () => _i396.VerifyPasswordViewModel(gh<_i753.VerifyUseCase>()));
    gh.factory<_i14.ResetPasswordViewModel>(
        () => _i14.ResetPasswordViewModel(gh<_i785.ResetPasswordUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
