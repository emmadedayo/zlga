import 'package:sembast/sembast.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/ps_dao.dart';
import 'package:zlga/factory/model/UserModel.dart';

class UserAccountDao extends DrDao<UserModel> {
  UserAccountDao._() {
    init(UserModel());
  }

  static const String STORE_NAME = 'user_Account';
  final String _primaryKey = 'id';

  // Singleton instance
  static final UserAccountDao _singleton = UserAccountDao._();

  // Singleton accessor
  static UserAccountDao get instance => _singleton;

  @override
  String getStoreName() {
    return STORE_NAME;
  }

  @override
  String getPrimaryKey(UserModel object) {
    return object.id;
  }

  @override
  Filter getFilter(UserModel object) {
    return Filter.equals(_primaryKey, object.id);
  }
}
