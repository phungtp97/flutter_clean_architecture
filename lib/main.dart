import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/local/local.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app.dart';
import 'injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await GetIt.I.get<SharedPrefServices>().init();
  runApp(const App());
}

@module
abstract class RegisterService {
  @Named('trackerId')
  String get trackerId => '1234567890';

  @Named('env')
  String get env => 'dev';

  @Named('baseUrl')
  String get baseUrl => 'https://api.themoviedb.org/3/';
}
