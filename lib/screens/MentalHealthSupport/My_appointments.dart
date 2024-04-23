import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import '../../constants/colors_constants.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({Key? key}) : super(key: key);

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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppointmentCard(
                doctorName: 'Dr. John Doe',
                specialization: 'Psychiatrist',
                date: 'April 15, 2024',
                time: '10:00 AM',
                meetLink: 'https://meet.google.com/bpm-vcge-exm',
              ),
              SizedBox(height: 16),
              AppointmentCard(
                doctorName: 'Dr. Jane Smith',
                specialization: 'Therapist',
                date: 'April 20, 2024',
                time: '2:30 PM',
                meetLink: 'https://meet.google.com/bpm-vcge-exm',
              ),
              // Add more appointment cards as needed
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String meetLink;
  final String date;
  final String time;

  const AppointmentCard({
    Key? key,
    required this.doctorName,
    required this.specialization,
    required this.meetLink,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$doctorName',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              specialization,
              style: const TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        if (await url_launcher.canLaunch(meetLink)) {
                          await url_launcher.launch(
                            meetLink,
                            forceSafariVC: false,
                            forceWebView: false,
                            universalLinksOnly: true,
                          );
                        } else {
                          throw 'Could not launch $meetLink';
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not open link'),
                          ),
                        );
                        print('Error launching link: $e');
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.link,
                          color: ColorsConstants
                              .primaryBlue, // Changed to primary blue
                        ),
                        const SizedBox(width: 4),
                        Text(
                          meetLink,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: ColorsConstants.primaryBlue,
              thickness: 1,
              height: 30,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: ColorsConstants.primaryBlue, // Changed to primary blue
                ),
                const SizedBox(width: 2),
                Text(
                  'Date: $date',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 20, 
                  width: 1.5, 
                  color: ColorsConstants.primaryBlue, 
                ),
                const Spacer(),
                const Icon(
                  Icons.access_time,
                  color: ColorsConstants.primaryBlue, // Changed to primary blue
                ),
                const SizedBox(width: 2),
                Text(
                  'Time: $time',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
