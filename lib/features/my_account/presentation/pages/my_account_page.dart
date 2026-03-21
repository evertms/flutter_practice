import 'package:flutter/material.dart';

import '../../data/repositories/account_repository.dart';
import '../viewmodels/my_account_viewmodel.dart';

class MyAccountPage extends StatefulWidget {
  static String path = '/account';

  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final AccountRepository _repository = AccountRepository();
  late final Future<MyAccountViewModel> _accountFuture;

  @override
  void initState() {
    super.initState();
    _accountFuture = _loadAccount();
  }

  Future<MyAccountViewModel> _loadAccount() async {
    final account = await _repository.fetchMyAccount();
    return MyAccountViewModel(account);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi cuenta')),
      body: FutureBuilder<MyAccountViewModel>(
        future: _accountFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('No se pudo cargar la informacion de la cuenta.'),
            );
          }

          final vm = snapshot.data;
          if (vm == null) {
            return const SizedBox.shrink();
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _AccountInfoTile(label: 'Titular', value: vm.holder),
              _AccountInfoTile(label: 'Carnet', value: vm.carnet),
              _AccountInfoTile(label: 'Edad', value: vm.age),
              _AccountInfoTile(label: 'Cuenta', value: vm.account),
              _AccountInfoTile(label: 'Saldo', value: vm.balance),
              _AccountInfoTile(
                label: 'Numero de Tarjeta',
                value: vm.cardNumber,
              ),
              _AccountInfoTile(label: 'Direccion', value: vm.address),
              _AccountInfoTile(label: 'Telefono', value: vm.phone),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Volver'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AccountInfoTile extends StatelessWidget {
  final String label;
  final String value;

  const _AccountInfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(label), subtitle: Text(value)),
    );
  }
}
