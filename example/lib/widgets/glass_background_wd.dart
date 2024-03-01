import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBackgroundWD extends StatelessWidget {
  const GlassBackgroundWD({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
      child: Container(color: Colors.white.withOpacity(0.0)),
    );
  }
}
