import 'package:sembast/sembast.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/ps_dao.dart';
import 'package:zlga/factory/model/InformationModel.dart';
import 'package:zlga/factory/model/PartnerModel.dart';

class PartnerDao extends DrDao<PartnerModel> {
  PartnerDao._() {
    init(PartnerModel());
  }

  static const String STORE_NAME = 'zlgl_Partner';
  final String _primaryKey = 'id';

  // Singleton instance
  static final PartnerDao _singleton = PartnerDao._();

  // Singleton accessor
  static PartnerDao get instance => _singleton;

  @override
  String getStoreName() {
    return STORE_NAME;
  }

  @override
  String getPrimaryKey(PartnerModel object) {
    return object.id;
  }

  @override
  Filter getFilter(PartnerModel object) {
    return Filter.equals(_primaryKey, object.id);
  }
}
