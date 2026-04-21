import 'package:flutter/material.dart';
import './home.page.dart';
import 'account.page.dart';
import 'profile.page.dart';

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
        UserProfilePage.path: (context) => UserProfilePage(
          nombre: 'Evert Moreno Serrate',
          cargo: 'Mobile developer',
          correo: 'e23@gmail.com',
          edad: 21,
        ),
      },
    );
  }
}
