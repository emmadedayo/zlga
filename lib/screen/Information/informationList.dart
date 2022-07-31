import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/size_config.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/factory/provider/userProvider/user_provider.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';
import 'package:zlga/screen/widget/widgetCard.dart';
import 'package:zlga/screen/widget/widgetInfraction.dart';

class InformationIndexScreen extends StatefulWidget {
  @override
  _InformationIndexScreenState createState() => _InformationIndexScreenState();
}

class _InformationIndexScreenState extends State<InformationIndexScreen> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;


  @override
  void initState() {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                LineIcons.arrowLeft,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Our Blog",
                              style: setStyleContent(
                                  context, Colors.white, 25, FontWeight.normal),
                            ),
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
                            BlogCard(
                              url: 'https://www.zlglobalalliance.com/img/dummies/blog/dejipalace1.jpg',
                              title: 'DEJI OF AKURE ENDORSES ZL GLOBAL ALLIANCE IN AKURE',
                              date: '20-Aug-2021',
                            ),
                            BlogCard(
                              url: 'https://www.zlglobalalliance.com/img/dummies/blog/dejipalace1.jpg',
                              title:  'DEJI OF AKURE ENDORSES ZL GLOBAL ALLIANCE IN AKURE',
                              date: '20-Aug-2021',
                            ),
                            BlogCard(
                              url: 'https://www.zlglobalalliance.com/img/dummies/blog/dejipalace1.jpg',
                              title: 'DEJI OF AKURE ENDORSES ZL GLOBAL ALLIANCE IN AKURE',
                              date: '20-Aug-2021',
                            ),
                            BlogCard(
                              url: 'https://www.zlglobalalliance.com/img/dummies/blog/dejipalace1.jpg',
                              title: 'DEJI OF AKURE ENDORSES ZL GLOBAL ALLIANCE IN AKURE',
                              date: '20-Aug-2021',
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
