import 'dart:math';

class CalcularIMC {
  num imc(num a, num p) {
    double r = 0;
    r = a / p;
    return pow(r, 2);
  }
}
