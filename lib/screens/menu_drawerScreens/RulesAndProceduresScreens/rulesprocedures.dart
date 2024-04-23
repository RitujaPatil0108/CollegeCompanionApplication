// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:campus_companion/constants/colors_constants.dart';

class RulesAndProcedures extends StatefulWidget {
  const RulesAndProcedures({Key? key}) : super(key: key);

  @override
  State<RulesAndProcedures> createState() => _RulesAndProceduresState();
}

class _RulesAndProceduresState extends State<RulesAndProcedures> {
  late Future<void> _fetchProceduresFuture;
  List<Map<String, String>> procedures = [];

  @override
  void initState() {
    super.initState();
    _fetchProceduresFuture = _fetchProcedures();
  }

  Future<void> _fetchProcedures() async {
    final url = Uri.parse('https://samfrost.pythonanywhere.com/api/v1/rules_and_procedures');

    try {
      final response = await http.get(url);
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          procedures = data.map((item) => Map<String, String>.from(item)).toList();
        });
      } else {
        throw Exception('Failed to load procedures: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load procedures: $error');
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
      body: FutureBuilder(
        future: _fetchProceduresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: procedures.length,
              itemBuilder: (context, index) {
                final procedure = procedures[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${procedure['programme']} - ${procedure['department']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsConstants.primaryBlue,
                          ),
                        ),
                        Text(
                          'Date: ${procedure['date']}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Title: ${procedure['title']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
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
                            Align(
                              alignment: Alignment.center,
                              child: TextButton( // Changed to TextButton
                                onPressed: () {
                                  launch(procedure['file']!); // Launch rules link
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(ColorsConstants.primaryBlue),
                                ),
                                child: const Text('View Rules', style: TextStyle(color: Colors.white)), // Changed child to Text widget
                              ),
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
