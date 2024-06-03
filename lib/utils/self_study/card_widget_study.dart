import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: UniformCard(data: [
      // "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxyz",
      "m",
      "m",
      // "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "abcdvwxyz",
      "m",
      // "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      // "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxyz",
      "m",
      "m",
      "abjklm/nnopqestuvwxyz",
      "abcdefqestuvwxyz",
      // "m",
      // "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      "abcd\ntuvwxyz",
      "abcdefgh\nijklmstuvwxyz",
      "m",
      "m",
      "abcde\nfghijklmnopqes\ntuvwxyz"
    ]),
  ));
}

class UniformCard extends StatelessWidget {
  final List<String> data;

  const UniformCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxHeight = calculateMaxCardHeight(data);

    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: maxHeight,
              // padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text("$index"),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index],
                        style: const TextStyle(
                          // fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 5),

                      // Text(
                      //   'Details for item ${index + 1}',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

double calculateMaxCardHeight(List<String> data) {
  double maxHeight = 0;
  final textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  for (var item in data) {
    textPainter.text = TextSpan(
      text: item,
      style: const TextStyle(fontSize: 16),
    );
    textPainter.layout(maxWidth: 600);
    maxHeight = max(maxHeight, textPainter.height);
  }

  return maxHeight+10;
}
