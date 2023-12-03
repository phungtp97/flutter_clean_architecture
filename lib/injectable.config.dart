// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i19;
import 'package:flutter_clean_architecture/blocs/app/app_bloc.dart' as _i17;
import 'package:flutter_clean_architecture/blocs/feed/feed_bloc.dart' as _i4;
import 'package:flutter_clean_architecture/blocs/history/history_bloc.dart'
    as _i5;
import 'package:flutter_clean_architecture/blocs/home/home_bloc.dart' as _i6;
import 'package:flutter_clean_architecture/blocs/map/map_bloc.dart' as _i7;
import 'package:flutter_clean_architecture/blocs/plan_new/plan_new_bloc.dart'
    as _i8;
import 'package:flutter_clean_architecture/blocs/profile/profile_bloc.dart'
    as _i9;
import 'package:flutter_clean_architecture/blocs/splash/splash_bloc.dart'
    as _i11;
import 'package:flutter_clean_architecture/core/service/connectivity_service.dart'
    as _i3;
import 'package:flutter_clean_architecture/core/service/tracker_service.dart'
    as _i12;
import 'package:flutter_clean_architecture/data/api/networking_service.dart'
    as _i18;
import 'package:flutter_clean_architecture/data/repository/iml/user_repository_iml.dart'
    as _i14;
import 'package:flutter_clean_architecture/data/repository/repository.dart'
    as _i13;
import 'package:flutter_clean_architecture/local/local.dart' as _i10;
import 'package:flutter_clean_architecture/pages/home/home_page.dart' as _i16;
import 'package:flutter_clean_architecture/ui.dart' as _i15;
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
    gh.factory<_i4.FeedBloc>(() => _i4.FeedBloc());
    gh.factory<_i5.HistoryBloc>(() => _i5.HistoryBloc());
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.factory<_i7.MapBloc>(() => _i7.MapBloc());
    gh.factory<_i8.Plan_newBloc>(() => _i8.Plan_newBloc());
    gh.factory<_i9.ProfileBloc>(() => _i9.ProfileBloc());
    gh.singleton<_i10.SharedPrefServices>(_i10.SharedPrefServices());
    gh.factory<_i11.SplashBloc>(() => _i11.SplashBloc());
    gh.singleton<_i12.TrackerConfiguration>(_i12.TrackerConfiguration(
      trackerId: gh<String>(instanceName: 'trackerId'),
      env: gh<String>(instanceName: 'env'),
    ));
    gh.singleton<_i13.UserRepository>(_i14.UserRepositoryIml());
    gh.factory<_i15.Widget>(
      () => _i16.HomePage(),
      instanceName: '/home',
    );
    gh.singleton<_i17.AppBloc>(
      _i17.AppBloc(gh<_i10.SharedPrefServices>()),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i18.NetworkingService>(_i18.NetworkingService(
      prefServices: gh<_i10.SharedPrefServices>(),
      baseUrl: gh<String>(instanceName: 'baseUrl'),
      userDio: gh<_i19.Dio>(),
      publicDio: gh<_i19.Dio>(),
    ));
    return this;
  }
}
