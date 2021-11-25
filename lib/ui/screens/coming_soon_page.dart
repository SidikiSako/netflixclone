import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constant.dart';

class CominSoonPage extends StatefulWidget {
  const CominSoonPage({Key? key}) : super(key: key);

  @override
  _CominSoonPageState createState() => _CominSoonPageState();
}

class _CominSoonPageState extends State<CominSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Center(
        child: Text(
          'COMMING SOON',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
