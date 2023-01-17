import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:manage_peoples/routes/pages.dart';
import 'package:manage_peoples/routes/routes.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
      return OverlaySupport.global(
        child: GetMaterialApp(
          title: 'Flutter Demo',
          // theme: defaultTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.BLOG,
          // routes: {
          //   for (RouteModel e in CommonPage.pages) e.name: (context) => e.page
          // },
          // translations: LocalizationService(),
          locale: const Locale('en'),
          getPages: Pages.pages(),
          color: Colors.white,
          // initialBinding: AppBinding(),
        ),
      );
  }

    // return BlogView();
}

