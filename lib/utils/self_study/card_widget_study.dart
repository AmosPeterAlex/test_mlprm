import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UniformCard(data: const [
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxyz",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxyz",
      "m",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxyz",
      "abcde\nfghijklm/nnwxyz",
      "abcd\nfefghij\nfklmno\nfpqestuvwxyz",
      "abcde\nfghijklm\nfnopqes\ntuvwxyz",
      "abcdvwxyz",
      "m",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxyz",
      "m",
      "m",
      "abjklm/nnopqestuvwxyz",
      "abcdefqestuvwxyz",
      "m",
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

  UniformCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final maxHeight = calculateMaxCardHeight(data);

    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: maxHeight+50,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Details for item ${index + 1}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
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
      style: TextStyle(fontSize: 16),
    );
    textPainter.layout(maxWidth: 600);
    maxHeight = max(maxHeight, textPainter.height);
  }

  return maxHeight;
}
