import 'package:flutter_clean_architecture/blocs/splash/splash_command.dart';
import 'package:flutter_clean_architecture/core/base/base.dart';

class SplashBloc extends BaseBloc<EmptyState, SplashCommand> {
  SplashBloc() : super(EmptyState());

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    command = SplashCommandNavLogin();
  }
}