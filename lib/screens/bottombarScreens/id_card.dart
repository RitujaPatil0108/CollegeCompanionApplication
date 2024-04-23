import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constants/colors_constants.dart';
import '../../providers/user_provider.dart';

class IDCard extends StatelessWidget {
  const IDCard({Key? key});

  Future<Map<String, dynamic>> _fetchStudentProfile(
      BuildContext context) async {
    final rollNumber =
        Provider.of<UserProvider>(context, listen: false).rollNumber;
    final url =
        Uri.parse('https://samfrost.pythonanywhere.com/api/v1/student_profile');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'roll_number': rollNumber});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return json.decode(response.body);
    } else {
      print("Roll Number: $rollNumber");
      throw Exception('Failed to load student profile');
    }
  }

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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchStudentProfile(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userData = snapshot.data!;
            return Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'The NorthCap University',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userData['student_name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:ColorsConstants.primaryBlue
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Roll Number: ${userData['student_roll']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Date of Birth: ${userData['date_of_birth']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Batch: ${userData['batch']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.network(
                                  userData['profile_picture'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Programme: ${userData['programme']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Department: ${userData['department']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
