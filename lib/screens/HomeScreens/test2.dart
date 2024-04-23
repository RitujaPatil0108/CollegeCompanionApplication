import 'package:campus_companion/screens/HomeScreens/gbutton.dart';
import 'package:campus_companion/screens/HomeScreens/gnav.dart';
import 'package:campus_companion/screens/HomeScreens/home_screen.dart';
import 'package:campus_companion/screens/HomeScreens/line_icons.dart';
import 'package:campus_companion/screens/bottombarScreens/timetableScreen.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _tabs = [
    // const TabHomePage(),
    // MyDashboard(),
    // const MyCommunity(),
    // const MyConnection(),
    // // const TabNotificationsPage(),
    // // const MapSample(),
    // const TabProfilePage(),
    // const MyMessaging(),
    // NotificationsScreen(),
    const HomeScreen(),
        const TimetableScreen()
,
    const TimetableScreen()
,
    const TimetableScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _tabs[_selectedIndex],
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: const Duration(milliseconds: 800),
              gap: 8.5,
              onTabChange: _navigateBottomBar,
              tabs: [
                GButton(
                  iconActiveColor: ColorsConstants.primaryBlue,
                  iconColor: Colors.black,
                  textColor:ColorsConstants.primaryBlue,
                  backgroundGradient: LinearGradient(
                    colors: [
                      ColorsConstants.primaryBlue.withOpacity(.45),
                      ColorsConstants.primaryBlue.withOpacity(.45),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  iconSize: 24,
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  iconActiveColor: ColorsConstants.primaryBlue,
                  iconColor: Colors.black,
                  textColor:ColorsConstants.primaryBlue,
                  backgroundGradient: LinearGradient(
                    colors: [
                      ColorsConstants.primaryBlue.withOpacity(.45),
                      ColorsConstants.primaryBlue.withOpacity(.2),

                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  iconSize: 24,
                  icon: LineIcons.users,
                  text: 'Community',
                ),
                GButton(
                  iconActiveColor: ColorsConstants.primaryBlue,
                  iconColor: Colors.black,
                  textColor: ColorsConstants.primaryBlue,
                  backgroundGradient: LinearGradient(
                    colors: [
                      ColorsConstants.primaryBlue.withOpacity(.45),
                      ColorsConstants.primaryBlue.withOpacity(.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  iconSize: 24,
                  icon: LineIcons.connectDevelop,
                  text: 'Connection',
                ),
                GButton(
                  iconActiveColor: ColorsConstants.primaryBlue,
                  iconColor: Colors.black,
                  textColor: ColorsConstants.primaryBlue,
                  backgroundGradient: LinearGradient(
                    colors: [
                      ColorsConstants.primaryBlue.withOpacity(.45),
                      ColorsConstants.primaryBlue.withOpacity(.2)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  iconSize: 24,
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}

