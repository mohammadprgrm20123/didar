// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:didar_challenge_test/core/di/injuctable_csutomer.dart' as _i11;
import 'package:didar_challenge_test/features/customer/data/customer_data_source.dart'
    as _i3;
import 'package:didar_challenge_test/features/customer/domain/use_case/create_customer_use_case.dart'
    as _i4;
import 'package:didar_challenge_test/features/customer/domain/use_case/delete_customer_use_case.dart'
    as _i8;
import 'package:didar_challenge_test/features/customer/domain/use_case/edit_customer_use_case.dart'
    as _i5;
import 'package:didar_challenge_test/features/customer/domain/use_case/get_all_customer_use_case.dart'
    as _i6;
import 'package:didar_challenge_test/features/customer/domain/use_case/get_customer_details_use_case.dart'
    as _i7;
import 'package:didar_challenge_test/presentation/customer/modify/controller/create_customer_controller.dart'
    as _i10;
import 'package:didar_challenge_test/presentation/customer/modify/controller/edit_customer_controller.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableCustomerFeature = _$InjectableCustomerFeature();
    gh.factory<_i3.CustomerDataSource>(
        () => injectableCustomerFeature.customerDataSource);
    gh.factory<_i4.CreateCustomerUseCase>(
        () => injectableCustomerFeature.addCustomerUseCase);
    gh.factory<_i5.EditCustomerUseCase>(
        () => injectableCustomerFeature.editCustomerUseCase);
    gh.factory<_i6.GetAllCustomerUseCase>(
        () => injectableCustomerFeature.getAllCustomersUseCase);
    gh.factory<_i7.GetCustomerDetailsUseCase>(
        () => injectableCustomerFeature.getCustomerUseCase);
    gh.factory<_i8.DeleteCustomerUseCase>(
        () => injectableCustomerFeature.deleteCustomerUseCase);
    gh.factory<_i9.EditCustomerController>(
        () => _i9.EditCustomerController(gh<_i5.EditCustomerUseCase>()));
    gh.factory<_i10.CreateCustomerController>(
        () => _i10.CreateCustomerController(gh<_i4.CreateCustomerUseCase>()));
    return this;
  }
}

class _$InjectableCustomerFeature extends _i11.InjectableCustomerFeature {}
