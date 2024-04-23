import 'package:campus_companion/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Attendance.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final attendanceData = Provider.of<AttendanceDataProvider>(context).data;

    return Scaffold(
      appBar:  AppBar(
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
        padding: const EdgeInsets.all(8.0), // Add overall padding
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // Add bounce physics
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  final subjectData = attendanceData[index];
                  final int totalPresent = int.parse(subjectData.totalPresent);
                  final int totalLecture = int.parse(subjectData.totalLecture);
                  final int loa = int.parse(subjectData.leaveOfAbsence);

                  String attendanceWithoutPercentage =
                      subjectData.attendance.replaceAll('%', '');
                  double subjectAttendance =
                      double.parse(attendanceWithoutPercentage);

                  // Determine the color based on attendance percentage
                  Color indicatorColor =
                      subjectAttendance < 70 ? Colors.red.withOpacity(0.6) : ColorsConstants.primaryBlue.withOpacity(0.5);

                  return Container(
                    decoration: BoxDecoration(
                      color:
                          ColorsConstants.primaryBlue.withOpacity(0.2), // Light blue background color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(subjectData.subjectName),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Classes Attended: $totalPresent / $totalLecture'),
                          Text('LOA: $loa'),
                        ],
                      ),
                      trailing: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 6,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: subjectAttendance / 100,
                              strokeWidth: 5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  indicatorColor),
                              backgroundColor: Colors.transparent,
                            ),
                            Text(
                              '${subjectData.attendance}',
                              style: const TextStyle(
                                fontSize: 8.5,
                                fontWeight: FontWeight.bold,
                                color: ColorsConstants.primaryBlue
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
