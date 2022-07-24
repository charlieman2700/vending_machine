import 'package:test/test.dart';
import 'package:vending_machine/models/change.dart';

void main() {
  group('Change Calculator', () {
    Map<int, int> defaultCoinPool = {
      500: 20,
      100: 30,
      50: 50,
      25: 25,
    };

    test('Enough Money but not enough coins', () {
      Map<int, int> coinPool = {
        500: 3,
        100: 2,
        50: 0,
        25: 0,
      };
      const totalCost = 0;
      const fundsReceived = 125;
      Map<int, int> change;
      change = changeCalculator(
          totalCost: totalCost,
          fundsReceived: fundsReceived,
          coinPool: coinPool);
      expect(change, {});
    });

    test('Change 100 but no more coins', () {
      Map<int, int> coinPool = {
        500: 0,
        100: 0,
        50: 0,
        25: 0,
      };
      const totalCost = 0;
      const fundsReceived = 100;
      Map<int, int> change;
      change = changeCalculator(
          totalCost: totalCost,
          fundsReceived: fundsReceived,
          coinPool: coinPool);
      expect(change, {});
    });

    test('Change 625 enough coins', () {
      Map<int, int> coinPool = {
        500: 1,
        100: 8,
        50: 1,
        25: 1,
      };
      const totalCost = 0;
      const fundsReceived = 625;
      Map<int, int> change;
      change = changeCalculator(
          totalCost: totalCost,
          fundsReceived: fundsReceived,
          coinPool: coinPool);
      expect(change, {500: 1, 100: 1, 25: 1});
    });

    test('Enough Coins Use All Coins:  825 ', () {
      Map<int, int> coinPool = {
        500: 1,
        100: 1,
        50: 3,
        25: 4,
      };
      const totalCost = 0;
      const fundsReceived = 850;
      Map<int, int> change;
      change = changeCalculator(
          totalCost: totalCost,
          fundsReceived: fundsReceived,
          coinPool: coinPool);
      expect(change, {500: 1, 100: 1, 50: 3, 25: 4});
    });
  });
}
