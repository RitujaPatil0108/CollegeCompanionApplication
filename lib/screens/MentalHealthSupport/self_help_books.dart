import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class SelfHelpBooks extends StatelessWidget {
  const SelfHelpBooks({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _BookCard(
              bookTitle: 'The Power of Now',
              author: 'Eckhart Tolle',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'The Power of Now',
                      author: 'Eckhart Tolle',
                      image: 'assets/images/powerofnow.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'Atomic Habits',
              author: 'James Clear',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'Atomic Habits',
                      author: 'James Clear',
                      image: 'assets/images/atomichabits.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'The Power of Now',
              author: 'Eckhart Tolle',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'The Power of Now',
                      author: 'Eckhart Tolle',
                      image: 'assets/images/powerofnow.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'Atomic Habits',
              author: 'James Clear',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'Atomic Habits',
                      author: 'James Clear',
                      image: 'assets/images/atomichabits.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'The Power of Now',
              author: 'Eckhart Tolle',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'The Power of Now',
                      author: 'Eckhart Tolle',
                      image: 'assets/images/powerofnow.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'Atomic Habits',
              author: 'James Clear',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'Atomic Habits',
                      author: 'James Clear',
                      image: 'assets/images/atomichabits.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'The Power of Now',
              author: 'Eckhart Tolle',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'The Power of Now',
                      author: 'Eckhart Tolle',
                      image: 'assets/images/powerofnow.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _BookCard(
              bookTitle: 'Atomic Habits',
              author: 'James Clear',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailsPage(
                      bookTitle: 'Atomic Habits',
                      author: 'James Clear',
                      image: 'assets/images/atomichabits.jpg',
                      preface: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                          'deserunt mollit anim id est laborum.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Add more book cards as needed
          ],
        ),
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final String bookTitle;
  final String author;
  final VoidCallback onPressed;

  const _BookCard({
    Key? key,
    required this.bookTitle,
    required this.author,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookTitle,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.primaryBlue,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Author: $author',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final String bookTitle;
  final String author;
  final String image;
  final String preface;

  const BookDetailsPage({
    Key? key,
    required this.bookTitle,
    required this.author,
    required this.image,
    required this.preface,
  }) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 310,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'Title: $bookTitle',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.primaryBlue
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Text(
                'Author: $author',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Add other book details here if needed
            const SizedBox(height: 16.0),
            const Text(
              'Synopsis:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              preface,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add action to read the book
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstants.primaryBlue,
                minimumSize: const Size(double.infinity, 35.0),
              ),
              child: const Text('Read Book', style: TextStyle(fontSize: 14.0)),
            ),
          ],
        ),
      ),
    );
  }
}
