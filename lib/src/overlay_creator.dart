import 'package:flutter/material.dart';

mixin OverlayCreator {
  @mustCallSuper
  @protected
  OverlayEntry? overlayEntry;

  @protected
  void displayOverlay({required BuildContext context, required Widget child, VoidCallback? callback}) {
    assert(overlayEntry == null);
    overlayEntry = OverlayEntry(
      builder: (context) => child,
    );
    Overlay.of(context).insert(overlayEntry!);
    if (callback != null) callback();
  }

  @protected
  void removeOverlay({VoidCallback? callback}) {
    overlayEntry?.remove();
    overlayEntry = null;
    if (callback != null) callback();
  }
}
