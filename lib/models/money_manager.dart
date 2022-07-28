import 'dart:collection';
import 'dart:math';

class MoneyManager {
  Map<int, int> _coinPool;

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

  void addCoins(int coinType, int quantity) {
    if (_coinPool[coinType] != null) {
      _coinPool[coinType] = _coinPool[coinType]! + quantity;
    } else {
      _coinPool[coinType] = quantity;
      _coinPool = SplayTreeMap<int, int>.from(
          _coinPool, (key1, key2) => key2.compareTo(key1));
    }
  }

  bool substractCoins(int coinType, int quantity) {
    if (_coinPool[coinType] != null && quantity <= _coinPool[coinType]!) {
      _coinPool[coinType] = _coinPool[coinType]! - quantity;
      return true;
    }
    return false;
  }

  bool canReturnChange(int changeAmount) {
    Map<int, int> change = {};
    Map<int, int> copyOfPool = _coinPool;
    int changeLeft = changeAmount;
    bool canReturnChange = false;

    copyOfPool.forEach((coinType, quantity) {
      // ' ~/ '   = integer division
      int coinQuantity = changeLeft ~/ coinType;

      if (changeLeft != 0 && coinQuantity > 0) {
        change[coinType] = min(coinQuantity, quantity);
        copyOfPool[coinType] = quantity - coinQuantity;
        changeLeft = changeLeft - (min(coinQuantity, quantity) * coinType);
      }
    });

    canReturnChange = changeLeft == 0;

    if (canReturnChange) {
      return true;
    } else {
      return false;
    }
  }

  Map<int, int> calculateCoinsForChange(int changeAmount) {
    Map<int, int> change = {};
    int changeLeft = changeAmount;
    bool canReturnChange = false;

    _coinPool.forEach((coinType, quantity) {
      // ' ~/ '   = integer division
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

  bool isEnoughToPay(int costAmount, int moneyReceived) {
    bool isEnough = false;
    moneyReceived >= costAmount ? isEnough = true : isEnough = false;
    return isEnough;
  }

  //Setters and Getters
  Map<int, int> getCoinPool() => _coinPool;
  void setCoinPool(Map<int, int> newCoinPool) => _coinPool = _coinPool;
}
