import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/common.dart';
import 'package:to_do_list/model/service/api/task.dart';
import 'package:to_do_list/model/view/update_task_model.dart';
import 'package:to_do_list/style/style.dart';
import 'package:to_do_list/utility/utility.dart';
import 'package:to_do_list/widget/base_cubit_stateful_widget.dart';
import 'package:to_do_list/widget/widget.dart';

class TaskDetail extends BaseCubitStatefulWidget {
  const TaskDetail({Key? key, required this.task}) : super(key: key);
  final TaskModel task;


  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState
    extends BaseCubitStateFulWidgetState<UpdateTaskBloc, TaskDetail> {
    TaskModel _taskModel = TaskModel();
   @override
  void initState() {
    bloc.initData(widget.task);
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<UpdateTaskBloc, BaseState>(
        listener: (BuildContext context, state) {
          if (state is UpdateTaskSuccess) {
            ToastUtility.showSuccess(message: 'Update Success');
            Navigator.pop(context, true);
          } else if (state is LoadedState && state.errorMessage != null) {
            ToastUtility.showError([state.errorMessage ?? '']);
          }
        },
        builder: (BuildContext context, Object? state) {
          if (state is LoadedState) {
            UpdateTaskModel model = state.model;
            return Scaffold(
              resizeToAvoidBottomInset: false,
                body: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(Dimens.size16),
                width: size.width,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _rowIconHeader(theme, model),
                    const SizedBox(
                      height: Dimens.size16,
                    ),
                    BorderTextFieldInput(
                      enabled: model.isUpdate,
                      colorEnableBorder: theme.primaryColorDark,
                      focusBorderColor: theme.primaryColorDark,
                      cursorColor: theme.primaryColorDark,
                      hintText: model.isUpdate == true ? tr('title') : '',
                      initText: _taskModel.content??(model.taskModel.content??''),
                      colorHint: theme.primaryColorDark.withOpacity(0.5),
                      onChanged: (value) {
                        _taskModel.content = value ??'';
                      },
                      isShowBorder: true,
                      textStyle: theme.textTheme.headline4!
                          .copyWith(color: theme.primaryColorDark),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    Visibility(
                      visible: model.isUpdate,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: Dimens.size4),
                        child: Divider(
                          color: theme.primaryColorDark,
                          endIndent: Dimens.size16,
                          indent: Dimens.size16,
                        ),
                      ),
                    ),
                    BorderTextFieldInput(
                      enabled: model.isUpdate,
                      colorEnableBorder: theme.primaryColorDark,
                      focusBorderColor: theme.primaryColorDark,
                      cursorColor: theme.primaryColorDark,
                      hintText: model.isUpdate ? 'description' : '',
                      colorHint: theme.primaryColorDark.withOpacity(0.5),
                      initText: _taskModel.description??(model.taskModel.description??''),
                      onChanged: (value) {
                        _taskModel.description = value??'';
                      },
                      isShowBorder: true,
                      textStyle: theme.textTheme.bodyText1!
                          .copyWith(color: theme.primaryColorDark),
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                      textInputAction: TextInputAction.newline,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    Visibility(
                      visible: model.isUpdate,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: Dimens.size4),
                        child: Divider(
                          color: theme.primaryColorDark,
                          endIndent: Dimens.size16,
                          indent: Dimens.size16,
                        ),
                      ),
                    ),
                    Visibility(
                        visible: model.isUpdate,
                        child: CustomButton(
                          onclick: () {

                            bloc.updateTaskState(_taskModel);
                          },
                          textColors: theme.primaryColorDark,
                          colorBorder: theme.primaryColorDark,
                          colors: theme.colorScheme.onSecondary,
                          borderRadius: Dimens.size16,
                          text: tr('update'),
                        )),
                  ],
                ),
              ),
            ));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _rowIconHeader(ThemeData theme, UpdateTaskModel model) {
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
            bloc.showUpdate(!model.isUpdate);
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

  void openModalBottomSheet(ThemeData theme) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.size16),
                  child: CustomButton(
                    onclick: () {},
                    text: tr('delete_button'),
                    colors: theme.colorScheme.onSecondary,
                    textColors: theme.colorScheme.error,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.size16, vertical: Dimens.size16),
                  child: CustomButton(
                      onclick: () {
                        Navigator.pop(context);
                      },
                      text: tr('cancel_button'),
                      colors: theme.colorScheme.onSecondary,
                      textColors: MyColors.greenColor),
                ),
              ],
            ),
          );
        });
  }
}
