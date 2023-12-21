// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_clean_architecture/blocs/app/app_bloc.dart' as _i19;
import 'package:flutter_clean_architecture/blocs/feed/feed_bloc.dart' as _i6;
import 'package:flutter_clean_architecture/blocs/history/history_bloc.dart'
    as _i7;
import 'package:flutter_clean_architecture/blocs/home/home_bloc.dart' as _i8;
import 'package:flutter_clean_architecture/blocs/map/map_bloc.dart' as _i9;
import 'package:flutter_clean_architecture/blocs/plan_new/plan_new_bloc.dart'
    as _i10;
import 'package:flutter_clean_architecture/blocs/profile/profile_bloc.dart'
    as _i11;
import 'package:flutter_clean_architecture/blocs/splash/splash_bloc.dart'
    as _i13;
import 'package:flutter_clean_architecture/core/service/connectivity_service.dart'
    as _i3;
import 'package:flutter_clean_architecture/core/service/credential_service.dart'
    as _i4;
import 'package:flutter_clean_architecture/core/service/tracker_service.dart'
    as _i14;
import 'package:flutter_clean_architecture/data/api/networking_service.dart'
    as _i20;
import 'package:flutter_clean_architecture/data/repository/iml/user_repository_iml.dart'
    as _i16;
import 'package:flutter_clean_architecture/data/repository/repository.dart'
    as _i15;
import 'package:flutter_clean_architecture/local/local.dart' as _i12;
import 'package:flutter_clean_architecture/main.dart' as _i21;
import 'package:flutter_clean_architecture/pages/home/home_page.dart' as _i18;
import 'package:flutter_clean_architecture/ui.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
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
    gh.singleton<_i4.CredentialService>(
      _i4.CredentialService(),
      dispose: (i) => i.dispose(),
    );
    await gh.singletonAsync<_i5.Dio>(
      () => registerService.userDio,
      instanceName: 'userDio',
      preResolve: true,
    );
    gh.singleton<_i5.Dio>(
      registerService.publicDio,
      instanceName: 'publicDio',
    );
    gh.factory<_i6.FeedBloc>(() => _i6.FeedBloc());
    gh.factory<_i7.HistoryBloc>(() => _i7.HistoryBloc());
    gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc());
    gh.factory<_i9.MapBloc>(() => _i9.MapBloc());
    gh.factory<_i10.Plan_newBloc>(() => _i10.Plan_newBloc());
    gh.factory<_i11.ProfileBloc>(() => _i11.ProfileBloc());
    await gh.singletonAsync<_i12.SharedPrefService>(
      () => registerService.prefs,
      preResolve: true,
    );
    gh.factory<_i13.SplashBloc>(() => _i13.SplashBloc());
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
    gh.singleton<_i14.TrackerConfiguration>(_i14.TrackerConfiguration(
      trackerId: gh<String>(instanceName: 'trackerId'),
      env: gh<String>(instanceName: 'env'),
    ));
    gh.singleton<_i15.UserRepository>(_i16.UserRepositoryIml());
    gh.factory<_i17.Widget>(
      () => _i18.HomePage(),
      instanceName: '/home',
    );
    gh.singleton<_i19.AppBloc>(
      _i19.AppBloc(gh<_i12.SharedPrefService>()),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i20.NetworkingService>(_i20.NetworkingService(
      prefServices: gh<_i12.SharedPrefService>(),
      baseUrl: gh<String>(instanceName: 'baseUrl'),
      userDio: gh<_i5.Dio>(instanceName: 'userDio'),
      publicDio: gh<_i5.Dio>(instanceName: 'publicDio'),
    ));
    return this;
  }
}

class _$RegisterService extends _i21.RegisterService {}
