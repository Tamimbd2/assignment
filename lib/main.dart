import 'package:flutter/material.dart';

void main() {
  runApp(const box());
}

class box extends StatefulWidget {
  const box({super.key});

  @override
  State<box> createState() => _boxState();
}

class _boxState extends State<box> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: cardshape(),
    );
  }
}

class cardshape extends StatefulWidget {
  const cardshape({super.key});

  @override
  State<cardshape> createState() => _cardshapeState();
}

class _cardshapeState extends State<cardshape> {
  final List<Map<String, String>> courses = [
    {
      'image':
      'https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg',
      'title': 'Full Stack Web Development with Python',
    },
    {
      'image':
      'https://cdn.ostad.app/course/cover/2025-06-26T19-41-53.112Z-react-native-thumb.jpg',
      'title': 'Full Stack Web Development with JavaScript',
    },
    {
      'image':
      'https://cdn.ostad.app/course/cover/2025-01-23T12-32-14.452Z-Untitled-1%20(1)%20(1).jpg',
      'title': 'Mastering DevOps: From Fundamentals to Advanced Practices',
    },
    {
      'image':
      'https://cdn.ostad.app/course/cover/2024-12-23T06-07-44.087Z-Course%20Thumbnail%2016.jpg',
      'title': 'Full Stack Web Development with PHP, Laravel & Vue Js',
    },
  ];

  int _getCrossAxisCount(double width) {
    if (width < 768) {
      return 2; // Mobile
    } else if (width >= 768 && width <= 1024) {
      return 3; // Tablet
    } else {
      return 4; // Desktop/Web
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(width);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Ostad',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return cards(
              image: course['image']!,
              City: course['title']!,
            );
          },
        ),
      ),
    );
  }
}

class cards extends StatelessWidget {
  final String image, City;
  const cards({
    super.key,
    required this.image,
    required this.City,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              City,
              style: const TextStyle(fontSize: 17, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white54,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 0,
              ),
              child: const Text('বিস্তারিত দেখি →'),
            ),
          ),
        ],
      ),
    );
  }
}
