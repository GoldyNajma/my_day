import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';

class FinishedTaskNavigationWidget extends StatelessWidget {
  const FinishedTaskNavigationWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () { },
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text('Finished Tasks', style: textTheme.bodyText2!.apply(
                  color: MyDayColors.darkGrey,
                )),
              ),
              const Icon(Boxicons.bx_right_arrow_alt,
                size: 24,
                color: MyDayColors.darkGrey,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      )
    );
  }
}