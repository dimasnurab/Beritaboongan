import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/beritaList.dart';
import '../components/customdivider.dart';
import '../providers/berita.dart';
import '../utils/constants.dart';
import '../main.dart';

class BeritaPage extends StatelessWidget {
  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<Beritas>(context, listen: false).fetchBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          'Test Exaditama',
          style: textStyleappBar,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Routes.sailor.navigate('search');
            },
            child: Icon(
              Icons.search,
              size: 28,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Trending Topic",
              style: headingTopicStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 2),
            child: CustomDivider(),
          ),
          RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: FutureBuilder(
              // Load Data menggunakan future builder
              future:
                  Provider.of<Beritas>(context, listen: false).fetchBerita(),
              builder: (context, snapshot) {
                // ketika masih load
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                } else {
                  // jika terdapat error
                  if (snapshot.error != null) {
                    // maka tampilkan error
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.error),
                          SizedBox(height: 20),
                          Text('Terjadi Kesalahan load data'),
                        ],
                      ),
                    );
                  } else {
                    // ketika load data selesai dan tidak terjadi error
                    // maka kita ambil state products
                    return Consumer<Beritas>(
                      builder: (context, berita, child) => Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          child: BeritaList(),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
