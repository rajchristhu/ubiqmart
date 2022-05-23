import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  // var connectionStatusControllerSink = PublishSubject<bool>();
  final connectionStatusController = PublishSubject<bool>();
  StreamSubscription subscription;

  static final ConnectivityService _instance =
      ConnectivityService._privateConstructor();

  ConnectivityService._privateConstructor() {
    print("Private constructor called");
    /*connectionStatusController =
        connectionStatusControllerSink.stream.asBroadcastStream();*/

    /*DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          connectionStatusControllerSink.sink.add(true);
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          connectionStatusControllerSink.sink.add(false);
          break;
      }
    });*/
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      print("Connection : result : " + result.toString());
      if (result != ConnectivityResult.none) {
        print("Connection : result inside : " + result.toString());

        bool isDeviceConnected = await isConnected();
        if (isDeviceConnected) {
          connectionStatusController.add(true);
        } else {
          connectionStatusController.add(false);
        }
      } else {
        print("Connection : Not connected to any device");
        connectionStatusController.add(false);
      }
    });
  }

  static ConnectivityService getInstance() {
    return _instance;
  }

  static ConnectivityService get instance => _instance;

/*
  ConnectivityService() {

  }
*/

  Future<bool> isConnected() async {
    return await DataConnectionChecker().hasConnection;
  }

  dispose() {
    // if (!connectionStatusControllerSink.isClosed) {
    //   connectionStatusControllerSink.close();
    // }
    if (subscription != null) {
      subscription.cancel();
    }
  }
}
