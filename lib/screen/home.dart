import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int listSelected = 0;

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
                                                      _homeController
                                                              .conditionCheck_1 =
                                                          value as bool;
                                                      _homeController.onCheck(
                                                          value as bool,
                                                          _homeController
                                                              .conditionCheck_1);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Descending',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_2,
                                                    onChanged: (value) {
                                                      _homeController
                                                              .conditionCheck_2 =
                                                          value as bool;
                                                      _homeController.onCheck(
                                                          value as bool,
                                                          _homeController
                                                              .conditionCheck_2);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Ascending',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  CheckboxListTile(
                                                    value: _homeController
                                                        .conditionCheck_3,
                                                    onChanged: (value) {
                                                      _homeController
                                                              .conditionCheck_3 =
                                                          value as bool;
                                                      _homeController.onCheck(
                                                          value as bool,
                                                          _homeController
                                                              .conditionCheck_3);
                                                    },
                                                    activeColor:
                                                        Colors.purple.shade900,
                                                    title: Text(
                                                      'Range ${_homeController.minRange.toString()} - ${_homeController.maxRange.toString()} ฿',
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
                          ),
                          SlideInLeft(
                            child: GestureDetector(
                              onTap: () {
                                print('add');
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
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
                          controller: _homeController.searchController,
                          onChanged: ((value) {
                            _homeController.onSearch(value);
                          }),
                          textCapitalization: TextCapitalization.sentences,
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
                                      var delay = categories.length - index + 1;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1.0),
                                        child: Transform.rotate(
                                          angle: pi * 1.5,
                                          child: GestureDetector(
                                            onTap: (() {
                                              setState(() {
                                                _homeController.selectCategory =
                                                    index;
                                                _homeController.onCategories();
                                              });
                                            }),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Bounce(
                                                duration: Duration(
                                                    milliseconds:
                                                        1000 - delay * 30),
                                                child: Container(
                                                  margin: EdgeInsets.all(20.0),
                                                  width: 80,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: _homeController
                                                                  .selectCategory ==
                                                              index
                                                          ? [
                                                              Color.fromARGB(
                                                                  255,
                                                                  11,
                                                                  36,
                                                                  255),
                                                              Color.fromARGB(
                                                                  255,
                                                                  187,
                                                                  80,
                                                                  230),
                                                            ]
                                                          : [
                                                              Color.fromARGB(
                                                                  255,
                                                                  212,
                                                                  215,
                                                                  245),
                                                              Color.fromARGB(
                                                                  255,
                                                                  102,
                                                                  115,
                                                                  238),
                                                            ],
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${value}',
                                                      style: TextStyle(
                                                        color: _homeController
                                                                    .selectCategory ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
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
                            child: GestureDetector(
                              onTap: (() {
                                print(listSelected);
                                Get.offNamed(
                                  '/detail',
                                  arguments: [],
                                );
                              }),
                              child: GetBuilder<HomeController>(
                                  builder: (context) {
                                return ListWheelScrollView.useDelegate(
                                  // controller: scrollController,
                                  itemExtent: 240,
                                  useMagnifier: false,
                                  physics: FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: ((value) {
                                    listSelected = value;
                                  }),
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: _homeController.search.length,
                                    builder: (context, index) {
                                      var perfume = Product[index];

                                      return TweenAnimationBuilder<double>(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.linear,
                                        tween: Tween(begin: 1.0, end: 0.0),
                                        builder: (context, value, _) {
                                          var result = 100 * value;
                                          return Transform.translate(
                                            offset: Offset(result, 0.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Container(
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(
                                                    right: 10),
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
                                                        margin: const EdgeInsets
                                                            .only(bottom: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                Color.fromARGB(
                                                                    255,
                                                                    11,
                                                                    36,
                                                                    255),
                                                                Color.fromARGB(
                                                                    255,
                                                                    187,
                                                                    80,
                                                                    230),
                                                              ]),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    300),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    30),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          118,
                                                                          0,
                                                                          253)
                                                                  .withOpacity(
                                                                      0.3),
                                                              blurRadius: 1,
                                                              spreadRadius: 2,
                                                              offset:
                                                                  Offset(3, 5),
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
                                                                decoration: BoxDecoration(
                                                                    // border: Border.all(
                                                                    //     color: Colors
                                                                    //         .red),
                                                                    ),
                                                                child: Transform
                                                                    .scale(
                                                                  scale: 1.2,
                                                                  child: Image
                                                                      .asset(
                                                                    '${_homeController.search[index].image}',
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
                                                                    // border: Border.all(
                                                                    //     color: Colors
                                                                    //         .red),
                                                                    ),
                                                                child: Text(
                                                                  _homeController
                                                                      .search[
                                                                          index]
                                                                      .title,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
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
                                                      right: 10,
                                                      child: Container(
                                                        width: 120,
                                                        height: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .topLeft,
                                                                  end: Alignment
                                                                      .bottomRight,
                                                                  colors: [
                                                                    Color.fromARGB(
                                                                        255,
                                                                        212,
                                                                        215,
                                                                        245),
                                                                    Color.fromARGB(
                                                                        255,
                                                                        102,
                                                                        115,
                                                                        238),
                                                                  ],
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          12),
                                                                ),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            118,
                                                                            0,
                                                                            253)
                                                                    .withOpacity(
                                                                        0.3),
                                                                blurRadius: 2,
                                                                spreadRadius: 2,
                                                                offset: Offset(
                                                                    3, 5),
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
                                                              _homeController
                                                                      .search[
                                                                          index]
                                                                      .price
                                                                      .toString() +
                                                                  ' ฿',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
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
                                );
                              }),
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
