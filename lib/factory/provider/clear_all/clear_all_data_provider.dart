import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:zlga/acadaar_ctrl/common/dr_provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/factory/model/EventModel.dart';
import 'package:zlga/factory/reprository/clear_all_data_repository.dart';

class ClearAllDataProvider extends DrProvider {
  ClearAllDataProvider(
      {@required ClearAllDataRepository repo,
      this.psValueHolder,
      int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('ClearAllData Provider: $hashCode');
    allListStream = StreamController<DrResource<List<EventModel>>>.broadcast();
    subscription =
        allListStream.stream.listen((DrResource<List<EventModel>> resource) {
      updateOffset(resource.data.length);

      _basketList = resource;

      if (resource.status != DrStatus.BLOCK_LOADING &&
          resource.status != DrStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }

  StreamController<DrResource<List<EventModel>>> allListStream;
  ClearAllDataRepository _repo;
  DrValueHolder psValueHolder;

  DrResource<List<EventModel>> _basketList =
      DrResource<List<EventModel>>(DrStatus.NOACTION, '', <EventModel>[]);

  DrResource<List<EventModel>> get basketList => _basketList;
  StreamSubscription<DrResource<List<EventModel>>> subscription;
  @override
  void dispose() {
    subscription.cancel();

    isDispose = true;
    print('ClearAll Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> clearAllData() async {
    isLoading = true;
    _repo.clearAllData(allListStream);
  }
}
