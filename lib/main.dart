import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/local/local.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app.dart';
import 'core/service/network_inspector.dart';
import 'injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await GetIt.I.get<SharedPrefServices>().init();
  runApp(const App());
}

@module
abstract class RegisterService {
  final SharedPrefServices _sharedPrefServices;

  RegisterService(this._sharedPrefServices);

  @Named('trackerId')
  String get trackerId => '1234567890';

  @Named('env')
  String get env => 'dev';

  @Named('baseUrl')
  String get baseUrl => 'https://api.yourhost.com';

  @Named('userDio')
  Dio get userDio {
    final dio = Dio();
      dio.interceptors.add(DioLogInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            if (options.method == 'POST') {
              options.headers['Content-Type'] = 'application/json';
            }
            if (_sharedPrefServices.token != null &&
                !options.headers.containsKey('Authorization')) {
              options.headers['Authorization'] =
              'Bearer ${_sharedPrefServices.token}';
            }
            notifyLogger();
            return handler.next(options);
          }, onResponse: (response, handler) async {
        notifyLogger();
        return handler.next(response);
      }, onError: (e, handler) async {
        print(
            'api exception -- ${e.requestOptions.path} ${e.requestOptions.uri
                .path}');
        notifyLogger();
        return handler.next(e);
      }));
    return dio;
  }

  @Named('publicDio')
  Dio get publicDio {
    final dio = Dio();

    return dio;
  }

  void notifyLogger() {
    Future.delayed(const Duration(milliseconds: 200), () {
      NetworkInspector().addLog();
    });
  }
}
