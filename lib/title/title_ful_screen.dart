import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration_timer/conponent/button.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_timer/conponent/timer_label.dart';

class TitleFulScreen extends StatefulWidget {
  const TitleFulScreen({Key? key}) : super(key: key);

  @override
  _TitleFulScreenState createState() => _TitleFulScreenState();
}

class _TitleFulScreenState extends State<TitleFulScreen> {
  Duration initialTimer = const Duration();
  final CountdownController _controller = CountdownController(autoStart: true);
  bool isStart = false;
  bool isPause = false;
  int setTime = 0;

  //ローカル通知の設定
  Future<void> notify() {
    //通知を鳴らしたくない。
    final flap = FlutterLocalNotificationsPlugin();
    return flap
        .initialize(
          const InitializationSettings(iOS: IOSInitializationSettings()),
        )
        .then(
          (_) => flap.show(0, '', '設定した時間になりました。', const NotificationDetails()),
        );
  }

  //ダイアログの通知
  Future onDidReceiveLocalNotification(
    String title,
    String body,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('OK'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        backgroundColor: Colors.brown[50],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isStart
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Countdown(
                    controller: _controller,
                    seconds: setTime,
                    build: (_, double time) => TimerLabel(
                      title: time.toString(),
                    ),
                    interval: const Duration(milliseconds: 100),
                    onFinished: () {
                      setState(() {
                        isStart = isPause = false;
                        //ダイアログの通知
                        onDidReceiveLocalNotification(
                          '設定した時間になりました。',
                          'OKを押して解除してください。',
                        );
                        //Push通知の設定
                        notify();
                      });
                      //終わったらバイブレーションを鳴らす。
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
                    initialTimerDuration: initialTimer,
                    onTimerDurationChanged: (Duration value) {
                      setState(() {
                        initialTimer = value;
                        //TODO 時間を全部秒に直してあげる
                        int i3 = value.inSeconds;
                        //TODO 時間を渡してあげる
                        setTime = i3;
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
                    //強制的にタイマーを終わらせる。
                    isStart = isPause = false;
                    _controller.pause();
                  });
                },
              ),
              ButtonWidget(
                title: isPause ? '一時停止' : '開始',
                onTap: () {
                  if (setTime == 0) {
                  } else {
                    setState(() {
                      isPause = !isPause;
                      if (isStart) {
                        _controller.pause();
                      } else {
                        isStart = !isStart;
                      }
                      if (isPause) {
                        _controller.start();
                      } else {
                        _controller.pause();
                      }
                    });
                  }
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
