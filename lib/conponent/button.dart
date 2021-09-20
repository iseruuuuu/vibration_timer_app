// Flutter imports:
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String title;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 25,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[200],
          onPrimary: Colors.black,
          elevation: 16,
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
