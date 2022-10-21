import 'package:flutter/material.dart';

import '../model/model.dart';
import '../style/style.dart';

class ItemTask extends StatefulWidget {
  const ItemTask({Key? key,this.colorCard,this.isShowIconClock, this.task}) : super(key: key);
  final bool? isShowIconClock;
  final Color? colorCard;
  final Task? task;


  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size=  MediaQuery.of(context).size;
    return Container(
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: Dimens.size16),
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.size16, horizontal: Dimens.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.colorCard?? theme.colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.task?.title?? '',
                    style: theme.textTheme.bodyText1!
                        .copyWith(color: theme.colorScheme.onSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible:widget.isShowIconClock?? true,
                  child: Icon(
                    Icons.watch_later_outlined,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            Expanded(
              child: Text(
                widget.task?.description?? '',
                style: theme.textTheme.bodyText2!
                    .copyWith(color: theme.colorScheme.onSecondary),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              widget.task?.created_time !=null? 'created by ${widget.task?.created_time}':'created by ${DateTime.now()}',
              style: theme.textTheme.bodyText2!
                  .copyWith(color: theme.colorScheme.onSecondary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ));
  }
}
