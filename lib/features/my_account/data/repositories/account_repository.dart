import '../../domain/models/account_data.dart';

class AccountRepository {
  Future<AccountData> fetchMyAccount() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const AccountData(
      name: 'Juan Perez',
      id: '12345678',
      age: 29,
      accountNumber: '4567891230123456',
      currentBalance: 23.50,
      cardNumber: '4111111111111111',
      address: 'Av. Las Americas 742, Santa Cruz',
      phoneNumber: '+59171234567',
    );
  }
}
