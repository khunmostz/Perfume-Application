import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  bool conditionCheck_1 = false;
  bool conditionCheck_2 = false;
  bool conditionCheck_3 = false;
  bool conditionCheck_4 = false;
  bool conditionCheck_5 = false;

  onCheck(bool value) {
    conditionCheck_1 = value;
    update();
  }
}
