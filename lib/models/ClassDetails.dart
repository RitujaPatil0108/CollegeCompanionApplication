import 'package:flutter/material.dart';

class ClassDetails {
  final String day;
  final String date;
  final List<LectureDetails> lectureDetails;

  ClassDetails({
    required this.day,
    required this.date,
    required this.lectureDetails,
  });
}

class LectureDetails {
  final int sNo;
  final String faculty;
  final String courseCode;
  final String roomNumber;
  final String time;

  LectureDetails({
    required this.sNo,
    required this.faculty,
    required this.courseCode,
    required this.roomNumber,
    required this.time,
  });
}

class ClassDataProvider extends ChangeNotifier {
  Map<String, List<ClassDetails>> classDetailsMap = {};

  void setData(List<ClassDetails> data) {
    classDetailsMap.clear(); // Clear previous data
    for (var classDetail in data) {
      final day = classDetail.day;
      if (!classDetailsMap.containsKey(day)) {
        classDetailsMap[day] = [];
      }
      classDetailsMap[day]!.add(classDetail);
    }
    notifyListeners();
  }
}
