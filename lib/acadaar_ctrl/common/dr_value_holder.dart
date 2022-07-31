import 'package:flutter/material.dart';

class DrValueHolder {
  DrValueHolder({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phoneNumber,
    this.userImage,
    this.notification,
    this.location,
    this.postAsAy,
    this.fcm,
    this.sessionToken,
    this.appName,

  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String userImage;
  String notification;
  String location;
  String postAsAy;
  String fcm;
  String sessionToken;
  String appName;
}

