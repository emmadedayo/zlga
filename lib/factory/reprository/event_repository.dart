import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/eventDao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/information_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/common/dr_api_service.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/acadaar_ctrl/constant/dr_constants.dart';
import 'package:zlga/factory/model/EventModel.dart';



class EventRepository extends DrRepository {
  EventRepository(
      {@required DrApiService drApiService, @required EventDao eventDao}) {
    _drApiService = drApiService;
    _eventDao = eventDao;
  }

  String primaryKey = 'id';
  DrApiService _drApiService;
  EventDao _eventDao;

  Future<dynamic> insert(EventModel data) async {
    return _eventDao.insert(primaryKey, data);
  }

  Future<dynamic> update(EventModel data) async {
    return _eventDao.update(data);
  }

  Future<dynamic> delete(EventModel data) async {
    return _eventDao.delete(data);
  }

  Future<dynamic> getEvent(
      StreamController<DrResource<List<EventModel>>> regionListStream,
      String sessionID,
      String dateParam,
      bool isConnectedToInternet,
      DrStatus status,
      {bool isNeedDelete = true,
        bool isLoadFromServer = true}) async {
    regionListStream.sink.add(await _eventDao.getAll(status: status));

    if (isConnectedToInternet) {
      final DrResource<List<EventModel>> _resource = await _drApiService.getEvent(sessionID,dateParam);

      if (_resource.status == DrStatus.SUCCESS) {
        await _eventDao.deleteAll();
        await _eventDao.insertAll(primaryKey, _resource.data);
      } else {
        if (_resource.errorCode == DrConst.ERROR_CODE_10001) {
          await _eventDao.deleteAll();
        }
      }
      regionListStream.sink.add(await _eventDao.getAll());
    }
  }



}
