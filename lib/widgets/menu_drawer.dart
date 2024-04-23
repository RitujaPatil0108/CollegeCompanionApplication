import 'package:campus_companion/screens/AuthScreens/login_screen.dart';
import 'package:campus_companion/screens/menu_drawerScreens/RulesAndProceduresScreens/rulesprocedures.dart';
import 'package:campus_companion/screens/menu_drawerScreens/notices_list.dart';
import 'package:campus_companion/screens/menu_drawerScreens/personal_info.dart';
import 'package:campus_companion/screens/menu_drawerScreens/study_materialScreens/study_material.dart';
import 'package:flutter/material.dart';
import '../constants/colors_constants.dart';
import '../screens/FacultyScreens/all_faculty_list.dart';
import '../screens/HomeScreens/attendance_details.dart';
import '../screens/menu_drawerScreens/opportunites.dart';
import '../screens/menu_drawerScreens/peer_tutoringScreens/class_list.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorsConstants.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: ColorsConstants.backgroundColor,
              child: const Center(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      radius: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rituja Patil',
                      style: TextStyle(
                        color: ColorsConstants.primaryBlue,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Personal Info',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Personal Info" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_today,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Attendance',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Attendance" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AttendanceList()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Faculty',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Study Material" tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllFacultyListScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.library_books,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Study Material',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Study Material" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudyMaterialScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Notices',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Personal Info" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoticesList()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.star,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Opportunities',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OpportunitiesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Peer Tutoring',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Peer Tutoring" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScheduledClassScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.article,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Procedures',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Procedures" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RulesAndProcedures()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color.fromARGB(
                    255, 105, 105, 105), // Changed color to dark grey
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 105, 105, 105), // Changed color to dark grey
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Settings" tap
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Handle "Logout" tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
