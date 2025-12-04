
void setup() {
  for (int i = 2; i<100; i++) {
    if (Primtal(i)) {
      println(i);
    }
  }
}

void draw() {
}

boolean Primtal(int n) {
  if (n<2) return false;
  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}
