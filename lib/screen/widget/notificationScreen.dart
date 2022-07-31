import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';


class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
    this.locationName,
    this.date,
    this.onTap,
  }) : super(key: key);

  final String locationName;
  final String date;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData;
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: PsColors.white,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0,bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(locationName,style:setStyleContent(context, Colors.black, 13, FontWeight.w500)),
            ],
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(date,
                style: setStyleContent(context, Colors.black, 9, FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

