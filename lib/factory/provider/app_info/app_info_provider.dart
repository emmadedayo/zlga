import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/Holder/App_info.dart';
import 'package:zlga/acadaar_ctrl/common/dr_provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/factory/reprository/app_info_repository.dart';


class AppInfoProvider extends DrProvider {
  AppInfoProvider(
      {@required AppInfoRepository repo, this.psValueHolder, int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('App Info Provider: $hashCode');
    isDispose = false;
  }

  AppInfoRepository _repo;
  DrValueHolder psValueHolder;

  DrResource<DrAppInfo> drResource =
  DrResource<DrAppInfo>(DrStatus.NOACTION, '', null);

  DrResource<DrAppInfo> get appInfo => drResource;

  @override
  void dispose() {
    isDispose = true;
    print('App Info Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadDeleteHistory(Map<dynamic, dynamic> jsonMap) async {
    isLoading = true;

    final DrResource<DrAppInfo> drAppInfo = await _repo.postDeleteHistory(jsonMap);
    await replaceAppSettings(
        '',
    );
    replaceAppName(drAppInfo.data.appName);


    return drAppInfo;
  }

  Future<void> loadDeleteHistorywithNotifier(
      Map<dynamic, dynamic> jsonMap) async {
    isLoading = true;

    final DrResource<DrAppInfo> drAppInfo =await _repo.postDeleteHistory(jsonMap);
    drResource = drAppInfo;

    if (drResource != null) {
      notifyListeners();
    }
  }
}
