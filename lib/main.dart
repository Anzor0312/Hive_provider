import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveprovider/view/home_page.dart';

import 'data/repository/get_currency_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetCuirrencyRepository().registerAdapters();
  Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomePage(),
    );
  }
}
