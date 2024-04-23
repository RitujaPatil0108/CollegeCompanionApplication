import 'package:campus_companion/screens/MentalHealthSupport/self_help_books.dart';
import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class ReadingContentDashboard extends StatelessWidget {
  const ReadingContentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BookGenre> genres = [
      BookGenre(
        label: 'Self Help',
        image: 'assets/images/self_help.png',
        onTap: () {
          // Handle Genre 1 onTap
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const SelfHelpBooks())));
        },
      ),
      BookGenre(
        label: 'Psychology',
        image: 'assets/images/psychology.png',
        onTap: () {
          // Handle Genre 2 onTap
        },
      ),
      BookGenre(
        label: 'Fiction',
        image: 'assets/images/fiction.png',
        onTap: () {
          // Handle Genre 3 onTap
        },
      ),
      BookGenre(
        label: 'Mindfulness',
        image: 'assets/images/mindfullness.jpg',
        onTap: () {
          // Handle Genre 4 onTap
        },
      ),
       BookGenre(
        label: 'Spirituality',
        image: 'assets/images/spirituality.jpg',
        onTap: () {
          // Handle Genre 4 onTap
        },
      ),
       BookGenre(
        label: 'Nutrition & Wellness',
        image: 'assets/images/nutrition_wellness.png',
        onTap: () {
          // Handle Genre 4 onTap
        },
      ),
       BookGenre(
        label: 'Memoir',
        image: 'assets/images/memoir.jpg',
        onTap: () {
          // Handle Genre 1 onTap
        },
      ),
      BookGenre(
        label: 'Art Therapy',
        image: 'assets/images/art_therapy.jpg',
        onTap: () {
          // Handle Genre 1 onTap
        },
      ),
      BookGenre(
        label: 'Healing',
        image: 'assets/images/healing.jpg',
        onTap: () {
          // Handle Genre 1 onTap
        },
      ),
        BookGenre(
        label: 'Happiness',
        image: 'assets/images/happiness.jpg',
        onTap: () {
          // Handle Genre 4 onTap
        },
      ),
    ];

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
        child: Column(
          children: List.generate(
            (genres.length / 2).ceil(),
            (index) => Row(
              children: genres
                  .skip(index * 2)
                  .take(2)
                  .map(
                    (genre) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: genre.onTap,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 4,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: DecorationImage(
                                  image: AssetImage(genre.image),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.65),
                                    BlendMode.dstATop,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 85),
                                  Text(
                                    genre.label,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class BookGenre {
  final String label;
  final String image;
  final VoidCallback? onTap;

  BookGenre({required this.label, required this.image, this.onTap});
}
