import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/hadeeth_model.dart';
import 'package:islamy/ui/screens/hadeeth_screen.dart';

import '../../common/app_images.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<String> ahadeeth = [];
  List<HadeethModel> ahadeethModelList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeeth.isEmpty) loadAhadeethContent();
    return Column(
      children: [
        Image.asset(
          AppImages.hadeethHeaderIcn,
          height: MediaQuery.of(context).size.height * .25,
        ),
        Divider(
          thickness: 2,
        ),
        Text(
          'Hadeeth',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          thickness: 2,
        ),
        ahadeeth.isEmpty
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                    child: Center(
                      child: Text(
                        ahadeethModelList[index].name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(HadeethScreen.routeName,
                          arguments: ahadeethModelList[index]);
                    },
                  ),
                  itemCount: ahadeethModelList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                ),
              ),
      ],
    );
  }

  Future<void> loadAhadeethContent() async {
    String data = await rootBundle.loadString('assets/hadeeth/ahadeth.txt');
    setState(() {
      ahadeeth = data.trim().split('#');
      ahadeeth.removeWhere((element) => element.trim().isEmpty);
    });
    for (int i = 0; i < ahadeeth.length; i++) {
      int index = ahadeeth[i].trim().indexOf('\n');
      String hadeethName = ahadeeth[i].trim().substring(0, index);
      String hadeethContent = ahadeeth[i].trim().substring(index);
      ahadeethModelList
          .add(HadeethModel(name: hadeethName, content: hadeethContent));
    }
  }
}
