import 'package:campus_companion/constants/colors_constants.dart';
import 'package:campus_companion/providers/user_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'Document_Uploaded.dart';

class DoclockDashboard extends StatelessWidget {
  const DoclockDashboard({Key? key}) : super(key: key);

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ItemCard(
            title: 'GP Certificates',
            icon: Icons.school,
            onTap: () {
              _navigateToDocumentsScreen(context, 'GP Certificates');
            },
          ),
          // Add more item cards as needed
        ],
      ),
    );
  }

  void _navigateToDocumentsScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentsScreen(title: title)),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                color: ColorsConstants.primaryBlue,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorsConstants.primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentsScreen extends StatefulWidget {
  final String title;

  const DocumentsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  String? _selectedFileName; // Variable to store the selected file name
  TextEditingController _fileNameController = TextEditingController();

  @override
  void dispose() {
    _fileNameController.dispose();
    super.dispose();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Displaying ${widget.title}'),
            if (_selectedFileName != null) // Display the selected file name
              Text('Selected File: $_selectedFileName'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showUploadFileDialog(context);
        },
        backgroundColor: ColorsConstants.primaryBlue,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showUploadFileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload File'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _fileNameController,
                    decoration: const InputDecoration(
                      labelText: 'Enter File Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsConstants.primaryBlue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();

                      if (result != null) {
                        final file = result.files.single;
                        setState(() {
                          _selectedFileName = file.name; // Store the selected file name
                        });
                      } else {
                        // User canceled the picker
                        print('No file picked');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorsConstants.primaryBlue,
                    ),
                    child: Text(_selectedFileName ?? 'Choose File'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _uploadDocument(_selectedFileName, widget.title, context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorsConstants.primaryBlue,
                    ),
                    child: const Text('Upload Document'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

 void _uploadDocument(String? fileName, String category, BuildContext context) async {
  try {
    if (fileName == null) {
      print('Error: File name is null');
      return;
    }

    final rollNumber = Provider.of<UserProvider>(context, listen: false).rollNumber;
    print('Roll Number: $rollNumber');
    print('Category: $category');
    print('File Name: $fileName');

    // Prepare request body
    final url = Uri.parse('https://samfrost.pythonanywhere.com/api/v1/uploadDocument');
    final request = http.MultipartRequest('POST', url)
      ..fields['roll_number'] = rollNumber
      ..fields['category'] = category
      ..files.add(await http.MultipartFile.fromPath('file', fileName));

    // Send request
    final response = await http.Response.fromStream(await request.send());

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Successful upload
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DocumentUploaded()),
      );
    } else {
      // Handle error
      print('Failed to upload document: ${response.reasonPhrase}');
      // Optionally, show an error message to the user
    }
  } catch (e) {
    // Handle network errors
    print('Error uploading document: $e');
    // Optionally, show an error message to the user
  }
}

}
