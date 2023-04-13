import 'package:flutter/material.dart';

class MoonButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;

  const MoonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imageAsset,
  }) : super(key: key);

  @override
  _MoonButtonState createState() => _MoonButtonState();
}

class _MoonButtonState extends State<MoonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed as void Function()?,
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imageAsset),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}