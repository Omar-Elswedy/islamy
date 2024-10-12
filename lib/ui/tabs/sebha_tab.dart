import 'package:flutter/material.dart';

import '../../common/app_images.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int clickCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotate() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset(
            AppImages.sebhaHeaderIcn,
            height: MediaQuery.of(context).size.height * .25,
          ),
        ),
        Text('Number of tasbehat'),
        MaterialButton(
          onPressed: () {
            setState(() {
              _rotate();
            });
          },
          child: Text('Click'),
        )
      ],
    );
  }
}
