

int p = 17;
int q = 11;

int n = p * q;
int phi = (p-1) * (q-1);

int e = 7;
int d = 23;

String message = "Hej";
int[] encrypted = new int[message.length()]; //danner index til et hvert bogstav ved at bruge integer
char[] decrypted = new char[message.length()]; // danner et index for characters til at decryptere message ordenligt

void setup(){

  //danner encryption funktionen

  for (int i = 0; i < message.length(); i++) {
    int m = message.charAt(i);
    encrypted[i] = modPow(m, e, n);
  }

  //danner decryption funktionen

  for (int i = 0; i < encrypted.length; i++) {
    int m = modPow(encrypted[i], d, n);
    decrypted[i] = (char)m; //typecaster
  }
  println(message);
  
  print("Krypteret: ");
  for(int c : encrypted) print(c + " ");
  println();
  
  println("Dekrypteret: " + new String(decrypted));
}


int modPow(int base, int exp, int mod) {
  long result = 1;
  long b = base % mod;

  while (exp > 0) {
    if ((exp & 1)== 1) result = (result * b) % mod;
    b = (b * b) % mod;
    exp >>= 1;
  }
  return int(result);
}
