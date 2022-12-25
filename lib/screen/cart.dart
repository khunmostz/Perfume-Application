import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:list_animation/controller/cart.controller.dart';
import 'package:list_animation/models/perfume.model.dart';

class CartScreens extends StatefulWidget {
  const CartScreens({super.key});

  @override
  State<CartScreens> createState() => _CartScreensState();
}

class _CartScreensState extends State<CartScreens> {
  var _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.toNamed('/home'),
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text(
                        'You Cart',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Obx(() => Container(
                      width: size.width,
                      height: size.height * 0.7,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _cartController.products.length,
                        itemBuilder: (BuildContext context, index) {
                          return CartProductCard(
                            controller: _cartController,
                            product:
                                _cartController.products.keys.toList()[index],
                            quantity:
                                _cartController.products.values.toList()[index],
                            index: index,
                          );
                        },
                      ),
                    )),
                Container(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Obx(() => Text(
                                '\$ ${_cartController.total}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/payment',
                            arguments: [_cartController.total]),
                        child: Container(
                          width: size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade300,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Text(
                              'Payment',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Perfume product;
  final int quantity;
  final int index;
  const CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    var delay = index * 2;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(product.image),
              ),
            ),
          ),
          Container(
            width: size.width * 0.3,
            height: 150,
            // decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  NumberFormat.decimalPattern().format(product.price) + ' \$',
                ),
                // Text('data'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeItem(product);
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
