import 'package:app/Model/data_model.dart';
import 'package:app/widget/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggedIn';

void main() async {
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
    return const MaterialApp(
      title: 'Flutter App',
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
