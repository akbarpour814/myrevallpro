// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/home/data/data_source/home_data_source.dart' as _i3;
import '../../../features/home/data/repository/home_repository_impl.dart'
    as _i5;
import '../../../features/home/domain/repository/home_repository.dart' as _i4;
import '../../../features/login/data/data_source/login_data_source.dart' as _i6;
import '../../../features/login/data/repository/login_repository_impl.dart'
    as _i8;
import '../../../features/login/domain/repository/login_repository.dart' as _i7;

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
    gh.factory<_i3.IHomeDataSource>(() => _i3.HomeDataSource());
    gh.factory<_i4.IHomeRepository>(() => _i5.HomeRepository());
    gh.factory<_i6.ILoginDataSource>(() => _i6.LoginDataSource());
    gh.factory<_i7.ILoginRepository>(() => _i8.LoginRepository());
    return this;
  }
}
