import 'package:campus_companion/screens/MentalHealthSupport/My_appointments.dart';
import 'package:campus_companion/screens/MentalHealthSupport/mh_dashboard.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors_constants.dart';

class SessionBooked extends StatelessWidget {
  const SessionBooked({Key? key}) : super(key: key);

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MentalHealthDashboard()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: ColorsConstants.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.monitor_heart_outlined, 
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Session Booked Successfully', 
              style: TextStyle(
                color: ColorsConstants.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
                        onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyAppointments()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorsConstants.primaryBlue), 
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'My Appointments',
                            style: TextStyle(
                              color: ColorsConstants.primaryBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
