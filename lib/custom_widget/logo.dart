import 'package:flutter/material.dart';
import 'app_svg_loader.dart';

class Logo extends StatelessWidget {
  final LogoSizeHelper _sizeHelper = LogoSizeHelper.getInstance();

  @override
  Widget build(BuildContext context) {
    return AppSvgLoader(
      svg: 'assets/logos/app_logo.svg',
      svgSize: _sizeHelper.logoSize(context),
    );
  }
}
