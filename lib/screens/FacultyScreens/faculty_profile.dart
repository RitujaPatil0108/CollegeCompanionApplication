import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';
import '../../models/Faculty.dart';

class FacultyProfileScreen extends StatelessWidget {
  final Faculty faculty;

  const FacultyProfileScreen({Key? key, required this.faculty}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(faculty.imageUrl),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Text(
                  faculty.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.mail, color: ColorsConstants.primaryBlue),
                          const SizedBox(width: 8.0),
                          Text(
                            'Email: ${faculty.email}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: ColorsConstants.primaryBlue),
                          const SizedBox(width: 8.0),
                          Text(
                            'Phone: ${faculty.phoneNumber}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Visit',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.map, color: ColorsConstants.primaryBlue),
                          const SizedBox(width: 8.0),
                          Text(
                            'Room Number: ${faculty.roomNumber}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.access_time, color: ColorsConstants.primaryBlue),
                          const SizedBox(width: 8.0),
                          Text(
                            'Visit Time: ${faculty.visitTime}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 8.0),
              Center(
                child: Image.asset(
                  'assets/images/timetable.jpg',
                  width: 800.0,
                  height: 200.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
