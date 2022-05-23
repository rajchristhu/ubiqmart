import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khf_wealth/util/connectivity_service.dart';
import 'package:khf_wealth/widgets/no_internet_dialog.dart';

import 'custom_progress_dialog.dart';

abstract class KFHBaseStateFullWidget<T> extends StatefulWidget {}

abstract class KFHBaseState<T extends KFHBaseStateFullWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    _checkConnectionState();
    _listenToConnectionState();
  }

  void _checkConnectionState() async {
    ConnectivityService.getInstance().isConnected().then((isConnected) {
      if (!isConnected) {
        _showNoInternet();
      }
    });
  }

  void _listenToConnectionState() {
    ConnectivityService.getInstance()
        .connectionStatusController
        .listen((hasConnection) {
      print("Connection status : " + hasConnection.toString());
      if (!hasConnection) {
        _showNoInternet();
      }
    });
  }

  void _showNoInternet() {
    if (mounted) {
      setState(() {
        showNoInternetDialog(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  /* @override
  void dispose() {
    super.dispose();
    setDialogStatus(false);
  }*/

  Widget buildBody() {
    return null;
  }

  showProgress(BuildContext context) {
    if (mounted) {
      setState(() {
        KFHProgressDialog.instance.showProgressDialog(context);
      });
    }
  }

  dismissProgress(BuildContext context) {
    if (mounted) {
      setState(() {
        KFHProgressDialog.instance.dismissDialog(context);
      });
    }
  }
}
