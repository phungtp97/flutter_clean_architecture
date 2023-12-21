import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class CredentialService {
  final BehaviorSubject<bool> _bhAuthorizedStatus = BehaviorSubject<bool>.seeded(false);

  StreamSubscription<ConnectivityResult>? _subscription;
  bool? get currentAuthorizedStatus =>
      _bhAuthorizedStatus.valueOrNull;
  Stream<bool> get authorizedStatusStream =>
      _bhAuthorizedStatus.stream;

  CredentialService();

  void update(bool hasAuthorized) => _bhAuthorizedStatus.add(hasAuthorized);

  @disposeMethod
  dispose(){
    _bhAuthorizedStatus.close();
    _subscription?.cancel();
  }
}
