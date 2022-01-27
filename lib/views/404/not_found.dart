import 'package:flutter/material.dart';

class NotFoud extends StatelessWidget {
  const NotFoud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('Oups not Found'),
      ),
    );
  }
}
