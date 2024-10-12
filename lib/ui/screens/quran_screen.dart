import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../common/app_images.dart';
import '../../models/quran_model.dart';
import '../../providers/theme_provider.dart';

class QuranScreen extends StatefulWidget {
  static const routeName = 'QuranScreen';
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    QuranModel? suraData =
        ModalRoute.of(context)!.settings.arguments as QuranModel;
    if (verses.isEmpty) {
      loadSuraContent(suraData.suraIndex!);
    }
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
                suraData.suraName!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Divider(
                thickness: 2,
                endIndent: MediaQuery.of(context).size.width * .2,
                indent: MediaQuery.of(context).size.width * .2,
              ),
              verses.isEmpty
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(
                            verses[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                            textDirection: TextDirection.rtl,
                          );
                        },
                        itemCount: verses.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraContent(int index) async {
    String data = await rootBundle.loadString('assets/quran/${index + 1}.txt');
    setState(() {
      verses = data.trim().split('\n');
    });
  }
}
