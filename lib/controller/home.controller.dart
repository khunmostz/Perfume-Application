import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:list_animation/models/perfume.model.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Perfume> search = [];

  int selectCategory = 0;

  var minRange = 2000;
  var maxRange = 5000;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Product.forEach((element) => search.add(element));
  }

  bool conditionCheck_1 = false;
  bool conditionCheck_2 = false;
  bool conditionCheck_3 = false;
  bool conditionCheck_4 = false;
  bool conditionCheck_5 = false;

  onCheck(bool value, bool check) {
    check = value;

    if (conditionCheck_1 == true) {
      search.sort((b, a) => a.price.compareTo(b.price));
      update();
    }else{
      search.clear();
      Product.forEach((element) => search.add(element));
      update();
    }
    if (conditionCheck_2 == true) {
      search.sort((a, b) => a.price.compareTo(b.price));
      update();
    }
    if (conditionCheck_3 == true) {
      var test = 6750;
      search = search.where((element) => element.price >= minRange && element.price <= maxRange).toList();
      update();
    }
    update();
  }
  onCategories() {
    switch (selectCategory) {
      case 0:
        {
          print('asdasddsa');
        }
        break;
      case 1:
        {
          search = Product.where((element) =>
                  (element.title as String).toLowerCase().contains('gucci'))
              .toList();
          update();
        }
        break;
      case 2:
        {
          search = Product.where((element) =>
                  (element.title as String).toLowerCase().contains('dior'))
              .toList();
          update();
        }
        break;
      case 3:
        {
          search = Product.where((element) =>
                  (element.title as String).toLowerCase().contains('prada'))
              .toList();
          update();
        }
        break;
      case 4:
        {
          search = Product.where((element) =>
                  (element.title as String).toLowerCase().contains('versace'))
              .toList();
          update();
        }
        break;
      case 5:
        {
          search = Product.where((element) =>
                  (element.title as String).toLowerCase().contains('chanel'))
              .toList();
          update();
        }
        break;
      default:
    }
  }

  onSearch(String keyword) {
    search = Product.where((element) => (element.title as String)
        .toLowerCase()
        .contains(keyword.toLowerCase())).toList();
    update();
  }
}
