import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/style/style.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.colors,
    this.borderRadius,
    required this.onclick,
    this.text,
  }) : super(key: key);
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? colors;
  final VoidCallback onclick;
  final String? text;

  @override
  State<StatefulWidget> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool? isHover;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return MouseRegion(
      child: GestureDetector(
        onTap: widget.onclick,
        child: Container(
          width: widget.width ?? media.size.width,
          height: widget.height ?? Dimens.size40,
          decoration: BoxDecoration(
            color: (isHover == false
                ? (widget.colors ?? theme.colorScheme.primary)
                : (widget.colors ?? theme.colorScheme.primary)
                    .withOpacity(0.9)),
            borderRadius:
                BorderRadius.circular(widget.borderRadius ?? Dimens.size5),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text ?? tr('button'),
            style: theme.textTheme.button,
          ),
        ),
      ),
      onEnter: (event) => isHoverFunction(true),
      onExit: (event) => isHoverFunction(false),
    );
  }

  void isHoverFunction(bool status) => setState(() {
        // if ((widget.noHover ?? false) == true) {
        //   isHover = false;
        //   return;
        // }
        isHover = status;
      });
}
