import 'dart:math';

Map<int, int> changeCalculator(int totalCost, int fundsReceived) {
  Map<int, int> coinPool = {
    500: 20,
    100: 30,
    50: 50,
    25: 25,
  };
  Map<int, int> change = {};

  int residuo = 0;

  coinPool.forEach((coinType, quantity) {
    // TODO: Esto aun no sirve porque no tiene que ser exacto, ejemplo: 2225 % 500 no da 0 pero le podria dar 4 monedas de 500
    if (totalCost % coinType == 0) {
      residuo = min(quantity, totalCost ~/ coinType);
      change[coinType] = residuo;
      coinPool[coinType] = quantity - residuo;
    }
  });
  print(change);
  return change;
}
