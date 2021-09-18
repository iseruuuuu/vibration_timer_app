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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      child: Card(
        elevation: 10,
        color: Colors.black26,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: onTap,
              child: Text(
                timerText,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

