class AccountData {
  final String name;
  final String id;
  final int age;
  final String accountNumber;
  final double currentBalance;
  final String cardNumber;
  final String address;
  final String? phoneNumber;

  const AccountData({
    required this.name,
    required this.id,
    required this.age,
    required this.accountNumber,
    required this.currentBalance,
    required this.cardNumber,
    required this.address,
    this.phoneNumber,
  });
}
