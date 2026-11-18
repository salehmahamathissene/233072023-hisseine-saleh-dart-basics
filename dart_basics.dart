
 // Student: Saleh Mahamat Hisseine
 // Reg no: 23307/2023
 const String regNo = '233072023';
 final int d = int.parse(regNo[regNo.length - 1]);
 final int t = int.parse(regNo.substring(regNo.length - 2));

 void main() {
   // by SMH
   print('Reg no: $regNo | D = $d | T = $t');
 }
