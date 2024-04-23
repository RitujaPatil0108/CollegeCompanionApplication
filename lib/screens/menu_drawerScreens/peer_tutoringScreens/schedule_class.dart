import 'dart:convert';

import 'package:campus_companion/screens/menu_drawerScreens/peer_tutoringScreens/class_scheduled_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:campus_companion/constants/colors_constants.dart';

class ScheduleClassScreen extends StatefulWidget {
  const ScheduleClassScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleClassScreen> createState() => _ScheduleClassScreenState();
}

class _ScheduleClassScreenState extends State<ScheduleClassScreen> {
  late DateTime selectedDate = DateTime.now(); 
  late TimeOfDay selectedTime = TimeOfDay.now(); 
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController teacherInchargeController = TextEditingController(); // Added controller for Teacher Incharge field

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _scheduleClass() {
    const studentMentor = "John Doe";
    final date = selectedDate.toString();
    final time = selectedTime.format(context);
    final subject = subjectController.text;
    final description = descriptionController.text;
    final teacherIncharge = teacherInchargeController.text; // Retrieve Teacher Incharge data

    final jsonData = {
      'student_mentor': studentMentor,
      'date': date,
      'time': time,
      'subject': subject,
      'description': description,
      'teacher_incharge': teacherIncharge, // Include Teacher Incharge data in JSON object
    };

    print(json.encode(jsonData));

    subjectController.clear();
    descriptionController.clear();
    teacherInchargeController.clear(); // Clear Teacher Incharge field controller
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessfullyScheduledClass()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Schedule a class for peer tutoring',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsConstants.primaryBlue,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      labelStyle: TextStyle(color: ColorsConstants.primaryBlue),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: ColorsConstants.primaryBlue,
                      ),
                    ),
                    controller: TextEditingController(
                      text: DateFormat('yyyy/MM/dd').format(selectedDate),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    readOnly: true,
                    onTap: () => _selectTime(context),
                    decoration: const InputDecoration(
                      labelText: 'Select Time',
                      labelStyle: TextStyle(color: ColorsConstants.primaryBlue),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                      suffixIcon: Icon(
                        Icons.access_time,
                        color: ColorsConstants.primaryBlue,
                      ),
                    ),
                    controller: TextEditingController(
                      text: '${selectedTime.hour}:${selectedTime.minute}',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                      hintText: 'Enter subject',
                      labelText: 'Subject',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: teacherInchargeController,
                    decoration: const InputDecoration(
                      hintText: 'Enter teacher incharge',
                      labelText: 'Teacher Incharge',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                    ),
                  ), // Added Teacher Incharge field
                  const SizedBox(height: 16),
                  TextField(
                    controller: descriptionController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Enter description',
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _scheduleClass,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: ColorsConstants.primaryBlue,
                    ),
                    child: const Text('Schedule Class'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
