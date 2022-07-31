import 'package:flutter/material.dart' show Colors, Icons, ScaffoldState;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/factory/provider/userProvider/user_provider.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';
import 'package:zlga/screen/Information/informationScreen.dart';
import 'package:zlga/screen/Infraction/infractionIndexScreen.dart';
import 'package:zlga/screen/Notification/notificationIndexScreen.dart';
import 'package:zlga/screen/Profile/ProfileDashBoardIndex.dart';


class RootBottom extends StatefulWidget {
  _RootBottomStates createState() => _RootBottomStates();
}

class _RootBottomStates extends State<RootBottom> with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  final GlobalKey<ScaffoldState> _rootScaffoldKey = new GlobalKey<ScaffoldState>();
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  UserRepository userRepository;


  @override
  void dispose() {
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    psValueHolder = Provider.of<DrValueHolder>(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        backgroundColor: PsColors.white,
        child: Icon(LineIcons.plusCircle,color: PsColors.black,),
        onPressed: () async {

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          fixedColor: PsColors.mainColor,
          unselectedFontSize: 10,
          selectedFontSize: 15,
          unselectedItemColor: PsColors.grey,
          //selectedItemColor: PsColors.mainColor,
          selectedLabelStyle: setStyleContent(context,PsColors.mainColor,11,FontWeight.normal),
          unselectedLabelStyle: setStyleContent(context,PsColors.grey,11,FontWeight.normal),
          onTap: (index) {
            _selectedTabIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(LineIcons.home,color: PsColors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.bell,color: PsColors.black,),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.info,color: PsColors.black,),
              label: 'Partner',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.user,color: PsColors.black,),
              label: 'Profile',
            ),
          ]),
      // drawer: new MenuScreens(activeScreenName: screenName),
      body: new Center(
        child: getWidget(),
      ),
      // drawer: Menu(),
    );
  }

  Widget getWidget() {
    switch (_selectedTabIndex) {
      case 0:
      //return Text('data');
        return InfractionIndexController();
        break;
      case 1:
        return NotificationController();
        break;
      case 2:
        return InformationController();
        break;
      case 3:
        return ProfileController();
        break;
    }
  }
}