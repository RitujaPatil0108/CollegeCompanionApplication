// attendance_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors_constants.dart';
import '../../models/Attendance.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceData = Provider.of<AttendanceDataProvider>(context).data;
    Size deviceSize = MediaQuery.of(context).size;

    // Separate lists to store attendance percentages and subject codes
    List<double> attendancePercentages =
        attendanceData.map((data) => double.tryParse(data.attendance.replaceAll('%', '')) ?? 0.0).toList();
    List<String> subjectCodes = attendanceData.map((data) => data.subjectName).toList();

    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Adjust spacing as needed
              Center(
                child: Expanded(
                  child: SizedBox(
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        attendanceData.length,
                        (index) {
                          // Split the subjectName using "-" and take the first part
                          String subjectCode = subjectCodes[index].split("-")[0];
                          return Expanded(
                            child: AttendanceBar(
                              deviceSize: deviceSize,
                              attendance: attendancePercentages[index],
                              subjectCode: subjectCode,  // Use the modified subjectCode
                              onTap: () {
                                print("Clicked on bar with attendance: ${attendancePercentages[index]}%");
                              },
                            ),
                          );
                        },
                      ).toList(),
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




class AttendanceBar extends StatefulWidget {
  final double attendance;
  final String subjectCode;
  final Size deviceSize;
  final VoidCallback onTap;

  const AttendanceBar({
    Key? key,
    required this.deviceSize,
    required this.attendance,
    required this.subjectCode,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AttendanceBar> createState() => _AttendanceBarState();

  static String getFormattedAttendance(double attendance) {
    return '${attendance.toStringAsFixed(1)}%';
  }
}

class _AttendanceBarState extends State<AttendanceBar> {
  bool isBarClicked = false;
  double maxHeight = 250.0 - 19.0;
  late double barHeight;

  @override
  void initState() {
    super.initState();
    updateBarHeight();
  }

  void updateBarHeight() {
    double maxAttendance = 100.0; // Assuming max attendance is 100%
    double scalingFactor = maxAttendance > 0 ? maxHeight / maxAttendance : 1.0;
    barHeight = widget.attendance * scalingFactor;
  }

  @override
  void didUpdateWidget(covariant AttendanceBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateBarHeight();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: widget.deviceSize.width / 9,
                height: barHeight,
                decoration: BoxDecoration(
                  color: widget.attendance < 70 ? Colors.red : ColorsConstants.primaryBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Positioned(
                top: 0,
                child: Text(
                  AttendanceBar.getFormattedAttendance(widget.attendance),
                  style: const TextStyle(
                    color: ColorsConstants.backgroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            widget.subjectCode,
            style: const TextStyle(
              color:
                   Color.fromARGB(255, 80, 141, 191),
              fontWeight:  FontWeight.bold,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
