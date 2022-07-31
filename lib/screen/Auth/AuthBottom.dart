import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/screen/Auth/SignUpScreen.dart';
import 'package:zlga/screen/Auth/loginScreen.dart';
import 'package:zlga/screen/widget/app_button.dart';


class AuthBottomController extends StatefulWidget {
  @override
  _ChoseLoginState createState() => _ChoseLoginState();
}


class _ChoseLoginState extends State<AuthBottomController> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return PlatformScaffold(
      iosContentPadding: false,
      iosContentBottomPadding: false,
     // backgroundColor: PsColors.mainColor,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image.asset(
                          "assets/images/loginAuth.png",
                          scale: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 24.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 247, 249, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        "Welcome to Zlgl Obalalliance!",
                        style: setStyleContent(
                            context, Colors.black, 20, FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                        style: setStyleContent(
                            context, Colors.black, 15, FontWeight.normal),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      // Let's create a generic button widget
                      AppButton(
                        text: "Log In",
                        type: ButtonType.PLAIN,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      AppButton(
                        text: "Create an Account",
                        type: ButtonType.PRIMARY,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));

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
    );
  }
}