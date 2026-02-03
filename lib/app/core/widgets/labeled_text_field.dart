import 'package:flutter/cupertino.dart';
import 'package:workiom/export.dart';

class LabeledTextField extends StatefulWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    this.hint = '',
    required this.controller,
    this.isPassword = false,
    this.isNumber = false,
    this.textAlign = TextAlign.start,
    this.isCentered = false,
    this.textDirection,
    this.primaryColor,
    this.textNextToLabel,
    this.validator,
    this.keyboardType,
    this.svgSize,
    this.suffixIcon,
    this.maxLength = 40,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.textColor,
    this.bgColor,
    this.onFieldSubmitted,
    this.prefix,
    this.readOnly = false,
    this.colorOfEye,
  });

  final Widget? prefix;
  final bool isPassword;
  final bool isNumber;
  final String label;
  final String hint;
  final double? svgSize;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool isCentered;
  final TextEditingController controller;
  final Color? primaryColor;
  final Widget? suffixIcon;
  final String? textNextToLabel;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLength;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Color? textColor;
  final Color? bgColor;
  final bool readOnly;
  final Color? colorOfEye;

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.titleMedium),

        Row(
          crossAxisAlignment: .center,
          children: [
            if (widget.prefix != null) ...[widget.prefix!, 10.horizontalSpace],
            Expanded(
              child: TextFormField(
                textAlignVertical: widget.isPassword
                    ? TextAlignVertical.center
                    : TextAlignVertical.top,
                controller: widget.controller,
                cursorColor: TColors.primary,
                focusNode: widget.focusNode,
                textInputAction: widget.textInputAction,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onFieldSubmitted: (value) {
                  if (widget.textInputAction == TextInputAction.next) {
                    FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  }
                  widget.onFieldSubmitted?.call(value);
                },
                maxLength: widget.maxLength,
                textAlign: widget.isCentered ? TextAlign.center : widget.textAlign,
                textDirection: widget.textDirection,
                validator: widget.validator,
                keyboardType:
                    widget.keyboardType ?? (widget.isNumber ? TextInputType.number : null),
                readOnly: widget.readOnly,
                inputFormatters: [
                  if (widget.isNumber) FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  filled: false,
                  hintTextDirection: widget.textDirection,
                  hintText: widget.hint,
                  counterText: '',
                  suffix:
                      widget.suffixIcon ??
                      (widget.isPassword
                          ? IconButton(
                              onPressed: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              icon: Icon(
                                !isVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                                color: widget.colorOfEye,
                              ),
                            )
                          : SizedBox.shrink()),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  //.copyWith(top: widget.isPassword || widget.prefix != null ? 0 : 15.h),
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: TColors.redColor,
                    fontSize: 12.sp,
                    height: 0,
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TColors.redColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TColors.primary),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TColors.greyColor),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TColors.redColor),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TColors.greyColor),
                  ),
                ),
                obscureText: widget.isPassword && !isVisible,
                style: TextStyle(letterSpacing: 1.15, fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}