import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constants/colors_constants.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.4),
                  ColorsConstants.primaryBlue.withOpacity(0.4),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: _fetchStudentProfile(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final userData = snapshot.data!;
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 65,
                        backgroundImage:
                            NetworkImage(userData['profile_picture']),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        userData['student_name'],
                        style: const TextStyle(
                          color: ColorsConstants.primaryBlue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildInfoContainer(userData),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(Map<String, dynamic> userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _buildCircularContainer('Roll Number', userData['student_roll']),
          _buildCircularContainer('Date of Birth', userData['date_of_birth']),
          _buildCircularContainer('Batch', userData['batch']),
          _buildCircularContainer('Programme', userData['programme']),
          _buildCircularContainer('Department', userData['department']),
          _buildCircularContainer('Specialization', userData['specialization']),
          _buildCircularContainer('Section', userData['section']),
          _buildCircularContainer('Phone', userData['phone']),
        ],
      ),
    );
  }

  Widget _buildCircularContainer(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
