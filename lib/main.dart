import 'package:barcodeapp/config/routes/page_router.dart';
import 'package:barcodeapp/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BarCode',
      theme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light()),
      initialRoute: "/signup",
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
