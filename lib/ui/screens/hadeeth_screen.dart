import 'package:flutter/material.dart';
import 'package:islamy/models/hadeeth_model.dart';
import 'package:provider/provider.dart';

import '../../common/app_images.dart';
import '../../providers/theme_provider.dart';

class HadeethScreen extends StatelessWidget {
  static const String routeName = 'HadeethScreen';
  const HadeethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadeethModel hadeethModel =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(!Provider.of<ThemeProvider>(context).isDark
              ? AppImages.bgImage
              : AppImages.darkBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Islamy'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .02,
              horizontal: MediaQuery.of(context).size.width * .09),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .06,
              vertical: MediaQuery.of(context).size.height * .05),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.85),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Text(
                hadeethModel.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Divider(
                thickness: 2,
                endIndent: MediaQuery.of(context).size.width * .2,
                indent: MediaQuery.of(context).size.width * .2,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    hadeethModel.content,
                    style: Theme.of(context).textTheme.titleSmall,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
