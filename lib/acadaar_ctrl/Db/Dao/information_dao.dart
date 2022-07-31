import 'package:sembast/sembast.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/ps_dao.dart';
import 'package:zlga/factory/model/InformationModel.dart';

class InformationDao extends DrDao<InformationModel> {
  InformationDao._() {
    init(InformationModel());
  }

  static const String STORE_NAME = 'zlgl_information';
  final String _primaryKey = 'id';

  // Singleton instance
  static final InformationDao _singleton = InformationDao._();

  // Singleton accessor
  static InformationDao get instance => _singleton;

  @override
  String getStoreName() {
    return STORE_NAME;
  }

  @override
  String getPrimaryKey(InformationModel object) {
    return object.id;
  }

  @override
  Filter getFilter(InformationModel object) {
    return Filter.equals(_primaryKey, object.id);
  }
}
