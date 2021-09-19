// Flutter imports:
import 'package:flutter/material.dart';

class TimerLabel extends StatelessWidget {
  final String title;

  const TimerLabel({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 70,
        ),
      ),
    );
  }
}
