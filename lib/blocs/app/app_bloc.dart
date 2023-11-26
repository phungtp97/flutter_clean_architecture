import 'dart:ui';

import 'package:flutter_clean_architecture/blocs/app/app.dart';
import 'package:flutter_clean_architecture/core/base/base.dart';
import 'package:flutter_clean_architecture/local/local.dart';
import 'package:injectable/injectable.dart';

import '../../enums/enums.dart';
import '../../helper/helper.dart';

@singleton
class AppBloc extends BaseBloc<AppState, AppCommand> {
  final SharedPrefServices _sharedPrefs;

  AppBloc(this._sharedPrefs) : super(AppState(locale: const Locale('en', 'US')));

  @disposeMethod
  @override
  void dispose() {
    super.dispose();
  }

  Stream<Locale> get localeStream => stream
      .where((event) => event.locale != null)
      .map((event) => event.locale!)
      .distinct();

  Future<void> init() async {
    final languageCode = _sharedPrefs.language;
    emit(AppState(
      state: state,
      locale: LocaleBuilder.getLocale(languageCode),
    ));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _sharedPrefs.setLanguage(languageCode);
    emit(AppState(
      locale: LocaleBuilder.getLocale(languageCode),
      state: state,
    ));
  }

  LanguageEnum get currentLanguage {
    final String languageCode = _sharedPrefs.language;
    return LocaleBuilder.getLocaleEnum(languageCode);
  }
}