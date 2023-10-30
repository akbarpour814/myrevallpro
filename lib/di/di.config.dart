// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repo/auth_repository.dart' as _i4;
import '../data/repo/main_repository.dart' as _i6;
import '../data/source/auth_data_source.dart' as _i3;
import '../data/source/main_data_source.dart' as _i5;

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
    gh.factory<_i3.IAuthDataSource>(() => _i3.AuthDataSource());
    gh.factory<_i4.IAuthRepository>(() => _i4.AuthRepository());
    gh.factory<_i5.IMainDataSource>(() => _i5.MainDataSource());
    gh.factory<_i6.IMainRepository>(() => _i6.MainRepository());
    return this;
  }
}
