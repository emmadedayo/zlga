import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/uiWidget/loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flash/flash.dart';

class PSProgressIndicator extends StatefulWidget {
  const PSProgressIndicator(this._status, this.context, {this.message});

  final DrStatus _status;
  final String message;
  final BuildContext context;

  @override
  _PSProgressIndicator createState() => _PSProgressIndicator();
}

class _PSProgressIndicator extends State<PSProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (widget._status == DrStatus.ERROR &&
        widget.message != null &&
        widget.message != '') {

      widget.context.showSuccessBar(content: Text(widget.message));

    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Visibility(
          visible: widget._status == DrStatus.PROGRESS_LOADING,
          child: SpinKitRing(
            color: PsColors.mainColor,
            lineWidth: 2.0,
            size: 30.0,
          )
        ),
      ),
    );
  }
}
