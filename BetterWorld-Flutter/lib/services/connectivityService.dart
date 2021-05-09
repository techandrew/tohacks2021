import 'dart:async';

import 'package:connectivity/connectivity.dart';

import '../enums.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var connectionStatus = _getStatusFromResult(result);

      connectionStatusController.add(connectionStatus);
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;

      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;

      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;

      default:
        return null;
    }
  }
}