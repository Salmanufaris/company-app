import 'package:app/Model/data_model.dart';
import 'package:app/controller/Login_provider.dart';
import 'package:app/controller/add_provider.dart';
import 'package:app/controller/bottom_provider.dart';
import 'package:app/controller/dbprovider.dart';
import 'package:app/controller/edit_provider.dart';
import 'package:app/controller/filter_provider.dart';
import 'package:app/controller/home_provider.dart';
import 'package:app/view/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AddProvider(companyname: "Welcome Back")),
        ChangeNotifierProvider(create: (context) => EditProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BottomBarProvider()),
        ChangeNotifierProvider(create: (context) => Filterprovider()),
        ChangeNotifierProvider(create: (context) => DbProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter App',
        home: Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
