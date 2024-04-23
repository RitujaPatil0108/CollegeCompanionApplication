import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _WorkshopCard(
              workshopTitle: 'Self-Care Workshop',
              date: 'April 20, 2024',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkshopDetailsPage(
                      workshopTitle: 'Self-Care Workshop',
                      date: 'April 20, 2024',
                      time: '10:00 AM - 12:00 PM',
                      venue: 'Seminar Hall',
                      description:
                          'This workshop will cover various aspects of self-care, including mindfulness, stress management, and building healthy habits.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _WorkshopCard(
              workshopTitle: 'Stress Management Seminar',
              date: 'May 5, 2024',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkshopDetailsPage(
                      workshopTitle: 'Stress Management Seminar',
                      date: 'May 5, 2024',
                      time: '2:00 PM - 4:00 PM',
                      venue: 'Auditorium',
                      description:
                          'This seminar will focus on practical strategies for managing stress in daily life, including relaxation techniques, time management, and seeking support.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Add more workshop cards as needed
          ],
        ),
      ),
    );
  }
}

class _WorkshopCard extends StatelessWidget {
  final String workshopTitle;
  final String date;
  final VoidCallback onPressed;

  const _WorkshopCard({
    Key? key,
    required this.workshopTitle,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workshopTitle,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.primaryBlue,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Date: $date',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkshopDetailsPage extends StatelessWidget {
  final String workshopTitle;
  final String date;
  final String time;
  final String venue;
  final String description;

  const WorkshopDetailsPage({
    Key? key,
    required this.workshopTitle,
    required this.date,
    required this.time,
    required this.venue,
    required this.description,
  }) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorsConstants.primaryBlue,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    workshopTitle,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: ColorsConstants.primaryBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Date: $date',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Time: $time',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Venue: $venue',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
