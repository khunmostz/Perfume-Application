import 'package:get/get.dart';
import 'package:list_animation/models/perfume.model.dart';
import 'package:list_animation/services/firestore.db.dart';

class ProductController extends GetxController {
  // Add a list of product obj
  final perfume = <Perfume>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    perfume.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
