import 'package:flutter/material.dart';

class SettingsModalScreen {
  final Function(Color) onColorChanged;

  SettingsModalScreen({required this.onColorChanged});

  void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Settings",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Change Background Color',
                        style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCircleButton(
                            context, Colors.grey[200]!, 'Grey 200'),
                        _buildCircleButton(
                            context, Colors.grey[400]!, 'Grey 400'),
                        _buildCircleButton(
                            context, Colors.grey[600]!, 'Grey 600'),
                        _buildCircleButton(
                            context, Colors.grey[800]!, 'Grey 800'),
                        _buildCircleButton(
                            context, Colors.grey[900]!, 'Grey 900'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _buildCircleButton(BuildContext context, Color color, String label) {
    return ElevatedButton(
      onPressed: () {
        onColorChanged(color);
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color,
        minimumSize: const Size(50, 50),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 0),
      ),
    );
  }
}
