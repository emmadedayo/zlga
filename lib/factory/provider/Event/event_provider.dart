import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/common/dr_provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/common/utils/utils.dart';
import 'package:zlga/factory/model/EventModel.dart';
import 'package:zlga/factory/reprository/event_repository.dart';
import 'package:zlga/factory/reprository/information_repository.dart';


class EventProvider extends DrProvider {
  EventProvider({@required EventRepository repo, @required this.psValueHolder, int limit = 0})
      : super(repo, limit) {
    _repo = repo;

    print('PinPoint Map Provider: $hashCode');

    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });
    dataListStream =
    StreamController<DrResource<List<EventModel>>>.broadcast();
    subscription = dataListStream.stream
        .listen((DrResource<List<EventModel>> resource) {
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

  EventRepository _repo;
  DrValueHolder psValueHolder;

  DrResource<List<EventModel>> _dataList =
  DrResource<List<EventModel>>(DrStatus.NOACTION, '', <EventModel>[]);

  DrResource<List<EventModel>> get dataList => _dataList;
  StreamSubscription<DrResource<List<EventModel>>> subscription;
  StreamController<DrResource<List<EventModel>>> dataListStream;

  @override
  void dispose() {
    subscription.cancel();
    dataListStream.close();
    isDispose = true;
    print('Emergency Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadResult(sessionKey,dateParam) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    await _repo.getEvent(dataListStream, sessionKey,dateParam,
        isConnectedToInternet, DrStatus.PROGRESS_LOADING);
  }


}
