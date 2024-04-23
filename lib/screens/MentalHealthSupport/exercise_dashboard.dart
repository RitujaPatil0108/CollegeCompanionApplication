import 'package:campus_companion/screens/MentalHealthSupport/monday.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/colors_constants.dart'; // For date formatting

class ExerciseDashboard extends StatelessWidget {
  const ExerciseDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get current date and day of the week
    final now = DateTime.now();
    final dateFormat = DateFormat('MMMM d, yyyy');
    final dayFormat = DateFormat('EEEE');
    final formattedDate = dateFormat.format(now);
    final formattedDay = dayFormat.format(now);

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weekly Schedule',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: ColorsConstants.primaryBlue,
                    ),
                  ),
                  Text(
                    '$formattedDate, $formattedDay',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // List of day cards
            _DayCard(day: 'MON', color: Colors.blue.withOpacity(0.2), image: 'monday.png', onTap: () => _handleDayTap(context, 'MON')),
            _DayCard(day: 'TUE', color: Colors.green.withOpacity(0.3), image: 'tuesday.png', onTap: () => _handleDayTap(context, 'TUE')),
            _DayCard(day: 'WED', color: Colors.orange.withOpacity(0.3), image: 'wednesday.png', onTap: () => _handleDayTap(context, 'WED')),
            _DayCard(day: 'THURS', color: Colors.red.withOpacity(0.3), image: 'thursday.png', onTap: () => _handleDayTap(context, 'THU')),
            _DayCard(day: 'FRI', color: Colors.purple.withOpacity(0.3), image: 'friday.png', onTap: () => _handleDayTap(context, 'FRI')),
            _DayCard(day: 'SAT', color: Colors.teal.withOpacity(0.3), image: 'saturday.png', onTap: () => _handleDayTap(context, 'SAT')),
            _DayCard(day: 'SUN', color: Colors.yellow.withOpacity(0.3), image: 'sunday.png', onTap: () => _handleDayTap(context, 'SUN')),
          ],
        ),
      ),
    );
  }

  void _handleDayTap(BuildContext context, String day) {
    switch (day) {
      case 'MON':
        // Handle Monday
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MondayPage()));
        break;
      case 'TUE':
        // Handle Tuesday
        break;
      case 'WED':
        // Handle Wednesday
        break;
      case 'THURS':
        // Handle Thursday
        break;
      case 'FRI':
        // Handle Friday
        break;
      case 'SAT':
        // Handle Saturday
        break;
      case 'SUN':
        // Handle Sunday
        break;
      default:
        // Handle default case
        break;
    }
  }
}


class _DayCard extends StatelessWidget {
  final String day;
  final Color color;
  final String image;
  final VoidCallback onTap;

  const _DayCard({Key? key, required this.day, required this.color, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Text(
                        day,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/$image',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
