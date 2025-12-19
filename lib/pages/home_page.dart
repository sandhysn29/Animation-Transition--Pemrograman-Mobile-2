import 'package:flutter/material.dart';
import '../animations/implicit_animation_page.dart';
import '../animations/explicit_animation_page.dart';
import '../animations/interractive_animation_page.dart';
import '../transitions/custom_page_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation & Transition'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(page: const ImplicitAnimationPage()),
                    );
                  },
                  child: const Text('Implicit Animation'),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(page: const ExplicitAnimationPage()),
                    );
                  },
                  child: const Text('Explicit Animation'),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(page: const InteractiveAnimationPage()),
                    );
                  },
                  child: const Text('Interactive Animation'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
