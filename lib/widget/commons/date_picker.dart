import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../style/style.dart';

class CustomDatePicker extends StatefulWidget {
  final String title;
  final String? errorDescription;
  final DateFormat? format;
  final bool isShowTime;
  final TextAlign? textAlignment;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final DateTime? firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  final Locale? locale;
  final AutovalidateMode autovalidateMode;
  final Function(DateTime? value)? onChanged;
  final FormFieldValidator<DateTime>? validator;
  final bool isRequired;
  final bool isTitle;
  final Color colorField;
  final bool? isShowIcon;
  final Color? colorIcon;
  final Color? backgroundColor;
  final double borderRadius;
  final bool enabled;
  final bool showIcon;
  final bool isShowBorder;
  final IconData? iconData;
  final double? sizeIcon;
  final int? errorMaxLines;
  final String? hintText;
  final EdgeInsets? textPadding;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? borderFocusColor;

  const CustomDatePicker({
    Key? key,
    required this.firstDate,
    required this.lastDate,
    required this.title,
    this.errorDescription,
    this.onChanged,
    this.format,
    this.textAlignment,
    this.controller,
    this.textInputType,
    this.showIcon = true,
    this.isShowBorder = true,
    this.sizeIcon,
    this.errorMaxLines,
    this.initialDate,
    this.locale = const Locale('en', 'EN'),
    this.isShowTime = false,
    this.colorIcon ,
    this.validator,
    this.isRequired = false,
    this.isTitle = true,
    this.enabled = true,
    this.colorField = Colors.transparent,
    this.iconData,
    this.hintText,
    this.backgroundColor,
    this.borderColor,
    this.borderFocusColor,
    this.isShowIcon = true,
    this.borderRadius = Dimens.size12,
    this.textPadding = const EdgeInsets.symmetric(
      horizontal: Dimens.size10,
      vertical: Dimens.size18,
    ),
    this.textStyle,
    this.autovalidateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultFormat = DateFormat(
        widget.isShowTime ? DataFormat.ddMMyyyyHHmm : DataFormat.ddMMyyyy);

    return IgnorePointer(
      ignoring: !widget.enabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.title.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimens.size12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.isRequired)
                    Text(
                      Constants.redAsterisk,
                      style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: Dimens.size12,
                          fontWeight: FontWeight.w500),
                    ),
                  Text(widget.title, style: theme.textTheme.caption),
                ],
              ),
            ),
          ),
          DateTimeField(
            key: ValueKey(widget.initialDate ?? ''),
            maxLines: 1,
            scrollPadding: EdgeInsets.zero,
            onShowPicker: _onShowPicker,
            resetIcon: !widget.showIcon
                ? const Icon(Icons.close, color: Colors.transparent)
                : null,
            textAlign: widget.textAlignment ?? TextAlign.start,
            format: widget.format ?? defaultFormat,
            initialValue: widget.initialDate,
            autovalidateMode: widget.autovalidateMode,
            validator: widget.validator,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            style: widget.textStyle ??
                theme.textTheme.bodyText1!
                    .copyWith(color: theme.colorScheme.onSecondary),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: theme.textTheme.bodyText1,
              contentPadding: widget.textPadding ??
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              isDense: true,
              errorText: widget.errorDescription,
              errorMaxLines: widget.errorMaxLines,
              errorStyle: theme.primaryTextTheme.headline4,
              filled: true,
              fillColor: !widget.enabled
                  ? Colors.transparent
                  : widget.backgroundColor ?? Colors.transparent,
              border: _inputBorder(Colors.transparent),
              enabledBorder: _inputBorder(
                  widget.borderColor ?? theme.colorScheme.onSecondary),
              focusedBorder:
                  _inputBorder(widget.borderFocusColor ?? theme.colorScheme.surface),
              suffixIconConstraints: const BoxConstraints(
                minHeight: Dimens.size16,
                maxHeight: Dimens.size32,
                minWidth: Dimens.size16,
                maxWidth: Dimens.size32,
              ),
              suffixIcon: widget.showIcon
                  ? Container(
                      width:widget.sizeIcon?? Dimens.size20,
                      height: widget.sizeIcon?? Dimens.size20,
                      margin: const EdgeInsets.only(right: Dimens.size10),
                      child: widget.isShowIcon == true
                          ? Icon(
                              widget.iconData ?? Icons.calendar_today_outlined,
                              color: widget.colorIcon ?? theme.colorScheme.onSecondary,
                              size: widget.sizeIcon?? Dimens.size20,
                            )
                          : const SizedBox(),
                    )
                  : null,
              errorBorder: _inputBorder(theme.errorColor),
              focusedErrorBorder: _inputBorder(theme.errorColor),
              disabledBorder: _inputBorder(theme.colorScheme.surface),
            ),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _onShowPicker(
      BuildContext context, DateTime? currentValue) async {
    var lastDate = widget.lastDate;
    currentValue ??= DateTime.now();
    // ignore: unnecessary_null_comparison
    if (lastDate == null) {
      lastDate = currentValue;
    } else {
      if (currentValue.compareTo(lastDate) == 1) {
        currentValue = lastDate;
      }
    }
    if (widget.firstDate != null) {
      currentValue = currentValue.isBefore(widget.firstDate!)
          ? widget.firstDate!
          : currentValue;
    }
    var date = await showDatePicker(
      context: context,
      builder: (context, child) => Localizations.override(
          context: context,
          locale: widget.locale,
          child: Theme(data: ThemeData.light(), child: child ?? Container())),
      firstDate: widget.firstDate ?? DateTime.now(),
      initialDate: currentValue,
      helpText: '',
      errorInvalidText: tr('date_invalid_value'),
      errorFormatText: tr('date_invalid_format'),
      fieldHintText: tr('date_format'),
      lastDate: lastDate,
    );

    try {
      if (widget.isShowTime && date != null) {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(date),
        );
        date = DateTimeField.combine(date, time);
      }
      // ignore: empty_catches
    } catch (error) {}
    return date;
  }

  InputBorder _inputBorder(Color color) => OutlineInputBorder(
        borderSide: widget.isShowBorder
            ? BorderSide(color: color, width: Dimens.size2)
            : BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius),
          topRight: Radius.circular(widget.borderRadius),
          bottomLeft: Radius.circular(widget.borderRadius),
          bottomRight: Radius.circular(widget.borderRadius),
        ),
      );
}
