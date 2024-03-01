import 'package:flutter/material.dart';

/// A mixin that simplifies the creation and management of [OverlayEntry] instances within Flutter applications.
///
/// By incorporating this mixin into your [State] of [StatefulWidget], you can easily create and display overlay widgets
/// on top of your app's UI. This is particularly useful for displaying floating widgets, such as tooltips,
/// dialogs, or custom overlays, without needing to navigate to a different page or alter the existing widget tree.
///
/// For example
/// ```dart
/// class Homepage extends StatefulWidget {
///   const Homepage({super.key});

///   @override
///   State<Homepage> createState() => _HomepageState();
/// }

/// class _HomepageState extends State<Homepage> with OverlayCreator {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         backgroundColor: Colors.blue,
///         title: const Text(
///           "Example",
///           style: TextStyle(color: Colors.white),
///         ),
///       ),
///       body: Center(
///         child: Column(
///           mainAxisSize: MainAxisSize.max,
///           mainAxisAlignment: MainAxisAlignment.center,
///           crossAxisAlignment: CrossAxisAlignment.center,
///           children: [
///             ElevatedButton(
///                 onPressed: () {
///                   displayOverlay(
///                     context: context,
///                     child: FullOverlayArea(
///                       background: const GlassBackgroundWD(),
///                       child: PopupContainerWD(
///                         removeOverlay: () {
///                           removeOverlay();
///                         },
///                       ),
///                     ),
///                   );
///                 },
///                 child: const Text("Show Glass Overlay")),
///           ],
///         ),
///       ),
///     );
///   }
/// }
/// ```
mixin OverlayCreator {
  /// The current overlay entry being displayed. This is `null` when no overlay is displayed.
  @mustCallSuper
  @protected
  OverlayEntry? overlayEntry;

  /// Displays an overlay on top of the current widget tree.
  ///
  /// This method creates an [OverlayEntry] with the provided [child] widget and inserts it into the
  /// overlay of the nearest [Overlay] widget up the widget tree from the [context].
  ///
  /// Note: Calling this method when an overlay is already displayed will assert in debug mode.
  @protected
  void displayOverlay({required BuildContext context, required Widget child, VoidCallback? callback}) {
    assert(overlayEntry == null);
    overlayEntry = OverlayEntry(
      builder: (context) => child,
    );
    Overlay.of(context).insert(overlayEntry!);
    if (callback != null) callback();
  }

  /// Removes the currently displayed overlay, if any.
  ///
  /// This method removes the [OverlayEntry] created by [displayOverlay] from the overlay and resets
  /// [overlayEntry] to `null`.
  @protected
  void removeOverlay({VoidCallback? callback}) {
    overlayEntry?.remove();
    overlayEntry = null;
    if (callback != null) callback();
  }
}
