import 'package:flutter/material.dart';
// code ideas from: https://docs.flutter.dev/development/ui/animations/tutorial

class PlanetButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;
  final Duration delay;

  const PlanetButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.imageAsset,
    required this.delay,
  }) : super(key: key);

  @override
  _PlanetButtonState createState() => _PlanetButtonState();
}

class _PlanetButtonState extends State<PlanetButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _animation = Tween(begin: 1.0, end: 1.175).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(widget.delay, () {
      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed as void Function()?,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _animation.value,
            child: Container(
              height: 100,
              //width: 90,
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
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          //fontStyle: fonts.oswald
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}