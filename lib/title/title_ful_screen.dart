import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration_timer/conponent/button.dart';
import 'package:vibration/vibration.dart';

class TitleFulScreen extends StatefulWidget {
  const TitleFulScreen({Key? key}) : super(key: key);

  @override
  _TitleFulScreenState createState() => _TitleFulScreenState();
}

class _TitleFulScreenState extends State<TitleFulScreen> {
  var time = '';
  var time2 = '';
  Duration initialtimer = new Duration();

  final CountdownController _controller = CountdownController(autoStart: false);

  bool isStart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          isStart
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Countdown(
                    controller: _controller,
                    //秒数 => 後で渡してあげる。
                    seconds: 5,
                    build: (_, double time) => Center(
                      child: Text(
                        time.toString(),
                        style: const TextStyle(
                          fontSize: 100,
                        ),
                      ),
                    ),
                    //区間
                    interval: const Duration(milliseconds: 100),
                    //終わったらバイブレーションを鳴らす。
                    onFinished: () {
                      Vibration.vibrate(pattern: [500, 1000, 500, 2000]);
                    },
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    minuteInterval: 1,
                    secondInterval: 1,
                    initialTimerDuration: initialtimer,
                    onTimerDurationChanged: (Duration value) {
                      setState(() {
                        initialtimer = value;
                        time2 = value.toString();
                      });
                    },
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                title: 'キャンセル',
                onTap: () {
                  setState(() {
                    isStart = false;
                  });
                },
              ),
              ButtonWidget(
                title: isStart ? '一時停止' : '開始',
                onTap: () {
                  setState(() {
                    if (isStart) {
                      //一時停止をする
                      print('a');
                      _controller.start();
                    } else {
                      //再生中
                      isStart = !isStart;
                      print('b');
                    }
                  });
                },
              ),
            ],
          ),
          Text(time2 + '下'),
        ],
      ),
    );
  }
}
