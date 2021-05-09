import 'package:muggles/screens/home.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final Function creditCardFlip;

  BillCard({this.creditCardFlip});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
          child: GestureDetector(
        onTap: creditCardFlip,
        child: CreditCard(
          // 30085421598
          cardNumber: "₹ 3725",
          cardExpiry: "10/11",
          cardHolderName: "Ishan Sharma",
          cvv: "PAID",
          bankName: "PSPCL Electricity",
          cardType: CardType.visa,
          showBackSide: isCardFlipped,
          frontBackground: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Color(primaryColor),
          ),
          backTextColor: Color(primaryColor),
          backBackground: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.white,
          ),
          showShadow: true,
        ),
      ),
    );
  }
}
