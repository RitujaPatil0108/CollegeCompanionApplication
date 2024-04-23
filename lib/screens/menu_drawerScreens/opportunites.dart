import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../constants/colors_constants.dart';

class OpportunitiesScreen extends StatelessWidget {
  const OpportunitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchOpportunities(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
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
            body: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final opportunity = snapshot.data![index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      opportunity['company_name'] != null ? opportunity['company_name'] : '',
                      style: const TextStyle(
                        color: ColorsConstants.primaryBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notice No: ${opportunity['notice_number']}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'Due Date: ${opportunity['due_date']}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OpportunityDetailsScreen(opportunity: opportunity),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchOpportunities() async {
    final url = Uri.parse('https://samfrost.pythonanywhere.com/api/v1/opportunities');

    try {
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load opportunities: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load opportunities: $error');
    }
  }
}

class OpportunityDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> opportunity;

  const OpportunityDetailsScreen({Key? key, required this.opportunity})
      : super(key: key);

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date of Issue: ${DateTime.now().toString().substring(0, 10)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Center Of Professional Attachment And Alumni Engagement (CPAA)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorsConstants.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Advance Notice for Campus Placement - Notice number ${opportunity['notice_number']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildTable('Opportunity Details', _convertOpportunityToString(opportunity)),
            _buildTable('Company Profile', opportunity['company_profile']),
            _buildTable('Job Description', opportunity['job_description']),
            _buildTable('Selection Process', opportunity['selection_process']),
            _buildTable('General Notes', opportunity['general_notes']),
            _buildTable("Student's Checklist", opportunity['student_checklist']),
            const SizedBox(height: 10),
            Text(
              'Date of Expiry: ${opportunity['expiry_date']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable(String title, dynamic data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsConstants.primaryBlue,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: data is Map<String, String>
              ? Table(
                  border: TableBorder.symmetric(
                    inside: const BorderSide(color: Colors.grey),
                    outside: const BorderSide(color: Colors.grey),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(3),
                  },
                  children: data.entries.map((entry) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            entry.key,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(entry.value),
                        ),
                      ],
                    );
                  }).toList(),
                )
              : ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Map<String, String> _convertOpportunityToString(Map<String, dynamic> opportunity) {
    return opportunity.map((key, value) {
      final updatedKey = _formatFieldName(key);
      return MapEntry(updatedKey, value.toString());
    });
  }

  String _formatFieldName(String fieldName) {
    // Replaces underscores with spaces and capitalizes each word
    return fieldName.split('_').map((word) {
      return word.substring(0, 1).toUpperCase() + word.substring(1);
    }).join(' ');
  }
}
