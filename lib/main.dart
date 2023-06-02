import 'package:bot_toast/bot_toast.dart';
import 'package:cyber_sec/firebase_options.dart';
import 'package:cyber_sec/views/admin_login.dart';
import 'package:cyber_sec/views/base_view.dart';
import 'package:cyber_sec/views/edit_file.dart';
import 'package:cyber_sec/views/mobile_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
}
final botToastBuilder = BotToastInit();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),

        routes: {
          MobileView.route:(context)=>MobileView(),
          AdminLoginPage.route:(context)=>AdminLoginPage()
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,

        ),
        home:
        //AdminPage()
        BaseView()

      ),
    );
  }
}

