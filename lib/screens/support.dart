import 'package:campus_companion/screens/HomeScreens/home_screen.dart';
import 'package:campus_companion/screens/MentalHealthSupport/mh_dashboard.dart';
import 'package:flutter/material.dart';
import '../constants/colors_constants.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorsConstants.primaryBlue.withOpacity(0.5), width: 2),
                color: ColorsConstants.primaryBlue.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle Mental Health card tap
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const MentalHealthDashboard())));

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 4,
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: ColorsConstants.primaryBlue,
                                size: 32,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Mental Health',
                                style: TextStyle(
                                  color: ColorsConstants.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle SOS card tap
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 4,
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital,
                                color: ColorsConstants.primaryBlue,
                                size: 32,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'SOS',
                                style: TextStyle(
                                  color: ColorsConstants.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
