import 'dart:ui' as ui;

import 'package:workiom/export.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, required this.child, this.height = 51, this.color});

  final Widget child;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Row(children: [Expanded(child: child)]),
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: height + 15,
                width: double.infinity,
                alignment: .center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r), color: color),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [AspectRatio(aspectRatio: 1, child: CircularProgressIndicator())],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}