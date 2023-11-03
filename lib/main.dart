import 'package:app/Model/data_model.dart';
import 'package:app/widget/bottombar.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/splash.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(EmployeeModelAdapter().typeId)) {
    Hive.registerAdapter(EmployeeModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
