import 'package:campus_companion/constants/colors_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/ClassDetails.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  bool isToday(DateTime date, String today) {
    final formatter = DateFormat('dd-MMM-yyyy');
    final formattedDate = formatter.format(date);
    return formattedDate == today;
  }

  DateTime customParseDate(String dateString) {
    final DateFormat format = DateFormat('dd-MMM-yyyy');
    return format.parse(dateString);
  }

   String getClassStatus(String classTime) {
    final times = classTime.split(' To ');
    if (times.length != 2) {
      return 'Scheduled'; // Invalid time format
    }

    final startTime = times[0];
    final endTime = times[1];

    final now = DateTime.now();
    final start = parseTime(startTime);
    final end = parseTime(endTime);

    if (now.isAfter(end)) {
      return 'Completed';
    } else if (now.isBefore(start)) {
      return 'Scheduled';
    } else {
      return 'Ongoing';
    }
  }

  DateTime parseTime(String timeStr) {
    final timeFormat = DateFormat('hh:mm a');
    final dateTime = timeFormat.parse(timeStr);
    return DateTime(1, 1, 1, dateTime.hour, dateTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ClassDetails>> classDetailsMap =
        Provider.of<ClassDataProvider>(context).classDetailsMap;

    final todayDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());

    final todayClasses = classDetailsMap.values.expand((list) {
      return list.where((classDetail) {
        return isToday(customParseDate(classDetail.date), todayDate);
      });
    }).toList();

    print("Today Classes: $todayClasses");

    for (var classDetail in todayClasses) {
      print('Date: ${classDetail.date}');
      print('Lecture Details:');
      for (var lecture in classDetail.lectureDetails) {
        print('  Serial Number: ${lecture.sNo}');
        print('  Faculty: ${lecture.faculty}');
        print('  Course Code: ${lecture.courseCode}');
        print('  Room Number: ${lecture.roomNumber}');
        print('  Time: ${lecture.time}');
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: todayClasses
            .map((data) => data.lectureDetails.map((lecture) {
               final status = getClassStatus(lecture.time);
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 300,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [ColorsConstants.primaryBlue, ColorsConstants.primaryBlue.withOpacity(.7)],
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Transform.translate(
                                    offset: const Offset(25, -25),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Transform.translate(
                                    offset: const Offset(-70, 70),
                                    child: CircleAvatar(
                                      radius: 100,
                                      backgroundColor: Colors.white.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          _IconLabel(
                                            color: Colors.white,
                                            iconData: EvaIcons.clockOutline,
                                            label: lecture.time,
                                          ),
                                          _IconLabel(
                                            color: Colors.white,
                                            iconData: EvaIcons.mapOutline,
                                            label: lecture.roomNumber,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        lecture.courseCode,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          letterSpacing: 1,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                       Text(
                                        'Status: $status',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }))
            .expand((element) => element)
            .toList(),
      ),
    );
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({
    required this.color,
    required this.iconData,
    required this.label,
    Key? key,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color.withOpacity(.8),
          ),
        ),
      ],
    );
  }
}
