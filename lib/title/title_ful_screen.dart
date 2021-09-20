// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

// Project imports:
import 'package:vibration_timer/conponent/button.dart';
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
  final flap = FlutterLocalNotificationsPlugin();

  //ローカル通知の設定
  Future<void> notify() {
    // final flap = FlutterLocalNotificationsPlugin();
    return flap
        .initialize(
          const InitializationSettings(
              iOS: IOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            defaultPresentSound: true,
            defaultPresentAlert: true,
            defaultPresentBadge: true,
          )),
        )
        .then(
          (_) => flap.show(0, 'タイマー', '', const NotificationDetails()),
        );
  }

  void cancelNotification() async {
    // final flap = FlutterLocalNotificationsPlugin();
    // await flutterLocalNotificationsPlugin.cancelAll();
    await flap.cancelAll();
    await flap.cancel(0);
  }

  Future<void> notification() async {
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
    await Future.delayed(const Duration(seconds: 2));
    notify();
  }

  //ダイアログの通知
  Future onDidReceiveLocalNotification(
    String title,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('OK'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              //TODO 通知を強制的に止める。
              cancelNotification();
              await flap.cancelAll();
              await flap.cancel(0);
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
                        onDidReceiveLocalNotification('設定した時間になりました。');
                        //Push通知の設定
                        notification();
                      });
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
          const SizedBox(
            height: 50,
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
                    cancelNotification();
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
