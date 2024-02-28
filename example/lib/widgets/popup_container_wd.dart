import 'package:flutter/material.dart';

class PopupContainerWD extends StatelessWidget {
  const PopupContainerWD({super.key, required this.removeOverlay});

  final VoidCallback removeOverlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Popup'),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                removeOverlay();
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
