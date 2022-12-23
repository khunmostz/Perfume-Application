import 'package:get/get.dart';
import 'package:list_animation/models/perfume.model.dart';

class CartController extends GetxController {
  var cart = {}.obs;

  void addToCart(Perfume perfume) {
    if (cart.containsKey(perfume)) {
      cart[perfume] += 1;
    } else {
      cart[perfume] = 1;
    }

    Get.snackbar(
      'Product Added',
      'You have added the ${perfume.title} to the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeItem(Perfume perfume) {
    if (cart.containsKey(perfume) && cart.containsKey(perfume) == 1) {
      cart.removeWhere((key, value) => key == perfume);
    } else {
      cart[perfume] -= 1;
    }
  }

  get products => cart;

  get productSubtotals =>
      cart.entries.map((product) => product.key.price * product.value).toList();

  get total => cart.entries
      .map((value) => value.key.price * value.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
