import 'package:campus_companion/constants/colors_constants.dart';
import 'package:campus_companion/screens/HomeScreens/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/menu_drawer.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    final now = DateTime.now();
    final formattedDate = DateFormat('MMMM d, y HH:mm').format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/ncu_logo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: ColorsConstants.primaryBlue,
        ),
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's timeline",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              formattedDate,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10.0),
            const DashboardScreen(),
            // const Text(
            //   "Frequent Actions",
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const FrequentActions(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Attendance",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const AttendanceScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    ); 
  }
}
