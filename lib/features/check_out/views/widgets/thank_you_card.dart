import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/core/utilies/styles.dart';
import 'package:payment/features/check_out/views/widgets/card_info.dart';
import 'package:payment/features/check_out/views/widgets/payment_info.dart';
import 'package:payment/features/check_out/views/widgets/total_price_item.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
          child: Column(
            children: [
              const Text(
                "Thank You",
                style: Styles.style25,
              ),
              Text(
                "Your transaction was successful",
                textAlign: TextAlign.center,
                style: Styles.style20,
              ),
              const SizedBox(
                height: 42,
              ),
              const PaymentInfo(
                title: "Date",
                value: "01/24/2023",
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentInfo(
                title: "Time",
                value: '10:15 AM',
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentInfo(
                title: "To",
                value: 'Sam Louis',
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 60,
              ),
              const TotalPrice(title: "Total", value: r"53.87$"),
              const SizedBox(
                height: 30,
              ),
              const CardInfo(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/barCode.svg'),
                  Container(
                    // width: 113,
                    // height: 58,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1.50, color: Color(0xFF34A853)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child: Text(
                      "PAID",
                      style: Styles.style24
                          .copyWith(color: const Color(0xFF34A853)),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .2 + 20 / 2),
            ],
          )),
    );
  }
}
