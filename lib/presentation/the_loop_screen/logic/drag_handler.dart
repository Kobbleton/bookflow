import 'dart:math';
import 'package:flutter/material.dart';

class DragHandler {
  int index = 0;
  double lastDragTimestamp = 0;
  double accelerationFactor = 1.2;
  Function(int)? updateIndex; // Callback function to update word index

  DragHandler({this.index = 0, this.updateIndex});

  void handle(DragUpdateDetails details) {
    double now = DateTime.now().millisecondsSinceEpoch.toDouble();
    double deltaTime = now - lastDragTimestamp;

    if (deltaTime == 0) return;

    double velocity = details.delta.dx / deltaTime;
    int deltaIndex = (velocity.abs() < 1)
        ? velocity.toInt()
        : (pow(velocity.abs(), accelerationFactor) * velocity.sign).toInt();

    int minDeltaIndex = 1; // Minimum index change when dragging slowly
    if (deltaIndex == 0 && velocity.abs() > 0.2) {
      // 0.2 is a threshold; adjust as needed
      deltaIndex = minDeltaIndex * velocity.sign.toInt();
    }

    updateIndex?.call(deltaIndex);
    lastDragTimestamp = now;
  }
}
