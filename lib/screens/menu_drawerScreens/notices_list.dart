// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:campus_companion/constants/colors_constants.dart';
import 'package:campus_companion/providers/user_provider.dart';

class NoticesList extends StatefulWidget {
  const NoticesList({Key? key}) : super(key: key);

  @override
  State<NoticesList> createState() => _NoticesListState();
}

class _NoticesListState extends State<NoticesList> {
  Future<List<Map<String, dynamic>>> _fetchNotices(
      BuildContext context) async {
    final rollNumber =
        Provider.of<UserProvider>(context, listen: false).rollNumber;
    final url = Uri.parse(
        'https://samfrost.pythonanywhere.com/api/v1/notices');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'roll_number': rollNumber});

    final response =
        await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
          json.decode(response.body));
    } else {
      throw Exception('Failed to load notices');
    }
  }

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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchNotices(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final notices = snapshot.data!;
            return ListView.builder(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final notice = notices[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${notice['programme']} - ${notice['department']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsConstants.primaryBlue,
                          ),
                        ),
                        Text(
                          'Date: ${notice['date_of_notice']}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Title: ${notice['title']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                    iconColor: ColorsConstants.primaryBlue,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton( // Changed to TextButton
                              onPressed: () {
                                launch(notice['file']); // Launch PDF link
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(ColorsConstants.primaryBlue),
                              ),
                              child: Text('View Notice', style: TextStyle(color: Colors.white)), // Changed child to Text widget
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
