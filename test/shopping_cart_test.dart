import 'package:test/test.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/models/shopping_cart.dart';

void main() {
  group('Shopping Cart Tests:  ', () {
    List<Product> defaultProducts = [
      Product(id: '1', imageUrl: 'null', title: 'Coca Cola', price: 500),
      Product(id: '2', imageUrl: 'null', title: 'Pepsi', price: 600),
      Product(id: '3', imageUrl: 'null', title: 'Fanta', price: 550),
      Product(id: '4', imageUrl: 'null', title: 'Sprite', price: 725)
    ];

    test('Add Product testing quantity', () {
      ShoppingCart defaultShoppingCart =
          ShoppingCart.defaultValues(defaultProducts);
      defaultShoppingCart.addToCart('1');
      expect(defaultShoppingCart.getProductsInCart(), {'1': 1});
    });

    test('Decrease Product testing quantity', () {
      ShoppingCart defaultShoppingCart =
          ShoppingCart.defaultValues(defaultProducts);
      defaultShoppingCart.addToCart('4');
      defaultShoppingCart.addToCart('1');
      defaultShoppingCart.removeFromCart('1');
      expect(defaultShoppingCart.getProductsInCart(), {'4': 1});
    });

    test('Add Product testing total money Amount', () {
      ShoppingCart defaultShoppingCart =
          ShoppingCart.defaultValues(defaultProducts);
      defaultShoppingCart.addToCart('1');
      defaultShoppingCart.addToCart('1');
      defaultShoppingCart.addToCart('3');
      expect(defaultShoppingCart.getTotalPrice(), 1550);
    });

    test('Removing Product testing total money Amount', () {
      ShoppingCart defaultShoppingCart =
          ShoppingCart.defaultValues(defaultProducts);
      defaultShoppingCart.addToCart('1');
      defaultShoppingCart.addToCart('1');
      defaultShoppingCart.addToCart('3');
      defaultShoppingCart.removeFromCart('1');
      defaultShoppingCart.removeFromCart('3');
      expect(defaultShoppingCart.getTotalPrice(), 500);
    });
  });
}
