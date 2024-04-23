import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:campus_companion/constants/colors_constants.dart';
import 'package:campus_companion/screens/HomeScreens/home_screen.dart';
import 'package:campus_companion/screens/menu_drawerScreens/peer_tutoringScreens/schedule_class.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';

class ScheduledClassScreen extends StatefulWidget {
  const ScheduledClassScreen({Key? key}) : super(key: key);

  @override
  State<ScheduledClassScreen> createState() => _ScheduledClassScreenState();
}

class _ScheduledClassScreenState extends State<ScheduledClassScreen> {
  List<Map<String, dynamic>> scheduledClasses = [];

  @override
  void initState() {
    super.initState();
    _fetchScheduledClasses();
  }

  Future<void> _fetchScheduledClasses() async {
    final rollNumber = Provider.of<UserProvider>(context, listen: false).rollNumber;
    final url = Uri.parse('https://samfrost.pythonanywhere.com/api/v1/peer_tutoring_list');
    final body = json.encode({'roll_number': rollNumber});

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          scheduledClasses = data.map((item) => Map<String, dynamic>.from(item)).toList();
        });
      } else {
        throw Exception('Failed to load scheduled classes: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load scheduled classes: $error');
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = -2; i <= 2; i++)
                        Container(
                          decoration: BoxDecoration(
                            color: i == 0 ? ColorsConstants.primaryBlue : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            _getFormattedDate(DateTime.now().add(Duration(days: i))),
                            style: TextStyle(
                              color: i == 0 ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: scheduledClasses.length,
                  itemBuilder: (context, index) {
                    final scheduledClass = scheduledClasses[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            scheduledClass['subject'],
                            style: const TextStyle(fontWeight: FontWeight.bold, color: ColorsConstants.primaryBlue),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    scheduledClass['date'],
                                    style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    scheduledClass['time'],
                                    style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                scheduledClass['student_mentor'],
                                style: const TextStyle(fontStyle: FontStyle.italic),
                              ),
                              Text(
                                scheduledClass['description'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ScheduleClassScreen(),
              );
            },
          );
        },
        backgroundColor: ColorsConstants.primaryBlue,
        child: const Icon(Icons.add),
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'JAN';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'APR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AUG';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DEC';
      default:
        return '';
    }
  }
}
