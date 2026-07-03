import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class BlushScaffold extends StatelessWidget {
  final Widget child;
  final bool resizeToAvoidBottomInset;
  const BlushScaffold(
      {super.key, required this.child, this.resizeToAvoidBottomInset = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(bottom: false, child: child),
      ),
    );
  }
}
