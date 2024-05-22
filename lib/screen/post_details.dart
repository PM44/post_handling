import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String title;
  final String subTitle;

  const PostDetails({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
