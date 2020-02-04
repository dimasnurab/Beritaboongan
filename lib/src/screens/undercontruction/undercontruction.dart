import 'package:flutter/material.dart';

class UnderContruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: Image.asset('assets/img/gambar1.jpg'),
          ),
          SizedBox(height: 14),
          Text(
            'Fitur ini sedang tahap pengembangan,\nNanti dikabarin lagi ya!!',
            style: TextStyle(color: Colors.grey, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
