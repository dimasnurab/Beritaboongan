import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/berita.dart';
import './beritaCard.dart';

class BeritaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beritaData = Provider.of<Beritas>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      itemCount: beritaData.items.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: beritaData.items[i],
        child: BeritaCard(),
      ),
    );
  }
}
