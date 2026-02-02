import 'package:workiom/export.dart';

class CustomButton extends StatefulWidget {
  final String? title;
  final String? svg;
  final double? radius;
  final double? svgSize;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final Color? textColor;
  final Color? svgColor;
  final Color? borderColor;
  final bool isColorsToggled;
  final bool withBorder;
  final void Function()? onTap;
  final bool isLoading;
  final bool withEnter;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    this.color = TColors.primary,
    this.svgColor,
    this.title,
    this.onTap,
    this.isColorsToggled = false,
    this.borderColor,
    this.withBorder = false,
    this.svg,
    this.radius,
    this.isLoading = false,
    this.withEnter = false,
    this.svgSize,
    this.padding,
    this.textColor,
    this.fontSize,
    this.height = 50,
    this.width,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double height = 52;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
        if (!mounted) return;
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: WrapperWidget(
        condition: widget.isLoading,
        widget: (child) => CustomLoadingWidget(height: height, child: child),
        fallBack: (child) => child,
        child: MeasureSizeBuilder(
          builder: (context, size) {
            height = size.height;
            return GestureDetector(
              onTap: widget.onTap,
              child: Container(
                padding: widget.padding ?? EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius ?? 18.r),
                  color: widget.color,
                  border: widget.withBorder && !widget.isColorsToggled
                      ? Border.all(color: widget.borderColor ?? Theme.of(context).dividerColor)
                      : null,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: .center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.svg != null) ...[
                            SizedBox(
                              width: widget.svgSize ?? 20.h,
                              height: widget.svgSize ?? 20.h,
                              child: CustomSvg(widget.svg!, color: widget.svgColor),
                            ),
                            if (widget.title != null) 8.horizontalSpace,
                          ],
                          if (widget.title != null)
                            Flexible(
                              child: Text(
                                widget.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: widget.textColor ?? TColors.whiteColor,
                                  fontSize: widget.fontSize ?? 18.sp,
                                  fontWeight: .w500,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (widget.withEnter) ...[
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SizedBox(
                          width: 30.h,
                          height: 40.h,
                          child: CustomSvg(Assets.icons.enter),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}