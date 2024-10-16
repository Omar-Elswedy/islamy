import 'package:flutter/material.dart';

import '../../common/app_images.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AppImages.radioImageHeaderIcn,
            height: MediaQuery.of(context).size.height * .25,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Text(
          'اذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .07,
            ),
            Icon(
              Icons.play_arrow_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .07,
            ),
            Icon(
              Icons.skip_next_rounded,
              color: Theme.of(context).colorScheme.secondary,
              size: 50,
            ),
          ],
        )
      ],
    );
  }
}
