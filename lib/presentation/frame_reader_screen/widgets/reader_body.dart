import 'package:flutter/material.dart';

Widget buildBody({
  required List<String> pages,
  required PageController pageController,
  required double fontSize,
  required int currentPage,
}) {
  return Stack(
    children: <Widget>[
      PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              pages[index],
              style: TextStyle(fontSize: fontSize),
            ),
          );
        },
      ),
      Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Center(
          child: Text(
            '${currentPage + 1}/${pages.length}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
    ],
  );
}
