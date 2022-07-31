import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zlga/acadaar_ctrl/Holder/App_info.dart';
import 'package:zlga/acadaar_ctrl/Holder/appInfoHolder.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/common/utils/utils.dart';
import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/constant/route_paths.dart';
import 'package:zlga/factory/provider/app_info/app_info_provider.dart';
import 'package:zlga/factory/provider/clear_all/clear_all_data_provider.dart';
import 'package:zlga/factory/reprository/app_info_repository.dart';
import 'package:zlga/factory/reprository/clear_all_data_repository.dart';
import 'package:zlga/screen/widget/errorWidget.dart';

class ScreenFlash extends StatefulWidget {
  @override
  _ScreenFlashState createState() => new _ScreenFlashState();
}

class _ScreenFlashState extends State<ScreenFlash>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  double beginAnim = 0.0;
  double endAnim = 1.0;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  Future<dynamic> callDateFunction(AppInfoProvider provider,
      ClearAllDataProvider clearAllDataProvider, BuildContext context) async {
    String realStartDate = '0';
    String realEndDate = '0';
    if (await Utils.checkInternetConnectivity()) {
      realEndDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
      final AppInfoParameterHolder appInfoParameterHolder = AppInfoParameterHolder(userId: Utils.checkUserLoginId(provider.psValueHolder),countryID: 'NG');

      final DrResource<DrAppInfo> _psAppInfo =
      await provider.loadDeleteHistory(appInfoParameterHolder.toMap());

      if (_psAppInfo.status == DrStatus.SUCCESS) {
        //provider.replaceDate(realStartDate, realEndDate);
        if (_psAppInfo.data.appVersion != DrConfig.app_version) {
          if (Platform.isAndroid) {
            showVersionAndroid(context,
                "You are running an older version of Folo app, please update your app to ${_psAppInfo.data.appVersion} or newer");
          } else if (Platform.isIOS) {
            showVersionIos(context,
                "You are running an older version of Folo app, please update your app to ${_psAppInfo.data.appVersion} or newer");
          }
        } else if (_psAppInfo.data.loginAgain == "false") {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.home,
          );
        } else if (_psAppInfo.data.loginAgain == "true") {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.loginBottom,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.loginBottom,
          );
        }
      } else if (_psAppInfo.status == DrStatus.ERROR) {
        Navigator.pushReplacementNamed(
          context,
          RoutePaths.loginBottom,
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        RoutePaths.loginBottom,
      );
    }
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppInfoRepository repo1;
    AppInfoProvider provider;
    ClearAllDataRepository clearAllDataRepository;
    ClearAllDataProvider clearAllDataProvider;
    DrValueHolder valueHolder;
    PsColors.loadColor(context);
    valueHolder = Provider.of<DrValueHolder>(context);
    repo1 = Provider.of<AppInfoRepository>(context);
    clearAllDataRepository = Provider.of<ClearAllDataRepository>(context);
    var size = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ClearAllDataProvider>(
            lazy: false,
            create: (BuildContext context) {
              clearAllDataProvider = ClearAllDataProvider(repo: clearAllDataRepository, psValueHolder: valueHolder);

              return clearAllDataProvider;
            }),
        ChangeNotifierProvider<AppInfoProvider>(
            lazy: false,
            create: (BuildContext context) {
              provider =
                  AppInfoProvider(repo: repo1, psValueHolder: valueHolder);
              callDateFunction(provider, clearAllDataProvider, context);
              return provider;
            }),
      ],
      child: Consumer<AppInfoProvider>(
        builder: (BuildContext context, AppInfoProvider clearAllDataProvider,
            Widget child) {
          return SafeArea(
            child: Scaffold(
                backgroundColor: PsColors.white,
                body: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: new Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 150.0),
                            child: Center(
                                child: Image.asset(
                                  'assets/images/zlglLogo.png',
                                  width: 250,
                                )),
                          ),
                          SizedBox(
                            height: sizeHeight - 290,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: size - 320, right: size - 320),
                              child: Center(
                                child: SpinKitRing(
                                  color: PsColors.mainColor,
                                  lineWidth: 2.0,
                                  size: 30.0,
                                ),
                              )),
                          Container(
                            // width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 150.0),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                DrConfig.app_name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: PsColors.mainColor,
                                    fontSize: 20),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          );
        },
      ),
      // ),
    );
  }
}
