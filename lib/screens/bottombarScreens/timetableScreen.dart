import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/ClassDetails.dart';
import 'package:campus_companion/constants/colors_constants.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final classDetailsMap =
        Provider.of<ClassDataProvider>(context).classDetailsMap;
    final List<String> dates = classDetailsMap.keys.toList();

    return DefaultTabController(
      length: dates.length,
      child: Scaffold(
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: dates.map((date) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorsConstants.primaryBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: dates.map((date) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(), 
              itemCount: classDetailsMap[date]!.length,
              itemBuilder: (context, index) {
                final classDetail = classDetailsMap[date]![index];
                return GestureDetector(
                  onTap: () {
                    _showLectureDetails(context, classDetail);
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            classDetail.date,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...classDetail.lectureDetails.map((lecture) {
                          return ListTile(
                            title: Text(
                              'Lecture ${lecture.sNo}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Time: ${lecture.time}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Faculty: ${lecture.faculty}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Course Code: ${lecture.courseCode}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: ColorsConstants.primaryBlue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                lecture.roomNumber,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showLectureDetails(BuildContext context, ClassDetails classDetail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lectures for ${classDetail.date} (${classDetail.day})'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: classDetail.lectureDetails.map((lecture) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lecture ${lecture.sNo}:',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Time: ${lecture.time}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Faculty: ${lecture.faculty}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Course Code: ${lecture.courseCode}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Room Number: ${lecture.roomNumber}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Divider(),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
