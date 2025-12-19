import 'package:flutter/material.dart';

class InteractiveAnimationPage extends StatefulWidget {
  const InteractiveAnimationPage({super.key});

  @override
  State<InteractiveAnimationPage> createState() =>
      _InteractiveAnimationPageState();
}

class _InteractiveAnimationPageState extends State<InteractiveAnimationPage> {
  double boxSize = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tekan dan tahan kotak untuk melihat animasi interaktif',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  boxSize = 160;
                });
              },
              onTapUp: (_) {
                setState(() {
                  boxSize = 120;
                });
              },
              onTapCancel: () {
                setState(() {
                  boxSize = 120;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                curve: Curves.easeOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
