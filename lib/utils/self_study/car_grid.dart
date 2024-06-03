import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: GridCard(data: const [
      "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
      "m",
      "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
      "m",
      "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
      "m",
      "abcde\nfghijklmnopqes\ntuvwxyz"
    ]),
  ));
}

class GridCard extends StatelessWidget {
  final List<String> data;

  GridCard({required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * .04;
    final maxHeight = calculateMaxCardHeight(data, fontSize);

    return Scaffold(
      body: GridView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: maxHeight,
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      maxRadius: size.width * .07,
                      minRadius: size.width * .02,
                      child: Text("$index",style: TextStyle(fontSize: size.width * .06),),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: maxHeight,
        ),
      ),
    );
  }
}

double calculateMaxCardHeight(List<String> data, fontSize) {
  double maxHeight = 0;
  final textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  for (var item in data) {
    textPainter.text = TextSpan(
      text: item,
      style: TextStyle(fontSize: fontSize),
    );
    textPainter.layout(maxWidth: 300);
    maxHeight = max(maxHeight, textPainter.height);
  }

  return maxHeight + fontSize * 3;
}


/*
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridCard(data: const [
      "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
      "m",
      "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
      "m",
      "abcde\nfghijklmnopqes\ntuvwxyz"
    ]),
  ));
}

class GridCard extends StatelessWidget {
  final List<String> data;

  GridCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final maxHeight = calculateMaxCardHeight(data);
    var size = MediaQuery.of(context).size;
    var fontSize = size.width;

    return Scaffold(
      body: GridView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: maxHeight,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    child: Text("$index"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                data[index],
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: maxHeight,
        ),
      ),
    );
  }
}

double calculateMaxCardHeight(List<String> data) {
  // Initialize a variable to keep track of the maximum height required
  double maxHeight = 0;

  // Create a TextPainter to measure text dimensions
  final textPainter = TextPainter(
    textDirection: TextDirection.ltr, // Set text direction to left-to-right
  );

  // Iterate over each string item in the data list
  for (var item in data) {
    // Set the text and style for the TextPainter
    textPainter.text = TextSpan(
      text: item,
      style: TextStyle(fontSize: 24), // Set the font size to 24
    );

    // Layout the text with a maximum width of 1000
    // This simulates how the text would be laid out in a real scenario
    textPainter.layout(maxWidth: 1000);

    // Update the maxHeight if the current item's height is greater than the previous maxHeight
    maxHeight = max(maxHeight, textPainter.height);
  }

  // Return the maximum height found
  return maxHeight;
}

*/