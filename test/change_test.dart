import 'package:test/test.dart';
import 'package:vending_machine/models/money_manager.dart';

void main() {
  group('Change Calculator', () {
    //Leaving this comment to test in the future with the with the DefaultCoinPool
    // MoneyManager withDefaultCoinPool = MoneyManager.withDefaultCoinPool();

    test('Enough Money but not enough coins', () {
      const changeAmount = 125;
      Map<int, int> change;

      Map<int, int> coinPool = {
        500: 3,
        100: 2,
        50: 0,
        25: 0,
      };
      var moneyManager = MoneyManager(coinPool);

      change = moneyManager.calculateCoinsForChange(changeAmount);
      expect(change, {});
    });

    test('Change 100 but no more coins', () {
      Map<int, int> coinPool = {
        500: 0,
        100: 0,
        50: 0,
        25: 0,
      };
      const changeAmount = 100;
      var moneyManager = MoneyManager(coinPool);

      Map<int, int> change;
      change = moneyManager.calculateCoinsForChange(changeAmount);
      expect(change, {});
    });

    test('Change 625 enough coins', () {
      Map<int, int> coinPool = {
        500: 1,
        100: 8,
        50: 1,
        25: 1,
      };
      const changeAmount = 625;
      var moneyManager = MoneyManager(coinPool);

      Map<int, int> change;
      change = moneyManager.calculateCoinsForChange(changeAmount);
      expect(change, {500: 1, 100: 1, 25: 1});
    });

    test('Enough Coins Use All Coins:  825 ', () {
      Map<int, int> coinPool = {
        500: 1,
        100: 1,
        50: 3,
        25: 4,
      };
      const changeAmount = 850;
      var moneyManager = MoneyManager(coinPool);

      Map<int, int> change;
      change = moneyManager.calculateCoinsForChange(changeAmount);
      expect(change, {500: 1, 100: 1, 50: 3, 25: 4});
    });
  });
}
