import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget {

  final Function() onTap;
  final String buttonText;
  final String timerText;

  const TimerCard({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.timerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.orange,
      shadowColor: Colors.yellow,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              timerText,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

