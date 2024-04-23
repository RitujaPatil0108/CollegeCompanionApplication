import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class MondayPage extends StatelessWidget {
  const MondayPage({Key? key}) : super(key: key);

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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'Monday',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: ColorsConstants.primaryBlue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            _ExerciseTable(),
          ],
        ),
      ),
    );
  }
}

class _ExerciseTable extends StatelessWidget {
  const _ExerciseTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsConstants.primaryBlue),
      children: [
        const TableRow(
          decoration: BoxDecoration(color: ColorsConstants.primaryBlue),
          children: [
            SizedBox(height: 20),
            TableCell(
              child: Center(
                child: Text(
                  'Exercises',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  'Approaches',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  'Numbers',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Center(
              child: Image.asset(
                'assets/images/squats.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Center(child: Text('Squat')),
            const Center(child: Text('3')),
            const Center(child: Text('10-15')),
          ],
        ),
         TableRow(
          children: [
            Center(
              child: Image.asset(
                'assets/images/squats.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Center(child: Text('PushUps')),
            const Center(child: Text('3')),
            const Center(child: Text('10-15')),
          ],
        ),
        TableRow(
          children: [
            Center(
              child: Image.asset(
                'assets/images/squats.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Center(child: Text('SitUps')),
            const Center(child: Text('3')),
            const Center(child: Text('10-15')),
          ],
        ),
        TableRow(
          children: [
            Center(
              child: Image.asset(
                'assets/images/squats.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Center(child: Text('Skipping')),
            const Center(child: Text('3')),
            const Center(child: Text('10-15')),
          ],
        ),
        TableRow(
          children: [
            Center(
              child: Image.asset(
                'assets/images/squats.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Center(child: Text('Squat')),
            const Center(child: Text('3')),
            const Center(child: Text('10-15')),
          ],
        ),
        // Add more rows for other exercises

      ],
    );
  }
}
