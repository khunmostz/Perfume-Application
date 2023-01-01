import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_animation/controller/product.controller.dart';
import 'package:list_animation/models/perfume.model.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var _productController = Get.find<ProductController>();
  List<Perfume> search = [];

  int selectCategory = 0;

  var minRange = 2000;
  var maxRange = 5000;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //  _productController.perfume.forEach((element) => search.add(element));
    search = _productController.perfume;
    print(search);
  }

  bool conditionCheck_1 = false;
  bool conditionCheck_2 = false;
  bool conditionCheck_3 = false;
  bool conditionCheck_4 = false;
  bool conditionCheck_5 = false;

  File? image;
  String? pathImageStore;

  onCheck(bool value, bool check) {
    check = value;

    if (conditionCheck_1 == true) {
      search.sort((b, a) => a.price.compareTo(b.price));
      update();
    }
    //  else {
    //   search.clear();
    //   _productController.perfume.forEach((element) => search.add(element));
    //   update();
    // }
    if (conditionCheck_2 == true) {
      search.sort((a, b) => a.price.compareTo(b.price));
      update();
    }
    if (conditionCheck_3 == true) {
      search = search
          .where((element) =>
              element.price >= minRange && element.price <= maxRange)
          .toList();
      update();
    }
    update();
  }

  onCategories() {
    switch (selectCategory) {
      case 0:
        {
          search = _productController.perfume;
          print(search[0].category);
        }
        break;
      case 1:
        {
          search = _productController.perfume
              .where((element) =>
                  (element.title as String).toLowerCase().contains('gucci'))
              .toList();

          search.forEach(((element) => {print(element.title)}));
          update();
        }
        break;
      case 2:
        {
          search = _productController.perfume
              .where((element) =>
                  (element.title as String).toLowerCase().contains('dior'))
              .toList();
          update();
        }
        break;
      case 3:
        {
          search = _productController.perfume
              .where((element) =>
                  (element.title as String).toLowerCase().contains('prada'))
              .toList();
          update();
        }
        break;
      case 4:
        {
          search = _productController.perfume
              .where((element) =>
                  (element.title as String).toLowerCase().contains('versace'))
              .toList();
          update();
        }
        break;
      case 5:
        {
          search = _productController.perfume
              .where((element) =>
                  (element.title as String).toLowerCase().contains('chanel'))
              .toList();
          update();
        }
        break;
      default:
    }
  }

  onSearch(String keyword) {
    search = _productController.perfume
        .where((element) => (element.title as String)
            .toLowerCase()
            .contains(keyword.toLowerCase()))
        .toList();
    update();
  }

  Future<void> chooseImage({required ImageSource imageSource}) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? _pickedImage = await _picker.pickImage(
        source: imageSource,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );
      if (_pickedImage != null) {
        final Rx<File> _imagePath = File(_pickedImage.path).obs;
        image = _imagePath.value;
      }
      // print(image);
      update();
      _uploadProduct(image!.path.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> _uploadProduct(String imagePath) async {
    print(imagePath);
    var firebaseRef = await FirebaseStorage.instance
        .ref()
        .child('product-upload/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(image!);
    var taskSnapshot =
        await uploadTask.whenComplete(() async {}).then((value) async {
      print('upload profile success');
      // Get.snackbar('แจ้งเตือน', 'เปลี่ยนรูปภาพสำเร็จ');
      var imageUrl = await value.ref.getDownloadURL();
      // print(imageUrl.toString());

      pathImageStore = imageUrl;
      print('url : ${pathImageStore.toString()}');
    });
  }

  Future<void> addProduct(
      {required String title,
      required String category,
      required int price,
      required String image}) async {
    try {
      _firebaseFirestore.collection('products').add({
        'title': title,
        'category': category,
        'price': price,
        'image': image,
      }).then((value) {
        Get.snackbar('Notification 🔔', 'Upload Product Success');
        titleController.clear();
        categoryController.clear();
        priceController.clear();
        this.image == null;
      });
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
