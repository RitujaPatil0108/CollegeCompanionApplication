import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';
import '../../models/Faculty.dart';
import 'faculty_profile.dart';

final List<Faculty> facultyList = [
  Faculty(
    name: 'Mr. Sumit Kumar',
    imageUrl: 'https://nculms.ncuindia.edu/courses/791/files/112521/preview',
    email: 'sumit@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Yogita Gigras',
    imageUrl: 'https://nculms.ncuindia.edu/courses/3034/files/555953/preview',
    email: 'yogita@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Mehak Khurana',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/409366/preview',
    email: 'mehak@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Pankaj Raheja',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/410448/preview',
    email: 'pankaj@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Mr. Sumit Kumar',
    imageUrl: 'https://nculms.ncuindia.edu/courses/791/files/112521/preview',
    email: 'sumit@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Yogita Gigras',
    imageUrl: 'https://nculms.ncuindia.edu/courses/3034/files/555953/preview',
    email: 'yogita@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Mehak Khurana',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/409366/preview',
    email: 'mehak@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Pankaj Raheja',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/410448/preview',
    email: 'pankaj@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Mr. Sumit Kumar',
    imageUrl: 'https://nculms.ncuindia.edu/courses/791/files/112521/preview',
    email: 'sumit@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Yogita Gigras',
    imageUrl: 'https://nculms.ncuindia.edu/courses/3034/files/555953/preview',
    email: 'yogita@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Mehak Khurana',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/409366/preview',
    email: 'mehak@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Pankaj Raheja',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/410448/preview',
    email: 'pankaj@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Mr. Sumit Kumar',
    imageUrl: 'https://nculms.ncuindia.edu/courses/791/files/112521/preview',
    email: 'sumit@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Yogita Gigras',
    imageUrl: 'https://nculms.ncuindia.edu/courses/3034/files/555953/preview',
    email: 'yogita@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Mehak Khurana',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/409366/preview',
    email: 'mehak@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
  Faculty(
    name: 'Dr. Pankaj Raheja',
    imageUrl: 'https://nculms.ncuindia.edu/courses/2202/files/410448/preview',
    email: 'pankaj@ncuindia.edu',
    phoneNumber: '9717433825',
    roomNumber: '130',
    visitTime: '03:00 PM - 05:00 PM',
  ),
];

class AllFacultyListScreen extends StatelessWidget {
  const AllFacultyListScreen({super.key});

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Faculty',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: facultyList.map((faculty) {
                  return FacultyCard(
                    faculty: faculty,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FacultyProfileScreen(faculty: faculty),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FacultyCard extends StatelessWidget {
  final Faculty faculty;
  final VoidCallback onTap;

  const FacultyCard({
    Key? key,
    required this.faculty,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
      child: SizedBox(
        height: 100.0, // Adjust the height as needed
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 22.0, horizontal: 12),
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage:
                NetworkImage(faculty.imageUrl), // Use the provided URL
          ),
          title: Text(
            faculty.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConstants.primaryBlue,
            ),
            child: const Text('Profile', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
