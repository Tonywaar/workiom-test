import 'package:workiom/export.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg(this.child, {super.key, this.width, this.height, this.fit, this.color});

  final String child;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      child,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}