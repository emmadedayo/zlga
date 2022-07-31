import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/common/dr_provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/common/utils/utils.dart';
import 'package:zlga/factory/model/InformationModel.dart';
import 'package:zlga/factory/reprository/information_repository.dart';


class InformationProvider extends DrProvider {
  InformationProvider({@required InformationRepository repo, @required this.psValueHolder, int limit = 0})
      : super(repo, limit) {
    _repo = repo;

    print('PinPoint Map Provider: $hashCode');

    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });
    dataListStream =
    StreamController<DrResource<List<InformationModel>>>.broadcast();
    subscription = dataListStream.stream
        .listen((DrResource<List<InformationModel>> resource) {
      updateOffset(resource.data.length);

      _dataList = resource;

      if (resource.status != DrStatus.BLOCK_LOADING &&
          resource.status != DrStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }

  InformationRepository _repo;
  DrValueHolder psValueHolder;

  DrResource<List<InformationModel>> _dataList =
  DrResource<List<InformationModel>>(DrStatus.NOACTION, '', <InformationModel>[]);

  DrResource<List<InformationModel>> get dataList => _dataList;
  StreamSubscription<DrResource<List<InformationModel>>> subscription;
  StreamController<DrResource<List<InformationModel>>> dataListStream;

  @override
  void dispose() {
    subscription.cancel();
    dataListStream.close();
    isDispose = true;
    print('Emergency Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadResult(sessionKey) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    await _repo.getPinPoint(dataListStream, sessionKey, isConnectedToInternet, DrStatus.PROGRESS_LOADING);
  }


}
