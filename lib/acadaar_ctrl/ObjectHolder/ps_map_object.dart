import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';

abstract class PsMapObject<T> extends DrObject<T> {
  int sorting;

  List<String> getIdList(List<T> mapList);
}
