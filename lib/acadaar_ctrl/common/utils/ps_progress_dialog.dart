import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:flutter/material.dart';

class PsProgressDialog {
  PsProgressDialog._();

  static ArsProgressDialog _progressDialog;

  static Future<bool> showDialog(BuildContext context, {String message}) async {
    if (_progressDialog == null) {
      _progressDialog = ArsProgressDialog(context,
          blur: 2,
          backgroundColor: Color(0x33000000),
          dismissable: true,
          loadingWidget: Container(
            width: 50,
            height: 50,
            child: SpinKitRing(
              color: PsColors.mainColor,
              lineWidth: 2.0,
              size: 30.0,
            ),
          ),
      );
    }
    _progressDialog.show();

    return true;
  }

  static void dismissDialog() {
    if (_progressDialog != null) {
      _progressDialog.dismiss();
      _progressDialog = null;
    }
  }

  static bool isShowing() {
    if (_progressDialog != null) {
      return _progressDialog.isShowing;
    } else {
      return false;
    }
  }

  static void dismissDownloadDialog() {
    if (_progressDialog != null) {
      _progressDialog.dismiss();
      _progressDialog = null;
    }
  }
}
