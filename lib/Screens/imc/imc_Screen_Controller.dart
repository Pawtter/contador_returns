import 'dart:math';

class CalcularIMC {
  num imc(num a, num p) {
    double r = 0;
    a = pow(a, 2);
    return p / a;
  }
}
