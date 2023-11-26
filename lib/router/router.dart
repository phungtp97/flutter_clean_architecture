import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../widgets/custom_page_route/custom_page_route.dart';
import 'route_arguments.dart';

class Routes {
  //? Splash route
  static String get splash => '/';

  static String get home => '/home';

  static String get signup => '/login';

  static List<String> transparentRoutes = [

  ];

  static List<String> transitionBottomToTops = [

  ];

  static getRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e, stackTrace) {
      //Sentry
      widget = Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(
            builder: (context) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  '404 NOT FOUND',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      );
    }

    if (transparentRoutes.contains(settings.name)) {
      return MaterialTransparentRoute(builder: (_) => widget, settings: settings);
    }

    if (settings.arguments is RouteArguments && !(settings.arguments as RouteArguments).opaque) {
      RouteSettings newSettings =
          RouteSettings(name: settings.name, arguments: (settings.arguments as RouteArguments).data);
      return PageRouteBuilder(opaque: false, pageBuilder: (_, __, ___) => widget, settings: newSettings);
    }

    if(transitionBottomToTops.contains(settings.name)){
      return FadeBottomToTopPageRoute(
        builder: (_) => widget,
        settings: settings,
      );
    }

    return CupertinoPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }
}