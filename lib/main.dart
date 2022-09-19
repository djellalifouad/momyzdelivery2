import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/translations/data.translation.dart';
import 'package:momyzdelivery/ui/views/bottom/view_bottom.dart';
import 'package:momyzdelivery/ui/views/splashScreen/widget.splash.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/controller.home.dart';
import 'controller/controller.sound.dart';

AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.max,
  playSound: true,
  showBadge: true,
  enableLights: true,
  enableVibration: true,
  sound: const UriAndroidNotificationSound("assets/sound/awesome.mp3"),
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
SoundController soundController = SoundController();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null) {
    flutterLocalNotificationsPlugin.cancelAll();
    // lunch sound if delivery
    if (message.data['route'] == 'order-details') {
      var ref = await SharedPreferences.getInstance();
      await ref.setString(
          "currentOrderId", message.data['order_id'].toString());
      await ref.setString("orderType", message.data['order_type'].toString());
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.black,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    } else {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              enableVibration: true,
              enableLights: true,
              color: Colors.black,
              playSound: false,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    final controller = Get.find<HomeController>();
    controller.check();
  });
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Future<void> foregroundMessageHandler() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("here");
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    playSound: true, channelDescription: channel.description)));
      }
    });
  }
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.cancelAll();
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.black,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
        // lunch sound if delivery
        if (message.data['route'] == 'order-details') {
          soundController.play();
          final homeController = Get.find<HomeController>();
          if (homeController != null) {
            if (message.data['order_type'].toString() == "2") {
              homeController
                  .showBottomOrder(message.data['order_id'].toString());
            } else {
              homeController
                  .previewOrderNormal(message.data['order_id'].toString());
            }
          }
          Future.delayed(Duration(seconds: 5), () {
            soundController.stop();
          });
        }
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              title: "Momys Delivery",
              translations: LocalString(),
              locale: GetStorage().read("lang").toString() == "en"
                  ? Locale('en', "US")
                  : Locale('ar', 'AR'),
              theme: ThemeData(
                primaryColor: Pallete.pinkColorPrinciple,
                textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(
                  Theme.of(context).textTheme,
                ),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                    secondary: Pallete.pinkColorPrinciple,
                    primary: Colors.black),
              ),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
