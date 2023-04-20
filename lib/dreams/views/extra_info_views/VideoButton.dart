import 'package:flutter/material.dart';

class VideoButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;

  const VideoButton({
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
        width: 170,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(35, 25, 55, 50), width: 5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color.fromRGBO(35, 25, 55, 50),
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

class VideoButton1 extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;

  const VideoButton1({
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
        height: 90,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(35, 25, 55, 50), width: 5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color.fromRGBO(35, 25, 55, 50),
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

class VideoButton2 extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;

  const VideoButton2({
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
        height: 80,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(35, 25, 55, 50), width: 5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color.fromRGBO(35, 25, 55, 50),
                    fontSize: 14,
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
