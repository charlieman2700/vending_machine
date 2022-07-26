import 'dart:math';

class MoneyManager {
  final Map<int, int> _coinPool;

  MoneyManager(this._coinPool);

  MoneyManager.withDefaultCoinPool()
      : _coinPool = {
          500: 20,
          100: 30,
          50: 50,
          25: 25,
        };

  int calculateChangeAmount(int totalCost, int moneyEntered) =>
      totalCost - moneyEntered;

  Map<int, int> calculateCoinsForChange(int changeAmount) {
    Map<int, int> change = {};
    int changeLeft = changeAmount;
    bool canReturnChange = false;

    _coinPool.forEach((coinType, quantity) {
      // ~/ = integer division
      int coinQuantity = changeLeft ~/ coinType;

      if (changeLeft != 0 && coinQuantity > 0) {
        change[coinType] = min(coinQuantity, quantity);
        _coinPool[coinType] = quantity - coinQuantity;
        changeLeft = changeLeft - (min(coinQuantity, quantity) * coinType);
      }
    });

    canReturnChange = changeLeft == 0;

    if (canReturnChange) {
      return change;
    } else {
      return {};
    }
  }
}
