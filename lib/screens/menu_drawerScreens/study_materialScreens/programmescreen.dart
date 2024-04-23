import 'package:flutter/material.dart';
import 'package:campus_companion/screens/menu_drawerScreens/study_materialScreens/department_screen.dart';
import '../../../constants/colors_constants.dart';

class ProgrammeScreen extends StatelessWidget {
  final String year;

  const ProgrammeScreen({Key? key, required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
              _buildProgrammeTile(context, 'SOET'),
              _buildProgrammeTile(context, 'SOM'),
              _buildProgrammeTile(context, 'SOL'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgrammeTile(BuildContext context, String programme) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          programme,
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
            MaterialPageRoute(builder: (context) => DepartmentScreen(year: year, programme: programme)),
          );
        },
      ),
    );
  }
}
