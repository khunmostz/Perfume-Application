import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:list_animation/controller/home.controller.dart';
import 'package:list_animation/models/perfume.model.dart';
import 'package:list_animation/widget/check.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _homeController = Get.put(HomeController());

  late AnimationController controller;
  late Animation<double> animation;
  final scrollController = ScrollController(initialScrollOffset: 50.0);
  double _currentScroll = 0.0;

  List categories = ['All', 'Gucci', 'Dior', 'Prada', 'Versace', 'Chanel'];
  int selected = 0;

  void onScrollListner() {
    // print(scrollController.offset);
    setState(() {
      _currentScroll = scrollController.offset;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(onScrollListner);

    controller =
        AnimationController(duration: Duration(seconds: 6), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 200.0).animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(onScrollListner);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 217, 188, 199),
                Color.fromARGB(255, 75, 16, 101),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 240,
                child: Transform.translate(
                  offset: Offset(animation.value - 1, animation.value),
                  child: BlurryContainer.square(
                    blur: 5,
                    elevation: 1,
                    color: Color.fromARGB(144, 120, 43, 154),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Color.fromARGB(144, 120, 43, 154).withOpacity(0.3),
                      ),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    // dimension: 200,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 0,
                child: Transform.translate(
                  offset: Offset(animation.value - 1, animation.value - 20),
                  child: BlurryContainer.square(
                    blur: 10,
                    elevation: 6,
                    color: Color.fromARGB(144, 120, 43, 154),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Color.fromARGB(144, 120, 43, 154).withOpacity(0.5),
                      ),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    dimension: 200,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideInLeft(
                            duration: const Duration(milliseconds: 360),
                            child: Text(
                              "Perfume App",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SlideInUp(
                            duration: const Duration(milliseconds: 400),
                            child: GestureDetector(
                              onTap: () {
                                print('test');
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      actions: [
                                        GetBuilder<HomeController>(
                                            builder: (context) {
                                          return Container(
                                            width: 300,
                                            height: 300,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Condition',
                                                    style: TextStyle(
                                                      fontSize: 36,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_1,
                                                    onChanged: (value) {
                                                      _homeController.onCheck(
                                                          value as bool);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Title 1',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      'Condition 1',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_1,
                                                    onChanged: (value) {
                                                      _homeController.onCheck(
                                                          value as bool);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Title 1',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      'Condition 1',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_1,
                                                    onChanged: (value) {
                                                      _homeController.onCheck(
                                                          value as bool);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Title 1',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      'Condition 1',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_1,
                                                    onChanged: (value) {
                                                      _homeController.onCheck(
                                                          value as bool);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Title 1',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      'Condition 1',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_1,
                                                    onChanged: (value) {
                                                      _homeController.onCheck(
                                                          value as bool);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Title 1',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                      'Condition 1',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade900,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 255, 162, 155)
                                          .withOpacity(0.4),
                                      blurRadius: 10,
                                      spreadRadius: 10,
                                      offset: Offset(3, 2),
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      ZoomIn(
                        duration: const Duration(milliseconds: 420),
                        child: Divider(
                          height: 10,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 3,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInRight(
                        child: TextFormField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Icon(
                              Icons.search,
                              size: 26,
                              color: Colors.purple.shade900,
                            ),
                            suffixIconColor: Colors.purple.shade900,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.purple,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.purple,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            focusColor: Colors.purple,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 150,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: categories.length,
                                    itemBuilder: (context, index) {
                                      var value = categories[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1.0),
                                        child: Transform.rotate(
                                          angle: pi * 1.5,
                                          child: GestureDetector(
                                            onTap: (() {
                                              setState(() {
                                                selected = index;
                                              });
                                            }),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Container(
                                                margin: EdgeInsets.all(20.0),
                                                width: 80,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  // color: selected == index
                                                  //     ? Colors.purple.shade900
                                                  //     : Colors.purple.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: selected == index
                                                        ? [
                                                            Color.fromARGB(255,
                                                                51, 12, 100),
                                                            Colors.pink,
                                                          ]
                                                        : [
                                                            Colors.purple
                                                                .shade100,
                                                            Color.fromARGB(255,
                                                                75, 16, 101),
                                                          ],
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${value}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 32,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              ZoomIn(
                                child: Container(
                                  width: 2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 650,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ListWheelScrollView.useDelegate(
                              // controller: scrollController,
                              itemExtent: 300,
                              // useMagnifier: true,
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: Product.length,
                                builder: (context, index) {
                                  var perfume = Product[index];
                                  return TweenAnimationBuilder<double>(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                    tween: Tween(begin: 1.0, end: 0.0),
                                    builder: (context, value, _) {
                                      var result = 100 * value;
                                      // print(value);
                                      return Transform.translate(
                                        offset: Offset(result, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                // border:
                                                //     Border.all(color: Colors.red),
                                                ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  child: Container(
                                                    width: 350,
                                                    height: 300,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            Color.fromARGB(
                                                              255,
                                                              81,
                                                              116,
                                                              255,
                                                            ),
                                                            Colors.black,
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                300),
                                                        topRight:
                                                            Radius.circular(30),
                                                        bottomRight:
                                                            Radius.circular(30),
                                                        bottomLeft:
                                                            Radius.circular(30),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .pink.shade600
                                                              .withOpacity(0.3),
                                                          blurRadius: 10,
                                                          spreadRadius: 10,
                                                          offset: Offset(3, 5),
                                                        )
                                                      ],
                                                    ),
                                                    child: Row(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment
                                                      //         .spaceBetween,
                                                      children: [
                                                        ZoomIn(
                                                          child: Container(
                                                            width: 120,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                              color: Colors.red,
                                                            )),
                                                            child:
                                                                Transform.scale(
                                                              scale: 1.9,
                                                              child:
                                                                  Image.asset(
                                                                '${perfume.image}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Transform.rotate(
                                                          angle: pi * 1.5,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .red)),
                                                            child: Text(
                                                              perfume.title,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  // left: 0,
                                                  right: 10,
                                                  child: Container(
                                                    width: 120,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 149, 59, 246),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(12),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                              255,
                                                              81,
                                                              116,
                                                              255,
                                                            ).withOpacity(0.3),
                                                            blurRadius: 10,
                                                            spreadRadius: 10,
                                                            offset:
                                                                Offset(3, 5),
                                                          ),
                                                        ]),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          perfume.price
                                                                  .toString() +
                                                              ' ฿',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
