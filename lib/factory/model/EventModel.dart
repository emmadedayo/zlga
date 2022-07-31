import 'package:quiver/core.dart';
import 'package:zlga/acadaar_ctrl/ObjectHolder/ps_object.dart';


class EventModel extends DrObject<EventModel> {
  EventModel({
    this.id,
    this.eventName,
    this.eventLocation,
    this.eventDate,
  });

  String id;
  String eventName;
  String eventLocation;
  String eventDate;

  @override
  bool operator ==(dynamic other) => other is EventModel && id == other.id;

  @override
  int get hashCode {
    return hash2(id.hashCode, id.hashCode);
  }

  @override
  String getPrimaryKey() {
    return id;
  }

  @override
  EventModel fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return EventModel(
        id: dynamicData['id'],
        eventName: dynamicData['event_name'],
        eventLocation: dynamicData['event_location'],
        eventDate: dynamicData['event_date'],
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(EventModel object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = object.id;
      data['event_name'] = object.eventName;
      data['event_location'] = object.eventLocation;
      data['event_date'] = object.eventDate;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<EventModel> fromMapList(List<dynamic> dynamicDataList) {
    final List<EventModel> subBankModelList = <EventModel>[];

    if (dynamicDataList != null) {
      for (dynamic dynamicData in dynamicDataList) {
        if (dynamicData != null) {
          subBankModelList.add(fromMap(dynamicData));
        }
      }
    }
    return subBankModelList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<EventModel> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (EventModel data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}

///FlushbarHelper.createError(message: 'We don\'t have permission to read/write images.',title: 'Permission Error');