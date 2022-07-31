import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/Holder/App_info.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_service.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';


class AppInfoRepository extends DrRepository {
  AppInfoRepository({
    @required DrApiService psApiService,
  }) {
    _psApiService = psApiService;
  }
  DrApiService _psApiService;

  Future<DrResource<DrAppInfo>> postDeleteHistory(Map<dynamic, dynamic> jsonMap,
      {bool isLoadFromServer = true}) async {
    final DrResource<DrAppInfo> _resource =
        await _psApiService.postPsAppInfo(jsonMap);

    if (_resource.status == DrStatus.SUCCESS) {
      return _resource;
    } else {
      final Completer<DrResource<DrAppInfo>> completer =
          Completer<DrResource<DrAppInfo>>();
      completer.complete(_resource);
      return completer.future;
    }
  }
}
