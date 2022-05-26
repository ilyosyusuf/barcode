import 'package:barcodeapp/config/routes/page_router.dart';
import 'package:flutter/material.dart';

void main() {
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
      initialRoute: '/home',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
