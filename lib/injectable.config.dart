// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_clean_architecture/blocs/app/app_bloc.dart' as _i5;
import 'package:flutter_clean_architecture/core/service/connectivity_service.dart'
    as _i3;
import 'package:flutter_clean_architecture/local/local.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
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
    gh.singleton<_i3.ConnectivityService>(
      _i3.ConnectivityService(),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i4.SharedPrefServices>(_i4.SharedPrefServices());
    gh.singleton<_i5.AppBloc>(
      _i5.AppBloc(gh<_i4.SharedPrefServices>()),
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}