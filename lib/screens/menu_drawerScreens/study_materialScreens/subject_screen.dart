import 'package:flutter/material.dart';
import '../../../constants/colors_constants.dart';

class SubjectScreen extends StatelessWidget {
  final String year;
  final String programme;

  const SubjectScreen(
      {Key? key,
      required this.year,
      required this.programme,
      required String department})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, dynamic>> subjects = [
      {
        'code': 'CS101',
        'name': 'Introduction to Computer Science',
        'type': 'major',
        'file_name': 'cs101.pdf'
      },
      {
        'code': 'CS102',
        'name': 'Data Structures',
        'type': 'major',
        'file_name': 'cs102.pdf'
      },
      {
        'code': 'MA101',
        'name': 'Calculus',
        'type': 'major',
        'file_name': 'ma101.pdf'
      },
    ];

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
            children: subjects
                .map((subject) => _buildSubjectTile(context, subject))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectTile(BuildContext context, Map<String, dynamic> subject) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          '${subject['code']} - ${subject['name']}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsConstants.primaryBlue,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            // Action to view or download the PDF file
          },
          child: ElevatedButton(
            onPressed: () {
              // Action to view or download the PDF file
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConstants
                  .primaryBlue, 
            ),
            child: const Text(
              'View',
              style: TextStyle(
                color: Colors.white, // Set button text color to white
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
