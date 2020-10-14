import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/helpers/style.dart';

class CustomText extends StatelessWidget {
  //making final variables
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  //name constructor that has a positional parameters with the text req
  //and other parameter optional
  //  and initializing the final
  CustomText({@required this.text, this.size, this.color, this.weight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
