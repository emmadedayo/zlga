import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zlga/acadaar_ctrl/config/dr_config.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';

class MenuWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuWidget(
      {Key key,
        @required this.title,
        @required this.subtitle,
        @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(
          title,
          style: setStyleContent(context,PsColors.black,14,FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: setStyleContent(context,PsColors.grey,12,FontWeight.w400),
        ),
        trailing: Icon(Icons.chevron_right),
      ),
      onTap: onTap,
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.lineIcons,
    this.context,
    this.onTap,
  }) : super(key: key);


  final BuildContext context;
  final String title;
  final String subTitle;
  final String lineIcons;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: PsColors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child:
                lineIcons == "weather"?
                Icon(LineIcons.cloud,color: PsColors.black,):lineIcons == "calendar"?
                Icon(LineIcons.calendar,color: PsColors.black,):lineIcons == "partner"?
                Icon(LineIcons.userFriends,color: PsColors.black,):lineIcons == "information"?
                Icon(LineIcons.info,color: PsColors.black,):Icon(LineIcons.info,color: PsColors.black,)
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                title,
                style: setStyleContent(context, PsColors.black, 18, FontWeight.normal),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                subTitle,
                style: setStyleContent(context, PsColors.black, 13, FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}