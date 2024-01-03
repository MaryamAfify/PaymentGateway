import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utilies/styles.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/masterCard.svg'),
          const Column(
            children: [
              Text(
                "Credit Card",
                style: Styles.style18,
              ),
              Text("    Mastercard **78")
            ],
          )
        ],
      ),
    );
  }
}
