import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/size_config.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/factory/provider/userProvider/user_provider.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';
import 'package:zlga/screen/Profile/UserProfile/editProfileScreen.dart';
import 'package:zlga/screen/Profile/UserProfile/userSettingsIndexScreen.dart';
import 'package:zlga/screen/widget/widgetMenu.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Welcome Back,\n",
                                        style: setStyleContent(context, Colors.white, 20, FontWeight.w500),
                                      ),

                                      TextSpan(
                                        text: "FlutterPanda!",
                                        style: setStyleContent(context, Colors.white, 20, FontWeight.w500),
                                        ),
                                    ],
                                  ),
                                ),
                                Image.network(
                                  "https://www.kindpng.com/picc/m/497-4973038_profile-picture-circle-png-transparent-png.png",height: 50,width: 50,
                                )
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Text(
                                "Profile Settings",
                                style: setStyleContent(context, Colors.black, 18, FontWeight.normal),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            MenuWidget(
                              title: 'Account Profile',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()))
                              }),
                            ),
                            Divider(),
                            MenuWidget(
                              title: 'Proud Partner',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountProfileController()))
                              }),
                            ),
                            Divider(),
                            MenuWidget(
                              title: 'Settings',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreenIndex()))
                              }),
                            ),
                            Divider(),
                            MenuWidget(
                              title: 'FAQ',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountProfileController()))
                              }),
                            ),
                            Divider(),
                            MenuWidget(
                              title: 'Data Policy',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountProfileController()))
                              }),
                            ),
                            Divider(),
                            MenuWidget(
                              title: 'About App',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountProfileController()))
                              }),
                            ),
                            Divider(),
                            MenuWidget(
                              title: 'Share App',
                              subtitle: 'Manage and control your wyd account',
                              onTap: (() => {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountProfileController()))
                              }),
                            ),
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
