import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bodyProgress = SpinKitRing(
      color: PsColors.mainColor,
      size: 40,
      lineWidth: 2,
    );
    return bodyProgress;
  }
}

class LoadingBuilderWhite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bodyProgress = SpinKitRing(
      color: PsColors.white,
      size: 40,
      lineWidth: 2,
    );
    return bodyProgress;
  }
}

class LoadingPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bodyProgress = SpinKitCircle(
      color: PsColors.mainColor,
      size: 40,
    );
    return bodyProgress;
  }
}
