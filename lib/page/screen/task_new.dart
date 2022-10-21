import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/model.dart';
import '../../style/style.dart';
import '../../widget/commons/border_text_input.dart';
import '../../widget/commons/custom_button.dart';
import '../../widget/commons/date_picker.dart';

class TaskNew extends StatefulWidget {
  TaskNew({Key? key, this.task}) : super(key: key);
  final Task? task;

  @override
  State<TaskNew> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskNew> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Container(
        height: size.height * 0.8,
        padding: const EdgeInsets.all(Dimens.size16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Dimens.size32),
            topLeft: Radius.circular(Dimens.size32),
          ),
          color: theme.colorScheme.primary,
        ),
        child: Column(
          children: [
            Image.asset(
              Constants.icon_retangge,
              color: theme.colorScheme.onSecondary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.size16,
              ),
              child: BorderTextFieldInput(
                hintText: 'title',
                initText: widget.task?.title??'',
                isShowBorder: true,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: BorderTextFieldInput(
                hintText: 'Description',
                initText: widget.task?.description??'',
                isShowBorder: true,
                keyboardType: TextInputType.multiline,
                maxLines: Dimens.num10,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            CustomDatePicker(
              title: '',
              initialDate: widget.task?.created_time??DateTime.now(),
              lastDate: DateTime(2200),
              firstDate: DateTime.now(),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            CustomDatePicker(
              title: '',
              lastDate: DateTime(2200),
              enabled: false,
              iconData: Icons.image_outlined,
              firstDate: DateTime.now(),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            CustomButton(
              onclick: () {},
              text: 'Add to do',
              colors: theme.colorScheme.onSecondary,
              borderRadius: Dimens.size10,
            ),
          ],
        ),
      ),
    );
  }
}
