import '../../domain/models/account_data.dart';
import '../../domain/utils/maskers.dart';

class MyAccountViewModel {
  final AccountData _account;

  const MyAccountViewModel(this._account);

  String get holder => _account.name;
  String get carnet => maskId(_account.id);
  String get age => '${_account.age} años';
  String get account => maskAccountNumber(_account.accountNumber);
  String get balance => '${_account.currentBalance.toStringAsFixed(2)} Bs';
  String get cardNumber => maskCardNumber(_account.cardNumber);
  String get address => maskAddress(_account.address);

  String get phone {
    final phoneNumber = _account.phoneNumber;

    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'No se proporciono un numero de telefono';
    }

    return maskPhoneNumber(phoneNumber);
  }
}
