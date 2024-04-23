// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:campus_companion/models/Attendance.dart';
import 'package:campus_companion/models/ClassDetails.dart';
import 'package:campus_companion/widgets/text_form_field.dart';
import 'package:campus_companion/widgets/custom_button.dart';
import 'package:campus_companion/providers/user_provider.dart';
import 'package:campus_companion/constants/colors_constants.dart';
import '../../constants/Routes_constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> sendPostRequest(BuildContext context) async {
    const String url1 = 'https://samfrost.pythonanywhere.com/api/v1/attendance';
    const String url2 = 'https://samfrost.pythonanywhere.com/api/v1/timetable';

    final Map<String, dynamic> data = {
      'username': _emailController.text,
      'password': _passwordController.text,
    };

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    try {
      final response1 = await http.post(
        Uri.parse(url1),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response1.statusCode == 200) {
        final List<AttendanceData> parsedData = parseResponseData(response1.body);
        Provider.of<AttendanceDataProvider>(context, listen: false).setData(parsedData);

        print('Response from URL 1: ${response1.body}');

        final response2 = await http.post(
          Uri.parse(url2),
          headers: headers,
          body: jsonEncode(data),
        );

        if (response2.statusCode == 200) {
          final List<ClassDetails> classData = parseClassResponseData(response2.body);
          Provider.of<ClassDataProvider>(context, listen: false).setData(classData);

          print('Response from URL 2: ${response2.body}');

          // Store the roll number in the user provider
          Provider.of<UserProvider>(context, listen: false).setRollNumber(_emailController.text);

          Navigator.pushNamed(context, RoutesConstants.home);
        } else {
          print('Request from URL 2 failed with status: ${response2.statusCode}');
        }
      } else {
        print('Request from URL 1 failed with status: ${response1.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<AttendanceData> parseResponseData(String responseBody) {
    final List<dynamic> jsonList = json.decode(responseBody);
    List<AttendanceData> attendanceDataList = [];

    for (dynamic item in jsonList) {
      if (item is Map<String, dynamic>) {
        final String sNo = item['S.No.'] ?? '';
        final String subjectName = item['Subject Name'] ?? '';
        final String attendance = item['Attendance (%)'] ?? '';
        final String totalLecture = item['Total Lecture'] ?? '';
        final String totalPresent = item['Total Present'] ?? '';
        final String totalAbsent = item['Total Absent'] ?? '';
        final String leaveOfAbsence = item['Leave of Absence'] ?? '';

        final attendanceData = AttendanceData(
          sNo: sNo,
          subjectName: subjectName,
          attendance: attendance,
          totalLecture: totalLecture,
          totalPresent: totalPresent,
          totalAbsent: totalAbsent,
          leaveOfAbsence: leaveOfAbsence,
        );
        attendanceDataList.add(attendanceData);
      }
    }
    return attendanceDataList;
  }

  List<ClassDetails> parseClassResponseData(String responseBody) {
    final List<dynamic> jsonList = json.decode(responseBody);
    List<ClassDetails> classDetailsList = [];

    for (dynamic item in jsonList) {
      if (item is Map<String, dynamic>) {
        final String day = item['Day'] ?? '';
        final String date = item['Date'] ?? '';
        final List<LectureDetails> lectureDetails = (item['Lecture Details'] as List<dynamic>)
            .map((lecture) {
              return LectureDetails(
                sNo: lecture['S.No'] ?? 0,
                faculty: lecture['Faculty'] ?? '',
                courseCode: lecture['Course Code'] ?? '',
                roomNumber: lecture['Room No.'] ?? '',
                time: lecture['Time'] ?? '',
              );
            })
            .toList();

        final classDetails = ClassDetails(
          day: day,
          date: date,
          lectureDetails: lectureDetails,
        );
        classDetailsList.add(classDetails);
      }
    }

    return classDetailsList;
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 200),  // Add space above "Welcome" text
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(
                          "Welcome ",
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorsConstants.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "👋",
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorsConstants.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        const Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: "Email, username",
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          labelText: "Password",
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              print("Forgot Password? pressed");
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: ColorsConstants.text1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: "Login",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              sendPostRequest(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Semicircle at the top with primary blue color and 0.2 opacity
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 5, // Adjust the height as needed
            decoration: BoxDecoration(
              color: ColorsConstants.primaryBlue.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(250), // Adjust the radius to create a semicircle
                bottomRight: Radius.circular(250),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
