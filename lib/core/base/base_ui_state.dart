import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'base.dart';

abstract class BaseUiState<S extends StatefulWidget, B extends BaseBloc> extends BaseUiStateNoBloc<S> {
  B bloc = GetIt.I.get<B>();

  SubscriptionStream<>

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}