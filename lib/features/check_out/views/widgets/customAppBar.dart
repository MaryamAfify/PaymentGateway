import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utilies/styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  // Add BuildContext as a parameter
  return AppBar(
    leading: Center(
      child: InkWell(
        onTap: () {
          Navigator.pop(context); // Use the passed context
        },
        child: SvgPicture.asset('assets/images/arrow_back.svg'),
      ),
    ),
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: Styles.style25,
    ),
  );
}
