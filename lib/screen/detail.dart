import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.5,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade900,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: ()=>{
                          Get.back()
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                      Text(
                        'Perfume',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.shopping_bag,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.4,
            decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80))),
          ),
        ],
      ),
    ));
  }
}
