import 'package:flutter/material.dart';

class TextFieldSizeStudy extends StatefulWidget {
  const TextFieldSizeStudy({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldSizeStudyState createState() => _TextFieldSizeStudyState();
}

class _TextFieldSizeStudyState extends State<TextFieldSizeStudy> {
  final TextEditingController _controller = TextEditingController();
  double _textFieldHeight = 0.0;
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    _calculateTextFieldHeight();
    _controller.addListener(_calculateTextFieldHeight);
  }

  void _calculateTextFieldHeight() {
    final textSpan = TextSpan(
      text: _controller.text,
      style: const TextStyle(fontSize: 16.0),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: double.infinity);

    setState(() {
      _textFieldHeight = textPainter.size.height + 16; // Add padding
    });
  }

  void _showText() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: _textFieldHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _showText,
              child: const Text('Show Text'),
            ),
            const SizedBox(height: 20.0),
            if (_displayText.isNotEmpty)
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    _displayText,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TextFieldSizeStudy(),
  ));
}
