import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/dependencies.dart';
import 'package:to_do_list/utility/convert.dart';
import 'package:to_do_list/utility/toast_utils.dart';

import '../../constant.dart';
import '../../model/model.dart';
import '../../style/style.dart';
import '../../widget/commons/border_text_input.dart';
import '../../widget/commons/custom_button.dart';
import '../../widget/commons/date_picker.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);
  final String title;
  final String description;
  final DateTime date;

  @override
  State<CreateTaskScreen> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<CreateTaskScreen> {
  TaskModel taskModel = TaskModel(toDate: ConvertUtility.convertDatetimeToString(DateTime.now()));
  final GlobalKey<FormState> _formKey = GlobalKey();
  final bloc = AppDependencies.injector.get<CreateTaskBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<CreateTaskBloc, BaseState>(
        listener: (context, state) {
          if (state is LoadedState && state.errorMessage != null) {
            ToastUtility.showError([state.errorMessage ?? '']);
          }
          if (state is CreateTaskSuccess) {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
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
                      hintText: tr('title'),
                      initText: taskModel.content??'',
                      isShowBorder: true,
                      onChanged: (value) {
                        taskModel.content = value ?? '';
                      },
                    ),
                  ),
                  Expanded(
                    child: BorderTextFieldInput(
                      hintText: tr('description'),
                      initText: taskModel.description??'',
                      isShowBorder: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: Dimens.num10,
                      onChanged: (value) {
                        taskModel.description = value ?? '';
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.size16,
                  ),
                  CustomDatePicker(
                    title: '',
                    initialDate: widget.date,
                    lastDate: DateTime(2200),
                    firstDate: taskModel.getDate,
                    onChanged: (value) {
                      taskModel.toDate = ConvertUtility.convertDatetimeToString(value);
                    },
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
                    onclick: () {
                      bloc.createTask(taskModel);
                    },
                    text: tr('add_to_do'),
                    colors: theme.colorScheme.onSecondary,
                    borderRadius: Dimens.size10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
