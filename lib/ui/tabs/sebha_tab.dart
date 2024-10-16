import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_images.dart';
import '../../providers/theme_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double clickCount = 0;
  int counter = 0;
  int index = 0;
  List<String> tasbehat = ['سبحان الله', 'الحمدلله', 'الله اكبر'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: clickCount,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .7,
                child: Image.asset(
                  !Provider.of<ThemeProvider>(context).isDark
                      ? AppImages.sebhaHeaderIcn
                      : AppImages.sebhaDarkHeaderIcn,
                  height: MediaQuery.of(context).size.height * .25,
                ),
              ),
            ),
          ],
        ),
        Text(
          'عدد التسبيحات',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .02),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            '$counter',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        MaterialButton(
          color: Theme.of(context).colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            setState(() {
              clickCount = clickCount + 0.19;
              if (counter >= 33) {
                counter = 0;
                clickCount = 0;
                if (tasbehat[index] == tasbehat.last) {
                  index = -1;
                }
                index++;
              }
              counter++;
            });
          },
          child: Text(
            tasbehat[index],
            style: Theme.of(context).textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
