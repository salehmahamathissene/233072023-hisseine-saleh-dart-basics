
 // Student: Saleh Mahamat Hisseine
 // Reg no: 23307/2023
 const String regNo = '233072023';
 final int d = int.parse(regNo[regNo.length - 1]);
 final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by SMH
  int count = 0;
  String lower = text.toLowerCase();

  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
    i++;
  }

  return count;
}

String initials(String fullName) {
  // by SMH
  String trimmedName = fullName.trim();

  if (trimmedName.isEmpty) {
    return '';
  }

  List<String> names = trimmedName.split(RegExp(r'\s+'));
  String result = '';

  int i = 0;
  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

void drawTriangle(int height) {
  // by SMH
  int row = 1;

  while (row <= height) {
    String line = '';
    int spaces = height - row;

    while (spaces > 0) {
      line += ' ';
      spaces--;
    }

    int col = 1;
    while (col <= row) {
      line += row.isEven ? '#' : '*';
      col++;
    }

    print(line);
    row++;
  }
}

int momoFee(int amount) {
  // by SMH
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;

  return 1500;
}

String maskPhone(String phone) {
  // by SMH
  if (phone.length != 10) {
    return 'INVALID';
  }

  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  // by SMH
  print('Reg no: 23307/2023 | D = $d | T = $t');

  int vowelCount = countVowels('Saleh Mahamat Hisseine');
  print('Saleh Mahamat Hisseine has $vowelCount vowels');

  print(initials('Saleh Mahamat Hisseine'));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  int i = 1;
  int totalFees = 0;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}',
    );

    i++;
  }

  print('Total fees: $totalFees RWF');
}
