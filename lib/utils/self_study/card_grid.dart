import 'dart:math';
import 'package:flutter/material.dart';

var dataList = [
  "ab1111111111111\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwnijkl\nmn\nopq\nfestuv\nfwxyzabc",
  "mnijkl\nmn\nopq\nfestuv\nfw",
  "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
  "m",
  "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
  "m33333333333333333333333333333333333333311abc",
  "ab4444444444nijkl\nmn\nopq\nfestuv\nwgh\nijklmnopq\nfestuv\nfwxpppppabc",
  "mabc",
  "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyzabc",
  "m",
  "mnijkl\nmn\nopq\nfestuv\nfw",
  "ab\nfcdefgh\nijklmnopq\nfestuv\nfp",
  "m",
  "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
  "m333333333333333333333333333333333333333333333333333311abc",
  "ab4444444444nijkl\nmn\nopq\nfestuv\nfwgh\nijklmnopq\nfestuv\nfwxpppppabc",
  "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
  "m",
  "mnijkl\nmn\nopq\nfestuv\nfw",
  "ab\nfcdefgh\nijklmnopq\nfestuv\nfwxppppp",
  "m",
  "ab\nfcdefgh\nijkl\nmn\nopq\nfestuv\nfwxyz",
  "m3333333333333333333333333333333333333333333333333333333333311abc",
  "ab4444444444nijkl\nmn\nopq\nfestuv\nfwgh\nijklmnopq\nfestuv\nfwxpppppabc",
  "abcde\nfghijklmnopqes\ntuvwxyz"
];
void main() {
  runApp(MaterialApp(
    home: GridCard(data: dataList),
    debugShowCheckedModeBanner: false,
  ));
}

class GridCard extends StatelessWidget {
  final List<String> data;

  const GridCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var fontSize = size.width * .04;
    final maxHeight = calculateMaxCardHeight(data, fontSize, size);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                height: maxHeight,
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        maxRadius: size.width * .07,
                        minRadius: size.width * .02,
                        child: Text(
                          "$index",
                          style: TextStyle(fontSize: size.width * .06),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          data[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: fontSize),
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
      ),
    );
  }
}

double calculateMaxCardHeight(List<String> data, fontSize, size) {
  double maxHeight = 0;
  double availableWidth = (size.width / 2) - 30;
  final textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  for (var item in data) {
    textPainter.text = TextSpan(
      text: item,
      style: TextStyle(fontSize: fontSize + 4),
    );
    textPainter.layout(maxWidth: availableWidth);
    maxHeight = max(maxHeight, textPainter.height);
  }

  // return maxHeight ;
  return maxHeight + fontSize * 4;
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
