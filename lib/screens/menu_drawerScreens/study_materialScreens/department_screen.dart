import 'package:flutter/material.dart';
import 'package:campus_companion/screens/menu_drawerScreens/study_materialScreens/subject_screen.dart';
import '../../../constants/colors_constants.dart';

class DepartmentScreen extends StatelessWidget {
  final String year;
  final String programme;

  const DepartmentScreen({Key? key, required this.year, required this.programme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<String> departments = ['CSE', 'Mechanical', 'Electrical', 'Civil', 'IT']; // Add more departments

    return Scaffold(
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsConstants.primaryBlue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // Make the scrolling bouncable
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              for (var department in departments)
                _buildDepartmentTile(context, department),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentTile(BuildContext context, String department) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          department,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsConstants.primaryBlue,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: ColorsConstants.primaryBlue,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubjectScreen(year: year, programme: programme, department: department)),
          );
        },
      ),
    );
  }
}
