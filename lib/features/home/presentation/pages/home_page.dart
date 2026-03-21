import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_ext.dart';
import '../../../my_account/presentation/pages/my_account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double balance = 0.0;
  String chars = '*******';
  bool showBalance = true;
  bool isLoading = false;

  @override
  void initState() {
    balance = 21.00;
    super.initState();
  }

  Future<double> getBalance() async {
    await Future.delayed(const Duration(seconds: 2));
    return 23.50;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Banca'),
        shape: const Border(
          bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            SizedBox(height: 16, child: Container(color: Colors.red)),
            const Text(
              'Saldo:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Text('${showBalance ? balance : chars} Bs'),
            ElevatedButton(
              onPressed: () {
                showBalance = !showBalance;
                setState(() {});
              },
              child: Text('${showBalance ? 'Ocultar' : 'Mostrar'} saldo'),
            ),
            ElevatedButton(
              onPressed: () async {
                isLoading = true;
                setState(() {});
                final newBalance = await getBalance();
                balance = newBalance;
                isLoading = false;
                setState(() {});
              },
              child: const Text('Actualizar saldo'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(MyAccountPage.path);
              },
              child: const Text('Mi cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
