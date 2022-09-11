import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/translations/data.translation.dart';
import 'package:momyzdelivery/ui/views/splashScreen/widget.splash.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'controller/controller.home.dart';
import 'controller/controller.sound.dart';

SoundController soundController = SoundController();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("min houna dakhalt 2");
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  if (message.data['route'] == 'home') {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().microsecond,
        color: Colors.transparent,
        displayOnBackground: true,
        displayOnForeground: true,
        channelKey: 'FISHTENDER_NOTIFICATION',
        notificationLayout: NotificationLayout.Inbox,
        hideLargeIconOnExpand: true,
        title: "activate_title".tr,
        body: "activate_desc".tr,
      ),
    );
    return;
  }
  try {
    soundController.play();
  } catch (e) {
    print("error sound controlleer");
  }

  AwesomeNotifications().cancelAll();
  if (notification != null) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: DateTime.now().microsecond,
            color: Colors.transparent,
            displayOnBackground: true,
            displayOnForeground: true,
            channelKey: 'FISHTENDER_NOTIFICATION',
            notificationLayout: NotificationLayout.Inbox,
            hideLargeIconOnExpand: true,
            title: message.notification!.title,
            body: message.notification!.body,
            payload: {
          'order_id': message.data['order_id'],
          'order_type': message.data['order_type'],
        }));
    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) {
      var notif = receivedNotification.payload;
      if (notif != null) {
        try {} catch (e) {
          print("ha houwa");
        }
        final homeController = Get.put(HomeController());
        final splashController = Get.put(SplashController());
        if (homeController != null) {
          if (notif['order_type'].toString() == "2") {
            print("from 132 " + notif['order_id'].toString());
            homeController.showBottomOrder(notif['order_id'].toString());
          } else {
            homeController.previewOrderNormal(notif['order_id'].toString());
          }
        }
      }
    });
  }
}

class _MyAppState extends State<MyApp> {
  Future<void> setupInteractedMessage() async {
    await FirebaseMessaging.instance;
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    AwesomeNotifications().initialize(null, // icon for your app notification
        [
          NotificationChannel(
            channelKey: 'FISHTENDER_NOTIFICATION',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            playSound: true,
            enableLights: true,
            enableVibration: true,
          )
        ]);
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    /*   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("min houna");
      RemoteNotification? notification = message.notification;
      if (message.data['route'] != 'home') {
        final homeController = Get.put(HomeController());
        final splashController = Get.put(SplashController());
        if (homeController != null) {
          if (message.data['order_type'].toString() == "2") {
            print("from 132 " + message.data['order_id']);
            homeController.showBottomOrder(message.data['order_id'].toString());
          } else {
            homeController
                .previewOrderNormal(message.data['order_id'].toString());
          }
        }
        return;
      }
    });
    */
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AwesomeNotifications().cancelAll();
      print("message notification foreground");
      print(message.data['route'] == 'home');
      if (message.data['route'] == 'home') {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: DateTime.now().microsecond,
            color: Colors.transparent,
            displayOnBackground: true,
            displayOnForeground: true,
            channelKey: 'FISHTENDER_NOTIFICATION',
            notificationLayout: NotificationLayout.Inbox,
            hideLargeIconOnExpand: true,
            title: "activate_title".tr,
            body: "activate_desc".tr,
          ),
        );
        return;
      }
      soundController.play();
      print({
        'order_id': message.data['order_id'],
        'order_type': message.data['order_type'],
      });
      if (notification != null) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: DateTime.now().microsecond,
              color: Colors.transparent,
              displayOnBackground: true,
              displayOnForeground: true,
              channelKey: 'FISHTENDER_NOTIFICATION',
              notificationLayout: NotificationLayout.Inbox,
              hideLargeIconOnExpand: true,
              title: message.notification!.title,
              body: message.notification!.body,
              payload: {
                'order_id': message.data['order_id'],
                'order_type': message.data['order_type'],
              }),
        );
      }
    });
    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) {
      var notif = receivedNotification.payload;
      if (notif != null) {
        try {
          soundController.stop();
        } catch (e) {
          print("ha houwa");
        }
        final homeController = Get.put(HomeController());
        final splashController = Get.put(SplashController());
        if (homeController != null) {
          if (notif['order_type'].toString() == "2") {
            print("from 132 " + notif['order_id'].toString());
            homeController.showBottomOrder(notif['order_id'].toString());
          } else {
            homeController.previewOrderNormal(notif['order_id'].toString());
          }
        }
      }
    });
  }

  @override
  void initState() {
    setupInteractedMessage();
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
