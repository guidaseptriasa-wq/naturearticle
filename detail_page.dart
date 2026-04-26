import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String desc;

  const DetailPage(
      {super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(desc),
      ),
    );
  }
}