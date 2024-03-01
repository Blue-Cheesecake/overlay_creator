# OverlayCreator

A Flutter package designed to simplify the process of creating and managing overlay widgets in your Flutter applications. By providing a straightforward mixin that can be added to the state of a `StatefulWidget`, `overlay_creator` makes it easy to display custom overlay content, such as modal dialogs, tooltips, or any floating widget, on top of your app's UI without the need for complex navigation or state management.

## Features

- Easy integration with existing Flutter projects.
- Simplifies the creation and dismissal of overlay widgets.
- Supports custom widgets as overlay content, allowing for highly customizable overlays.
- Provides callback options for further control over the overlay's lifecycle.

## Quick Start

To use `overlay_creator`, follow these steps:

1. **Mixin with Your StatefulWidget's State**

Add `OverlayCreator` mixin to the state of your `StatefulWidget`.

```dart
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with OverlayCreator {
  // Your widget's build method and other functionalities
}
```

2. **Display an Overlay**

Use the `displayOverlay` method to show your overlay widget.

```dart
ElevatedButton(
    onPressed: () {
      displayOverlay(
        context: context,
        child: FullOverlayArea(
          background: const GlassBackgroundWD(),
          child: PopupContainerWD(
            removeOverlay: () {
              removeOverlay();
            },
          ),
        ),
      );
    },
    child: const Text("Show Glass Overlay"))
```

3. **Remove the Overlay**

Call `removeOverlay` when you need to dismiss the overlay.

## Full Example

Here's a simple example demonstrating how to use overlay_creator to display a custom overlay

```dart
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with OverlayCreator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Example",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  displayOverlay(
                    context: context,
                    child: FullOverlayArea(
                      background: const GlassBackgroundWD(),
                      child: PopupContainerWD(
                        removeOverlay: () {
                          removeOverlay();
                        },
                      ),
                    ),
                  );
                },
                child: const Text("Show Glass Overlay")),
          ],
        ),
      ),
    );
  }
}
```

## Additional Notes

- Ensure that the context passed to `displayOverlay` is from a widget that is a descendant of `MaterialApp` or `WidgetsApp` to properly find the overlay.