import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class SplashPage extends KFHBaseStateFullWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends KFHBaseState<SplashPage> {
  SplashSizeHelper _sizeHelper = SplashSizeHelper.getInstance();

  @override
  void initState() {
    super.initState();
    _navigate();
  }


  ///Navigate to Login screen
  void _navigate() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutePaths.Login);
      }
    });
  }

  @override
  Widget buildBody() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///build app logo at the center
  Widget _buildLogo() {
    return FadeInUp(
      from: 5,
      duration: Duration(milliseconds: 300),
      delay: Duration(milliseconds: 300),
      child: Logo(),
    );
  }
}
