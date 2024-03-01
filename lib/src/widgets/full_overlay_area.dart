import 'package:flutter/material.dart';

/// A widget that creates a full-screen overlay area, optionally with a background and a central child widget.
///
/// This widget is designed to be used in conjunction with [OverlayCreator] to display full-screen overlays
/// with ease. It uses a [Scaffold] with a transparent background, allowing the overlay to cover the entire
/// screen, including above the app bar and other UI elements.
///
/// The [FullOverlayArea] can display an optional [background] widget that fills the screen, and an optional
/// [child] widget that is centered within the screen. This setup is ideal for creating dimmed background effects
/// with a prominent central widget, such as a dialog or a custom popup.
///
class FullOverlayArea extends StatelessWidget {
  const FullOverlayArea({
    this.background,
    this.child,
    super.key,
  });

  /// The widget to display as the background of the overlay. This widget will fill the entire screen.
  final Widget? background;

  /// The widget to display centered in the overlay. This is typically the main content of the overlay.
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
