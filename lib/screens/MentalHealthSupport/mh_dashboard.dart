import 'package:campus_companion/screens/MentalHealthSupport/mh_actions.dart';
import 'package:campus_companion/screens/support.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class MentalHealthDashboard extends StatelessWidget {
  const MentalHealthDashboard({Key? key}) : super(key: key);

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SupportScreen()));
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorsConstants.primaryBlue.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Quote Of The Day',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '"Believe you can and you\'re halfway there."',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Added some space between the two containers
              ],
            ),
          ),
          Positioned(
            top: 115, 
            left: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 78, // Adjusted height
              decoration: BoxDecoration(
                color: Colors.grey[300], 
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'How are you feeling today?', // Question text
                    style: TextStyle(
                      color: ColorsConstants.primaryBlue, // Blue color
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmojiButton(icon: Icons.sentiment_very_dissatisfied), // Very Sad
                      EmojiButton(icon: Icons.sentiment_dissatisfied), // Sad
                      EmojiButton(icon: Icons.sentiment_neutral), // Neutral
                      EmojiButton(icon: Icons.sentiment_satisfied), // Happy
                      EmojiButton(icon: Icons.sentiment_very_satisfied), // Very Happy
                    ],
                  ),
                ],
              ),
            ),
          ),
           const Positioned(
            top: 220, 
            left: 2,
            right: 2,
            child: FrequentActions(),
          ),
        ],
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final IconData icon;

  const EmojiButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Handle emoji button tap
        },
        child: CircleAvatar(
          radius: 14,
          backgroundColor: ColorsConstants.primaryBlue,
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
