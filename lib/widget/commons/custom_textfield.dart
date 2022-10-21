import 'package:flutter/material.dart';

import '../../style/style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, this.isTypePassword = true, this.hintText, this.onChange})
      : super(key: key);
  final bool? isTypePassword;
  final String? hintText;
  final ValueChanged<String>? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = true;
  bool _isHover = false;



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onChanged: widget.onChange,
      obscureText: widget.isTypePassword == true ? _isShowPassword : false,
      style: theme.textTheme.headline5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimens.size12,
          ),
          borderSide: const BorderSide(color: Colors.grey, width: 1)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary)),
        hintStyle: theme.textTheme.headline5!
            .copyWith(color: theme.colorScheme.onBackground),
        hintText: widget.hintText,
        suffixIcon: widget.isTypePassword == true
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isShowPassword = !_isShowPassword;
                  });
                },
                child:  Icon(
                  Icons.remove_red_eye,
                  color: _isShowPassword == false? theme.colorScheme.primary: theme.colorScheme.primary.withOpacity(0.3),
                ),
              )
            : null,
      ),
    );
  }
  void _functionChangeStatusIcon(bool status){
      setState((){
        _isHover  = status;
      });

  }
}
