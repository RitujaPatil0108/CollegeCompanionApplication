import 'package:campus_companion/screens/bottombarScreens/Doclock_dashboard.dart';
import 'package:campus_companion/screens/bottombarScreens/id_card.dart';
import 'package:campus_companion/screens/support.dart';
import 'package:flutter/material.dart';
import 'package:campus_companion/screens/bottombarScreens/timetableScreen.dart';

import '../constants/colors_constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 2; // Initially set to Home index

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Use fixed mode
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner),
          label: 'DocLock',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'ID Card',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Time Table',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: ColorsConstants.primaryBlue,
      unselectedItemColor: Colors.grey[600],
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        switch (index) {
          case 0:
            // Handle Dockloc item click
            // Replace with your desired action
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DoclockDashboard()));
            break;
          case 1:
            // Handle ID Card item click
            // Replace with your desired action
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const IDCard()));
            break;
          case 2:
            // Handle Home item click
            // Replace with your desired action
            break;
          case 3:
            // Handle Support item click
            // Replace with your desired action
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SupportScreen()));
            break;
          case 4:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TimetableScreen()));
            break;
        }
      },
    );
  }
}
