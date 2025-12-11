

int p = 17; //første primtal
int q = 11; //anden primtal

int n = p * q; // produktet af begge primtal
int phi = (p-1) * (q-1); // eulers phi funktion, som checker om tallene

int e = 7;
int d = 23;

String message = "Hej med dig";
int[] encrypted = new int[message.length()]; //danner index til et hvert bogstav ved at bruge integer
char[] decrypted = new char[message.length()]; // danner et index for characters til at decryptere message ordenligt

void setup(){

  //danner encryption funktionen

  for (int i = 0; i < message.length(); i++) {
    int m = message.charAt(i);
    encrypted[i] = modPow(m, e, n); //anvender Modulær eksponentiering til at kryptere message = "Hej med dig"
  }

  //danner decryption funktionen

  for (int i = 0; i < encrypted.length; i++) {
    int m = modPow(encrypted[i], d, n); //dekryptere beskeden 
    decrypted[i] = (char)m; //typecaster til at få det tilbage til det oprindelige
  }
  println(message); //printer den originale besked
  
  print("Krypteret: "); //printer krypterede værdi ud
  for(int c : encrypted) print(c + " "); 
  println();
  
  println("Dekrypteret: " + new String(decrypted)); //printer dekrypteret besked ud
}


//Selve funktionen som danner grundlaget for programmet til at kryptere og dekryptere med store værdier
int modPow(int base, int exp, int mod) {
  long result = 1;
  long b = base % mod;

  while (exp > 0) {
    if ((exp & 1)== 1) result = (result * b) % mod;
    b = (b * b) % mod;
    exp >>= 1;
  }
  return int(result); //returner et integer resultat
}
