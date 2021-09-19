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
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 30,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          onPrimary: Colors.black,
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
