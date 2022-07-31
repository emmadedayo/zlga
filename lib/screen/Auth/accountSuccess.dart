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
import 'package:zlga/screen/Auth/ForgotPassword.dart';
import 'package:zlga/screen/Auth/loginScreen.dart';
import 'package:zlga/screen/widget/app_button.dart';
import 'package:zlga/screen/widget/inputWidget.dart';


class AccountSuccess extends StatefulWidget {
  const AccountSuccess({
    Key key,
    this.fullName,
  }) : super(key: key);
  final String fullName;

  @override
  _AccountSuccessState createState() => _AccountSuccessState();
}

class _AccountSuccessState extends State<AccountSuccess> {

  UserRepository userRepo;
  UserProvider userProvider;
  DrValueHolder psValueHolder;

  @override
  void initState() {
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
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
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
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Account Success",
                                style: setStyleContent(
                                    context, Colors.white, 25, FontWeight.normal),
                              ),
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
                              MediaQuery.of(context).size.height - 160.0,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Image.asset(
                                        'assets/images/accountSuccess.gif',
                                        height: 400,
                                        width: 300,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: SizeConfig.screenHeight * 0.03),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                        child: Text(
                                          'Congratulations ${widget.fullName}, your account has been activated, please login again',
                                          style: setStyleContent(context,PsColors.black,18,FontWeight.normal),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: SizeConfig.screenHeight * 0.03),


                                AppButton(
                                  type: ButtonType.PRIMARY,
                                  text: "Continue",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginScreen()));
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
      )
    );
  }
}
