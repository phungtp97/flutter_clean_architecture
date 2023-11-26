import 'package:flutter_clean_architecture/core/service/connectivity_service.dart';

import 'base.dart';

class BaseBloc<S extends BaseState, C extends Command> extends Cubit<S>{

  BaseBloc(super.initialState) {
    _commandController = BehaviorSubject<C>();
    _errorController = BehaviorSubject<Object>();
    _loadingController = BehaviorSubject.seeded(false);
  }

  bool get hasConnection => GetIt.I.get<ConnectivityService>().hasInternetConnection;

  late final BehaviorSubject<Object> _errorController;
  late final BehaviorSubject<C> _commandController;
  late final BehaviorSubject<bool> _loadingController;

  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<Object> get errorStream => _errorController.stream;

  Stream<C> get commandStream => _commandController.stream;

  @mustCallSuper
  void dispose() {
    _loadingController.close();
    _errorController.close();
    _commandController.close();
  }

  set loading(bool s) => _loadingController.add(s);

  set command(C s) => _commandController.add(s);

  set error(Object s) => _errorController.add(s);
}