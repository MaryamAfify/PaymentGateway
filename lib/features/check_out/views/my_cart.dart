import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/core/utilies/styles.dart';
import 'package:payment/features/check_out/views/widgets/my_cart_body.dart';

import 'widgets/customAppBar.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
