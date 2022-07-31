import 'package:sembast/sembast.dart';
import 'package:zlga/acadaar_ctrl/Db/Dao/ps_dao.dart';
import 'package:zlga/factory/model/EventModel.dart';


class EventDao extends DrDao<EventModel> {
  EventDao._() {
    init(EventModel());
  }

  static const String STORE_NAME = 'zlgl_Event';
  final String _primaryKey = 'id';

  // Singleton instance
  static final EventDao _singleton = EventDao._();

  // Singleton accessor
  static EventDao get instance => _singleton;

  @override
  String getStoreName() {
    return STORE_NAME;
  }

  @override
  String getPrimaryKey(EventModel object) {
    return object.id;
  }

  @override
  Filter getFilter(EventModel object) {
    return Filter.equals(_primaryKey, object.id);
  }
}
