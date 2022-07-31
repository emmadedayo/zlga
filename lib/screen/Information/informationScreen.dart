import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/common/utils/utils.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/size_config.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/factory/provider/userProvider/user_provider.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';
import 'package:zlga/screen/Event/eventScreenIndex.dart';
import 'package:zlga/screen/Information/informationList.dart';
import 'package:zlga/screen/widget/widgetMenu.dart';

class InformationController extends StatefulWidget {
  @override
  _InformationControllerState createState() => _InformationControllerState();
}

class _InformationControllerState extends State<InformationController> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  Position position;
  String areaName = "Lagos", mainDescription = " Raining", temp = "18", humidity = "1", wind = "1.0";
  WeatherFactory wf = new WeatherFactory("856822fd8e22db5e1ba48c0e7d69844a", language: Language.ENGLISH);
  double lat = 55.0111;
  double lon = 15.0569;


  Future<void> _determinePosition() async {
    if (await Utils.determinePosition()) {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        Weather w = await wf.currentWeatherByLocation(position.latitude, position.longitude);
       // print(w.);
        if(mounted){
          setState(() {
            areaName = w.areaName;
            mainDescription = w.weatherMain;
            temp = w.temperature.celsius.round().toString();
            humidity = w.humidity.toString();
            wind = w.windSpeed.toString();
          });
        }
      }
    } else {
      showModalBottomSheet(
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),)),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
                child: Container(
                  margin: EdgeInsets.only(top: 6, left: 5, right: 5),
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text('Location Service Report',
                            style: setStyleContent(context, Color(0xff08133D),
                                15, FontWeight.w400)),
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Icon(
                                Icons.not_listed_location_outlined,
                                size: 64,
                                color: PsColors.black,
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Text(
                              "Whoops",
                              style: setStyleContent(
                                  context, PsColors.grey, 12, FontWeight.w600,
                                  letterSpacing: 0.2),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Location services is disabled.",
                                  style: setStyleContent(
                                      context, PsColors.grey, 12,
                                      FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    "Please check your internet settings",
                                    style: setStyleContent(
                                        context, PsColors.grey, 12,
                                        FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 130.0,
                            height: 45.0,
                            child: PlatformButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  _determinePosition();
                                },
                                child: Text('Try Again', style: setStyleContent(
                                    context, PsColors.white, 14,
                                    FontWeight.normal),),
                                material: (_, __) =>
                                    MaterialRaisedButtonData(
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius
                                                .circular(5.0)),
                                        color: PsColors.mainColor,
                                        textColor: PsColors.white
                                    ),
                                cupertino: (_, __) =>
                                    CupertinoButtonData(
                                      color: PsColors.mainColor,
                                    )
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 130.0,
                            height: 45.0,
                            child: PlatformButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  openAppSettings();
                                },
                                child: Text('Open Settings',
                                  style: setStyleContent(
                                      context, PsColors.white, 14,
                                      FontWeight.normal),),
                                material: (_, __) =>
                                    MaterialRaisedButtonData(
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius
                                                .circular(5.0)),
                                        color: PsColors.black,
                                        textColor: PsColors.white
                                    ),
                                cupertino: (_, __) =>
                                    CupertinoButtonData(
                                      color: PsColors.mainColor,
                                    )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      backgroundColor: PsColors.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/washing_machine_illustration.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Information",style: setStyleContent(context, Colors.white, 25, FontWeight.normal),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 200.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                            Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){

                                          },
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
                                                    child:Icon(LineIcons.cloud,color: PsColors.black,)
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Weather | ",
                                                        style: setStyleContent(context, Colors.black, 16, FontWeight.normal),
                                                      ),
                                                      TextSpan(
                                                        text: areaName,
                                                        style: setStyleContent(context, Colors.black, 12, FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.0,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      ///crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: temp,
                                                                style: setStyleContent(context, PsColors.mainColor, 14, FontWeight.normal),
                                                              ),
                                                              TextSpan(
                                                                text: "\u2103 | \u2109 ",
                                                                style: setStyleContent(context, PsColors.mainColor, 14, FontWeight.normal),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3,),
                                                    Row(
                                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          mainDescription,
                                                          style: setStyleContent(context, Colors.black, 14, FontWeight.normal),
                                                        ),

                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: wind + ' km\h ',
                                                                style: setStyleContent(context, Colors.black, 11, FontWeight.normal),
                                                              ),

                                                              TextSpan(
                                                                text: humidity+"%",
                                                                style: setStyleContent(context, Colors.black, 11, FontWeight.normal),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      InfoWidget(
                                        context: context,
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreenIndex()));

                                        },
                                        title: 'Event',
                                        subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
                                        lineIcons: 'calendar',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      InfoWidget(
                                        context: context,
                                        title: 'Proud Partners',
                                        subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
                                        lineIcons: 'partner',
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      InfoWidget(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => InformationIndexScreen()));
                                        },
                                        context: context,
                                        title: 'Information ',
                                        subTitle: 'Stay informed with the latest news and happenings around you',
                                        lineIcons: 'information',
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            )
                            //  LatestOrders(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
