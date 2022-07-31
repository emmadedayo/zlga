import 'dart:async';
import 'package:zlga/acadaar_ctrl/Db/Dao/eventDao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/information_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/partner_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/user_account_dao.dart';
import 'package:zlga/acadaar_ctrl/Db/common/dr_repository.dart';
import 'package:zlga/acadaar_ctrl/common/dr_resource.dart';
import 'package:zlga/acadaar_ctrl/common/dr_status.dart';
import 'package:zlga/factory/model/EventModel.dart';


class ClearAllDataRepository extends DrRepository {
  Future<dynamic> clearAllData(
      StreamController<DrResource<List<EventModel>>> allListStream) async {
    final EventDao eventDao = EventDao.instance;
    final InformationDao informationDao = InformationDao.instance;
    final PartnerDao partnerDao = PartnerDao.instance;
    final UserAccountDao panicDao = UserAccountDao.instance;


    await eventDao.deleteAll();
    await informationDao.deleteAll();
    await partnerDao.deleteAll();
    await panicDao.deleteAll();

    allListStream.sink.add(await eventDao.getAll(status: DrStatus.SUCCESS));
  }
}
