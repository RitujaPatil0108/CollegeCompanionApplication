import 'package:flutter/material.dart';

class AttendanceData {
  final String sNo;
  final String subjectName;
  final String attendance;
  final String totalLecture;
  final String totalPresent;
  final String totalAbsent;
  final String leaveOfAbsence;

  AttendanceData({
    required this.sNo,
    required this.subjectName,
    required this.attendance,
    required this.totalLecture,
    required this.totalPresent,
    required this.totalAbsent,
    required this.leaveOfAbsence,
  });
}

class AttendanceDataProvider extends ChangeNotifier {
  List<AttendanceData> _data = [];

  List<AttendanceData> get data => _data;

  void setData(List<AttendanceData> newData) {
    _data = newData;
    notifyListeners();
  }
}