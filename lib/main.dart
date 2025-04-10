import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_labs/firebase_options.dart';
import 'package:unity_labs/services/main_services.dart';
import 'helpers/scroll_behaviour.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initServices();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<MainServices>(() async => MainServices());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      enableLog: false,
      popGesture: true,
      transitionDuration: const Duration(milliseconds: 500),
      title: 'Unity Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: child!,
        );
      },
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
