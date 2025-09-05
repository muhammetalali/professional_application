import 'package:flutter/material.dart';

class BodyAuthComponent extends StatelessWidget {
  const BodyAuthComponent({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(24), child: body),
    );
  }
}
