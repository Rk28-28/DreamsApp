import 'package:flutter/material.dart';

class CloudButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;

  const CloudButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Container(
        height: 100,
        width: 190,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
            ],
        ),
          ),
        ),
      ),
    );
  }
}
