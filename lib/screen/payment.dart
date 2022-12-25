import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_animation/controller/cart.controller.dart';
import 'dart:math' as math;

import 'package:list_animation/helper/omise.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _cartController = Get.find<CartController>();
    var size = Get.size;
    // var price = Get.arguments[0];
    // print('price from cart: ' + price.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvv,
                bankName: 'Axis Bank',
                showBackSide: showBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                // mask: getCardTypeMask(cardType: CardType.americanExpress),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: cardNumberCtrl,
                      decoration: InputDecoration(hintText: 'Card Number'),
                      maxLength: 16,
                      onChanged: (value) {
                        final newCardNumber = value.trim();
                        var newStr = '';
                        final step = 4;

                        for (var i = 0; i < newCardNumber.length; i += step) {
                          newStr += newCardNumber.substring(
                              i, math.min(i + step, newCardNumber.length));
                          if (i + step < newCardNumber.length) newStr += ' ';
                        }

                        setState(() {
                          cardNumber = newStr;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: expiryFieldCtrl,
                      decoration: InputDecoration(hintText: 'Card Expiry'),
                      maxLength: 5,
                      onChanged: (value) {
                        var newDateValue = value.trim();
                        final isPressingBackspace =
                            expiryDate.length > newDateValue.length;
                        final containsSlash = newDateValue.contains('/');

                        if (newDateValue.length >= 2 &&
                            !containsSlash &&
                            !isPressingBackspace) {
                          newDateValue = newDateValue.substring(0, 2) +
                              '/' +
                              newDateValue.substring(2);
                        }
                        setState(() {
                          expiryFieldCtrl.text = newDateValue;
                          expiryFieldCtrl.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: newDateValue.length));
                          expiryDate = newDateValue;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Card Holder Name'),
                      onChanged: (value) {
                        setState(() {
                          cardHolderName = value.toUpperCase();
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'CVV'),
                      maxLength: 3,
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                      focusNode: _focusNode,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // print(expiryDate.split('/')[0]);
                      print(cardHolderName);
                      print(cardNumberCtrl.text.trim());
                      print(expiryDate.split('/')[0]);
                      print(expiryDate.split('/')[1]);
                      print(cvv);
                      print(_cartController.total);

                      var charge = Omise(
                          cardName: cardHolderName,
                          cardNumber: cardNumberCtrl.text.trim(),
                          expMonth: expiryDate.split('/')[0],
                          expYear: expiryDate.split('/')[1],
                          security: cvv,
                          price: _cartController.total);

                      await charge.getToken();
                      await charge.cardCharge();
                      // Get.toNamed('/home');
                      if (charge.status == 'successful') {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Payment Successful',
                          onConfirmBtnTap: () => Get.toNamed('/home'),
                        );
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Someting has been error',
                          onConfirmBtnTap: () => Get.toNamed('/home'),
                        );
                      }
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      width: size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
