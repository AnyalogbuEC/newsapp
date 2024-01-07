import 'package:flutter/material.dart';

/// This class extends StatelessWidget and it is the
/// class that builds the individual blog tile in the home screen.
/// It is used for all the tabs in home screen.

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description;
  const BlogTile(
      {super.key,
      required this.description,
      required this.imageUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                // child: Image.asset(
                //   'lib/assets/error.jpeg',
                //   fit: BoxFit.contain,
                // ),
                child: Container(color: Colors.amber),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
