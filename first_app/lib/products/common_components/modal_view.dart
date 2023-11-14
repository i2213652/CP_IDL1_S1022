import 'package:flutter/material.dart';

class ModalView extends StatelessWidget {
  final Widget formWidget;

  const ModalView({super.key, required this.formWidget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: formWidget,
    );
  }
}
