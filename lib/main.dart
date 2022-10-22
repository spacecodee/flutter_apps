import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/firebase_options.dart';
import 'package:flutter_apps/src/pages/main_page.dart';
import 'package:flutter_apps/src/pages/product_add.dart';
import 'package:flutter_apps/src/pages/product_update.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const MainPage(),
        "/add": (context) => const ProductAdd(),
        "/update": (context) => const ProductUpdate(),
      },
      initialRoute: "/",
    );
  }
}
