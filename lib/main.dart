import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: GridView.builder(
        itemCount: 89,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Text('data');
        },
      ),
    ),
  );
}
