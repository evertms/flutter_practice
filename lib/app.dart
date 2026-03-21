import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home_page.dart';
import 'features/my_account/presentation/pages/my_account_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        MyAccountPage.path: (context) => MyAccountPage(),
      },
    );
  }
}
