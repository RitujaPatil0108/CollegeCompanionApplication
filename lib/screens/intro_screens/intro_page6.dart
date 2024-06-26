import 'package:campus_companion/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class IntroPage6 extends StatelessWidget {
  const IntroPage6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container with content
        Container(
          color: ColorsConstants.backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let's get you started!",
                  style: TextStyle(
                    color: ColorsConstants.primaryBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/intro_page6.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to a smarter, more efficient campus life",
                  style: TextStyle(
                    color: ColorsConstants.primaryBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
            height: MediaQuery.of(context).size.height / 7, // Adjust the height as needed
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
    );
  }
}
