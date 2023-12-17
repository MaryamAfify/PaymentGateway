import 'package:flutter/material.dart';
import 'package:payment/features/check_out/views/widgets/customAppBar.dart';
import 'package:payment/features/check_out/views/widgets/custom_check_Icon.dart';
import 'package:payment/features/check_out/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,title: ''),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ThankYouCard(),
            // Positioned(
            //   left:20+8,
            //   right: 20+8,
            //    bottom: MediaQuery.sizeOf(context).height * .2+20,
            //   child: const DashedLine(),
            // ),
            Positioned(
                left: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            Positioned(
                right: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            const CustomCheckIcon()
          ],
        ),
      ),
    );
  }
}




