import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';


class InfractionWidget extends StatelessWidget {
  const InfractionWidget({
    Key key,
    this.locationName,
    this.zlglId,
    this.date,
    this.status,
    this.rating,
    this.onTap,
  }) : super(key: key);

  final String locationName;
  final String zlglId;
  final String date;
  final String status;
  final double rating;
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
              Text(zlglId,style:setStyleContent(context, Colors.black, 11, FontWeight.w500))
            ],
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "ECT: ",
                      style: setStyleContent(context, Colors.black, 9, FontWeight.w500),
                    ),
                    TextSpan(
                      text: date,
                      style: setStyleContent(context, Colors.black, 9, FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Icon(LineIcons.arrowRight,color: PsColors.black,size: 20,)
            ],
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Status: ",
                      style: setStyleContent(context, Colors.black, 10, FontWeight.w500),
                    ),
                    TextSpan(
                      text: status,
                      style: setStyleContent(context, Colors.red, 9, FontWeight.w500),
                    ),
                  ],
                ),
              ),
              RatingBar.readOnly(
                initialRating: rating,
                size: 12,
                isHalfAllowed: true,
                halfFilledIcon: Icons.star_half,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class InfractionWidgetOld extends StatelessWidget {
  const InfractionWidgetOld({
    Key key,
    //@required this.data,
    this.onTap,
    this.onTap2,
  }) : super(key: key);


  final Function onTap;
  final Function onTap2;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData;
    return Container(
      margin: EdgeInsets.all(10.0),
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
              Text("Idi Ahun, Elebu Oja",style:setStyleContent(context, Colors.black, 13, FontWeight.w500)),
              Text("ZLGL023891932922",style:setStyleContent(context, Colors.black, 11, FontWeight.w500))
            ],
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "ECT: ",
                      style: setStyleContent(context, Colors.black, 9, FontWeight.w500),
                    ),
                    TextSpan(
                      text: "27 AUG 2021",
                      style: setStyleContent(context, Colors.black, 9, FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Icon(LineIcons.arrowRight,color: PsColors.black,size: 20,)
            ],
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Status: ",
                      style: setStyleContent(context, Colors.black, 10, FontWeight.w500),
                    ),
                    TextSpan(
                      text: "Pending",
                      style: setStyleContent(context, Colors.red, 9, FontWeight.w500),
                    ),
                  ],
                ),
              ),
              RatingBar.readOnly(
                initialRating: 3.5,
                size: 12,
                isHalfAllowed: true,
                halfFilledIcon: Icons.star_half,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
