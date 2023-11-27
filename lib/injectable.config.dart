// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_clean_architecture/blocs/app/app_bloc.dart' as _i11;
import 'package:flutter_clean_architecture/blocs/home/home_bloc.dart' as _i4;
import 'package:flutter_clean_architecture/blocs/profile/profile_bloc.dart'
    as _i5;
import 'package:flutter_clean_architecture/blocs/splash/splash_bloc.dart'
    as _i7;
import 'package:flutter_clean_architecture/core/service/connectivity_service.dart'
    as _i3;
import 'package:flutter_clean_architecture/core/service/tracker_service.dart'
    as _i8;
import 'package:flutter_clean_architecture/local/local.dart' as _i6;
import 'package:flutter_clean_architecture/main.dart' as _i12;
import 'package:flutter_clean_architecture/pages/home/home_page.dart' as _i10;
import 'package:flutter_clean_architecture/ui.dart' as _i9;
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
    final registerService = _$RegisterService();
    gh.singleton<_i3.ConnectivityService>(
      _i3.ConnectivityService(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc());
    gh.factory<_i5.ProfileBloc>(() => _i5.ProfileBloc());
    gh.singleton<_i6.SharedPrefServices>(_i6.SharedPrefServices());
    gh.factory<_i7.SplashBloc>(() => _i7.SplashBloc());
    gh.factory<String>(
      () => registerService.trackerId,
      instanceName: 'trackerId',
    );
    gh.factory<String>(
      () => registerService.env,
      instanceName: 'env',
    );
    gh.factory<String>(
      () => registerService.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i8.TrackerConfiguration>(_i8.TrackerConfiguration(
      trackerId: gh<String>(instanceName: 'trackerId'),
      env: gh<String>(instanceName: 'env'),
    ));
    gh.factory<_i9.Widget>(
      () => _i10.HomePage(),
      instanceName: '/home',
    );
    gh.singleton<_i11.AppBloc>(
      _i11.AppBloc(gh<_i6.SharedPrefServices>()),
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}

class _$RegisterService extends _i12.RegisterService {}
