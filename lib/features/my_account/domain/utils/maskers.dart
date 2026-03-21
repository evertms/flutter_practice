String _maskKeepingEdges(String value, {int keepStart = 0, int keepEnd = 0}) {
  if (value.length <= keepStart + keepEnd) {
    return value;
  }

  final start = value.substring(0, keepStart);
  final end = value.substring(value.length - keepEnd);
  final hidden = '*' * (value.length - keepStart - keepEnd);

  return '$start$hidden$end';
}

String maskId(String id) {
  return _maskKeepingEdges(id, keepStart: 2, keepEnd: 2);
}

String maskAccountNumber(String accountNumber) {
  return _maskKeepingEdges(accountNumber, keepEnd: 4);
}

String maskCardNumber(String cardNumber) {
  return _maskKeepingEdges(cardNumber, keepEnd: 4);
}

String maskPhoneNumber(String phoneNumber) {
  return _maskKeepingEdges(phoneNumber, keepStart: 4, keepEnd: 2);
}

String maskAddress(String address) {
  final buffer = StringBuffer();

  for (final char in address.split('')) {
    if (RegExp(r'[0-9]').hasMatch(char)) {
      buffer.write('*');
    } else {
      buffer.write(char);
    }
  }

  return buffer.toString();
}
