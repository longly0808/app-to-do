import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/model/service/api/task.dart';
import 'package:to_do_list/style/style.dart';
import 'package:to_do_list/widget/widget.dart';


class TaskDetail extends StatefulWidget {
  const TaskDetail({Key? key,required this.task }) : super(key: key);
  final Task task;


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
      body: SafeArea(
        child: Container(
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
                hintText: _isUpdate == true ? 'title' : '',
                initText: widget.task.content ?? '',
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
                initText:widget.task.description??'',
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
      )
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
