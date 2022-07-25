import 'dart:math';

Map<int, int> changeCalculator(
    {required int totalCost,
    required int fundsReceived,
    required Map<int, int> coinPool}) {
  Map<int, int> change = {};

  int changeLeft = fundsReceived - totalCost;

  coinPool.forEach((coinType, quantity) {
    // ~/ = integer division
    int coinQuantity = changeLeft ~/ coinType;
    if (changeLeft != 0 && coinQuantity > 0) {
      change[coinType] = min(coinQuantity, quantity);
      coinPool[coinType] = quantity - coinQuantity;
      changeLeft = changeLeft - (min(coinQuantity, quantity) * coinType);
    }
  });

  bool canReturnChange = changeLeft == 0;
  if (canReturnChange) {
    return change;
  } else {
    return {};
  }
}
