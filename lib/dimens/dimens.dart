import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
part 'appbar/appbar_dimens.dart';
part 'navigation_bar/navigation_bar_dimens.dart';

class Dimens {
  Dimens._();

  ///All phone dimension classes [AppBarDimensions], [NavigationBarDimensions]
  static const _appBarPhone = AppBarDimensions.phone();

  static const _navigationBarPhone = NavigationBarDimensions.phone();

  ///All tablet dimension classes [NavigationBarDimensions], [AppBarDimensions]
  static const _navigationBarTablet = NavigationBarDimensions.tablet();

  static const _appbarTablet = AppBarDimensions.tablet();

  static AppBarDimensions appBar(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)) {
      return _appBarPhone;
    } else {
      return _appbarTablet;
    }
  }

  static NavigationBarDimensions navigationBar(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)) {
      return _navigationBarPhone;
    } else {
      return _navigationBarTablet;
    }
  }
}
