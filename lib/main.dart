import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/local/local.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await GetIt.I.get<SharedPrefServices>().init();
  runApp(const App());
}
