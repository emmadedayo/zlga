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
import 'package:zlga/screen/Auth/AuthBottom.dart';
import 'package:zlga/screen/Auth/ForgotPassword.dart';
import 'package:zlga/screen/Auth/VerifyAccountScreen.dart';
import 'package:zlga/screen/Auth/accountSuccess.dart';
import 'package:zlga/screen/widget/app_button.dart';
import 'package:zlga/screen/widget/inputWidget.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key key,
    this.onProfileSelected,
  }) : super(key: key);
  final Function onProfileSelected;

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController firstname = new TextEditingController();
  final TextEditingController lastname = new TextEditingController();
  final TextEditingController phoneNumber = new TextEditingController();

  bool passwordVisible;
  bool remember = false;
  UserRepository userRepo;
  UserProvider userProvider;
  DrValueHolder psValueHolder;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      backgroundColor: PsColors.mainColor,
      body: SafeArea(
        bottom: false,
        child: Container(
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
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 15.0,
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
                              "Update Profile",
                              style: setStyleContent(
                                  context, Colors.white, 25, FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight:
                            MediaQuery.of(context).size.height - 180.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Lets make a generic input widget
                              InputWidget(
                                textEditingController: firstname,
                                topLabel: "Firstname",
                                hintText: "Enter your first name",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                textEditingController: lastname,
                                topLabel: "Lastname",
                                hintText: "Enter your last name",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                textEditingController: email,
                                topLabel: "Email",
                                hintText: "Enter your email",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                textEditingController: phoneNumber,
                                topLabel: "Phone Number",
                                hintText: "Enter your phone number",
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              AppButton(
                                type: ButtonType.PRIMARY,
                                text: "Update Now",
                                onPressed: () {

                                },
                              )
                            ],
                          ),
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
