import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.textButton, required this.onTap, this.width});

  final String textButton;
  final Function onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: width ?? size.width / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Text(textButton,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        ));
  }
}
