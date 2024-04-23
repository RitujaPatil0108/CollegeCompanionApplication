// Import necessary packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../../constants/colors_constants.dart';

class PDFViewerScreen extends StatelessWidget {
  final String pdfPath;

  const PDFViewerScreen({Key? key, required this.pdfPath}) : super(key: key);

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
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: PDFView(
            filePath: pdfPath,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            pageSnap: false,
            defaultPage: 0,
            fitPolicy: FitPolicy.WIDTH,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              Text(
                'The NorthCap University',
                style: TextStyle(
                  color: ColorsConstants.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> generateNoticesPDF(
    BuildContext context, List<Map<String, dynamic>> notices) async {
  final pdf = pw.Document();

  try {
    // Define text styles
    final headerStyle = pw.TextStyle(
      fontSize: 24,
      fontWeight: pw.FontWeight.bold,
    );

    // Header section
    final headerContent = pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      children: [
        pw.Text(
          'Notices',
          style: headerStyle,
          textAlign: pw.TextAlign.center,
        ),
      ],
    );

    // Body section
    final bodyContent = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        for (final notice in notices) ...[
          pw.Text(
            'Notice Number: ${notice['notice_number']}',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Text('Programme: ${notice['programme']}'),
          pw.Text('Department: ${notice['department']}'),
          pw.Text('Specialisation: ${notice['specialisation']}'),
          pw.Text('Date: ${notice['date']}'),
          pw.Text('Title: ${notice['title']}'),
          pw.Text('Description: ${notice['description']}'),
          pw.Divider(),
        ],
      ],
    );

    // Add content to PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              headerContent,
              pw.Divider(),
              bodyContent,
            ],
          );
        },
      ),
    );

    // Save PDF file
    final output = await getApplicationDocumentsDirectory();
    final pdfFile = File('${output.path}/notices.pdf');
    await pdfFile.writeAsBytes(await pdf.save());

    // Display PDF viewer screen
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerScreen(pdfPath: pdfFile.path),
      ),
    );
  } catch (e) {
    print('Error generating PDF: $e');
    // Handle error
  }
}
