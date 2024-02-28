import 'package:flutter/material.dart';

class FullOverlayArea extends StatelessWidget {
  const FullOverlayArea({
    this.background,
    this.child,
    super.key,
  });

  final Widget? background;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: background,
              ),
              if (child != null) Align(alignment: Alignment.center, child: child!),
            ],
          ),
        );
      }),
    );
  }
}
