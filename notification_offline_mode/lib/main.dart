import 'package:flutter/material.dart';
import 'package:notification_offline_mode/notification_service.dart';
import 'package:notification_offline_mode/resume_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification Offline Mode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Notification Offline Mode'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);
    NotificationService().init();
    listenNotifications();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  late AppLifecycleState _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    setState(() {
      _notification = state;
    });

    switch (state) {
      case AppLifecycleState.paused:
        print('paused');
        break;
      case AppLifecycleState.inactive:
        print('inactive');
        _notificationService.scheduleNotifications(
          title: "Anda telah keluar dari aplikasi",
          body:
              "Silahkan lanjutkan pekerjaan Anda atau akan dianggap telah selesai!",
        );
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.detached:
        print('detached');
        _notificationService.scheduleNotifications(
          title: "Anda telah keluar dari aplikasi",
          body:
              "Silahkan lanjutkan pekerjaan Anda atau akan dianggap telah selesai!",
        );
        break;
    }
  }

  void listenNotifications() {
    NotificationService.onNotifications.stream.listen(onClickNotification);
  }

  void onClickNotification(String? payload) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ResumeTest(payload: payload)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Simulasi Ujian',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 24,
              ),
              Text(
                'Ujian sedang berlangsung ...',
              )
            ],
          ),
        ));
  }
}
