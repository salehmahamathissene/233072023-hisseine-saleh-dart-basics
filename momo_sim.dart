
 // Student: Saleh Mahamat Hisseine
 // Reg no: 23307/2023
 const String regNo = '233072023';
 final int d = int.parse(regNo[regNo.length - 1]);
 final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by SMH
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by SMH
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';

  while (digits.length > 3) {
    result = ',${digits.substring(digits.length - 3)}$result';
    digits = digits.substring(0, digits.length - 3);
  }

  result = digits + result;

  if (negative) {
    result = '-$result';
  }

  return '$result RWF';
}

bool isValidPin(String pin) {
  // by SMH
  if (!RegExp(r'^\d{5}$').hasMatch(pin)) {
    return false;
  }

  if (pin == '12345') {
    return false;
  }

  if (pin == '00000' ||
      pin == '11111' ||
      pin == '22222' ||
      pin == '33333' ||
      pin == '44444' ||
      pin == '55555' ||
      pin == '66666' ||
      pin == '77777' ||
      pin == '88888' ||
      pin == '99999') {
    return false;
  }

  return true;
}

int sendMoney(int balance, int amount) {
  // by SMH
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by SMH
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime purchased: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

void main() {
  // by SMH
  print('Reg no: 23307/2023 | D = $d | T = $t');

  print('PIN 12345: ${isValidPin('12345')}');
  print('PIN 77777: ${isValidPin('77777')}');
  print('PIN 4821: ${isValidPin('4821')}');
  print('PIN 48a21: ${isValidPin('48a21')}');
  print('PIN 48213: ${isValidPin('48213')}');

  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;

  int i = 1;
  while (i <= 3) {
    balance = sendMoney(balance, sendAmount);
    i++;
  }

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Additional formatRwf tests:
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF

  // Additional isValidPin tests:
  print(isValidPin('54321')); // Expected: true
  print(isValidPin('12345')); // Expected: false
  print(isValidPin('99999')); // Expected: false
  print(isValidPin('12a45')); // Expected: false
  print(isValidPin('123456')); // Expected: false
}
