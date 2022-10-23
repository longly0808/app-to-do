import 'package:flutter/material.dart';
import 'package:to_do_list/utility/convert.dart';

import '../style/style.dart';

class ItemTask extends StatefulWidget {
  const ItemTask({
    Key? key,
    this.colorCard,
    this.isShowIconClock,
    required this.title,
    required this.dateTime,
    required this.description,
  }) : super(key: key);
  final bool? isShowIconClock;
  final Color? colorCard;
  final String title;
  final String description;
  final DateTime dateTime;

  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
        height: Dimens.size200,
        margin: const EdgeInsets.symmetric(vertical: Dimens.size16),
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.size16, horizontal: Dimens.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size16),
          color: widget.colorCard ?? theme.colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: theme.textTheme.bodyText1!
                        .copyWith(color: theme.colorScheme.onSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: widget.isShowIconClock ?? true,
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
                widget.description,
                style: theme.textTheme.bodyText2!
                    .copyWith(color: theme.colorScheme.onSecondary),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'created by ${ConvertUtility.calendarFormat(widget.dateTime)}',
              style: theme.textTheme.bodyText2!
                  .copyWith(color: theme.colorScheme.onSecondary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ));
  }
}
