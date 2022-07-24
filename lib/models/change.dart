Map<int, int> changeCalculator(
    {required int totalCost,
    required int fundsReceived,
    required Map<int, int> coinPool}) {
  Map<int, int> change = {};
  int totalChange = fundsReceived - totalCost;

  coinPool.forEach((coinType, quantity) {
    int coinQuantity = (totalChange / coinType).toInt();

    if (coinQuantity != 0 && coinQuantity <= quantity) {
      change[coinType] = coinQuantity;
      totalChange = totalChange - (coinQuantity * coinType);
      coinPool[coinType] = quantity - coinQuantity;
    }
  });
  return change;
}
