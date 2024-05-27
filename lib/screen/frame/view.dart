import 'package:flutter/material.dart';
import 'package:test_nexteons/responsive_layout_builder.dart';
import 'package:test_nexteons/screen/frame/responsive/lap_frame.dart';
import 'package:test_nexteons/screen/frame/responsive/mobile_frame.dart';

import '../../utils/constants/size_functions.dart';

class FrameView extends StatefulWidget {
  // final Widget child;
  const FrameView({super.key});

  @override
  State<FrameView> createState() => _FrameViewState();
}

class _FrameViewState extends State<FrameView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
          appBar: fnCheckIphone(size.width) ? MobileFrame() : null,
          body: Column(
            children: [
              if (fnCheckIphone(size.width))
                // if (fnCheckIPad(size.width) && !fnCheckIphone(size.width))
                MobileFrame(
                    // controller: controller,
                    ),
              if (!fnCheckIphone(size.width))
                LapFrame(
                    // controller: controller,
                    ),
              // Expanded(child: widget.child)
            ],
          ));
    });
  }
}
