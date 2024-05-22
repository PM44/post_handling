import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String subTitle;

  const PostCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent)
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 14),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 12),
        ),
      ),
    );
  }
}
