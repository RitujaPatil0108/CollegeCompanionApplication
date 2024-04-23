import 'package:flutter/material.dart';
import '../../../constants/colors_constants.dart';

class DocumentUploaded extends StatelessWidget {
  const DocumentUploaded({Key? key}) : super(key: key);

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
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: ColorsConstants.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check, // Changed icon to checkmark icon
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Document Uploaded Successfully', // Changed text
              style: TextStyle(
                color: ColorsConstants.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
           
          ],
        ),
      ),
    );
  }
}
