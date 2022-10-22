import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/style/style.dart';
import 'package:to_do_list/widget/commons/border_text_input.dart';
import 'package:to_do_list/widget/widget.dart';

import '../../model/service/task.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({Key? key, this.task}) : super(key: key);
  final Task? task;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool _isUpdate = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(Dimens.size16),
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _rowIconHeader(theme),
            const SizedBox(
              height: Dimens.size16,
            ),
            BorderTextFieldInput(
              enabled: _isUpdate,
              colorEnableBorder: theme.primaryColorDark,
              focusBorderColor: theme.primaryColorDark,
              cursorColor: theme.primaryColorDark,
              hintText: _isUpdate == true ? 'description' : '',
              initText: widget.task?.description ?? 'title',
              colorHint: theme.primaryColorDark.withOpacity(0.5),
              onChanged: (value) {},
              isShowBorder: true,
              textStyle: theme.textTheme.headline4!
                  .copyWith(color: theme.primaryColorDark),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Visibility(
              visible: _isUpdate,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.size4),
                child: Divider(
                  color: theme.primaryColorDark,
                  endIndent: Dimens.size16,
                  indent: Dimens.size16,
                ),
              ),
            ),
            BorderTextFieldInput(
              enabled: _isUpdate,
              colorEnableBorder: theme.primaryColorDark,
              focusBorderColor: theme.primaryColorDark,
              cursorColor: theme.primaryColorDark,
              hintText: _isUpdate ? 'description' : '',
              colorHint: theme.primaryColorDark.withOpacity(0.5),
              onChanged: (value) {},
              isShowBorder: true,
              initText:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
                  ". Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, wh"
                  "en an unknown printer took a galley of type and scrambled it to make a type specime"
                  "n book. It has survived not only five centuries, but also the leap into electronic t"
                  "ypesetting, remaining essentially unchanged. It was popularised in the 1960s with the re"
                  "lease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p"
                  "ublishing software like Aldus PageMaker including versions of Lorem Ipsum."
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
                  ". Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, wh"
                  "en an unknown printer took a galley of type and scrambled it to make a type specime"
                  "n book. It has survived not only five centuries, but also the leap into electronic t"
                  "ypesetting, remaining essentially unchanged. It was popularised in the 1960s with the re"
                  "lease of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p"
                  "ublishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              textStyle: theme.textTheme.bodyText1!
                  .copyWith(color: theme.primaryColorDark),
              keyboardType: TextInputType.multiline,
              maxLines: 20,
              textInputAction: TextInputAction.newline,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowIconHeader(ThemeData theme) {
    return Row(
      children: [
        GestureDetector(
          child: Image.asset(
            Constants.icon_back,
            height: Dimens.size25,
            color: theme.primaryColorDark,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        GestureDetector(
          child: Image.asset(
            Constants.icon_clock,
            height: Dimens.size25,
            color: theme.primaryColorDark,
          ),
          onTap: () {},
        ),
        const SizedBox(
          width: Dimens.size16,
        ),
        GestureDetector(
          child: Image.asset(
            Constants.icon_pen,
            height: Dimens.size25,
            color: theme.primaryColorDark,
          ),
          onTap: () {
            setState(() {
              _isUpdate = !_isUpdate;
            });
          },
        ),
        const SizedBox(
          width: Dimens.size16,
        ),
        GestureDetector(
          child: Image.asset(
            Constants.icon_bin,
            height: Dimens.size25,
            color: theme.primaryColorDark,
          ),
          onTap: () {
          openModalBottomSheet(theme);
          },
        ),
      ],
    );
  }

  void openModalBottomSheet(ThemeData theme){
    showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  Dimens.size16),
                  child: CustomButton(
                    onclick: () {},
                    text: tr('delete_button'),
                    colors: theme.colorScheme.onSecondary,
                    textColors: theme.colorScheme.error,
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: Dimens.size16,vertical: Dimens.size16),
                  child: CustomButton(
                      onclick: () {
                        Navigator.pop(context);
                      },
                      text: tr('cancel_button'),
                      colors: theme.colorScheme.onSecondary,
                      textColors: MyColors.greenColor),),
              ],
            ),
          );
        });
  }
}
