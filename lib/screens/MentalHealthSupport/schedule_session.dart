import 'package:campus_companion/screens/MentalHealthSupport/My_appointments.dart';
import 'package:campus_companion/screens/MentalHealthSupport/sessionbook_questions.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class ScheduleSession extends StatelessWidget {
  const ScheduleSession({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            height: 170,
            decoration: BoxDecoration(
              color: ColorsConstants.primaryBlue,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Book An Appointment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: () {
                          // Handle onTap event for "My Appointments" here
                          // Navigate to the page for viewing appointments
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyAppointments()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white), // Add white border
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'My Appointments',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/book_appointment.png',
                  height: 170, // Adjust height as needed
                  width: 100, // Adjust width as needed
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/sumit.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Sumit Kumar',
                              style: TextStyle(
                                color: ColorsConstants.primaryBlue,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Psychologist | MBBS, MD',
                    style: TextStyle(
                      color: ColorsConstants.primaryBlue,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Dr. Sumit Kumar is a highly experienced psychologist with a specialization in MBBS and MD. He has been helping individuals with mental health issues for over a decade. Students can visit him in room number 105 in the university campus from 9:00 AM to 4:00 PM.',
                    style: TextStyle(
                      color: ColorsConstants.primaryBlue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const SessionBookingQuestions())));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: ColorsConstants.primaryBlue,
              ),
              child: const Text('Book Online Session'),
            ),
          )
        ],
      ),
    );
  }
}
