import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibration_timer/conponent/button.dart';

class TitleFulScreen extends StatefulWidget {
  const TitleFulScreen({Key? key}) : super(key: key);

  @override
  _TitleFulScreenState createState() => _TitleFulScreenState();
}

class _TitleFulScreenState extends State<TitleFulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime value) {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                title: 'キャンセル',
                onTap: () {},
              ),
              ButtonWidget(
                title: '開始',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
