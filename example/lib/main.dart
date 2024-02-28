import 'package:flutter/material.dart';
import 'package:overlay_creator/overlay_creator.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const Main());
}

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
