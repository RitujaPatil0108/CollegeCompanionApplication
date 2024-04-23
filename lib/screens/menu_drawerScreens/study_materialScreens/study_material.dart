import 'package:flutter/material.dart';
import 'package:campus_companion/screens/menu_drawerScreens/study_materialScreens/programmescreen.dart';
import '../../../constants/colors_constants.dart';

class StudyMaterialScreen extends StatelessWidget {
  const StudyMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        physics: const BouncingScrollPhysics(), // Make the scrolling bouncy
        child: Column(
          children: [
            _buildYearTile(context, '2024'),
            _buildYearTile(context, '2023'),
            _buildYearTile(context, '2022'),
            _buildYearTile(context, '2021'),
            _buildYearTile(context, '2020'),
            _buildYearTile(context, '2019'),
            _buildYearTile(context, '2018'),
             _buildYearTile(context, '2017'),
              _buildYearTile(context, '2016'),
               _buildYearTile(context, '2015'),
            // Add more list tiles for other years
          ],
        ),
      ),
    );
  }

  Widget _buildYearTile(BuildContext context, String year) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          year,
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
            MaterialPageRoute(builder: (context) => ProgrammeScreen(year: year)),
          );
        },
      ),
    );
  }
}
