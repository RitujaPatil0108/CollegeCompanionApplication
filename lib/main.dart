import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/SplashScreens/splashscreen.dart';
import 'models/Attendance.dart';
import 'models/ClassDetails.dart';
import 'providers/user_provider.dart';
import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AttendanceDataProvider>(
        create: (context) => AttendanceDataProvider(),
      ),
      ChangeNotifierProvider<ClassDataProvider>(
        create: (context) => ClassDataProvider(),
      ),
      ChangeNotifierProvider<UserProvider>(
        create: (context) => UserProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: Routes.routes,
    ),
  );
}

}
