import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constant.dart';

class MostRecentPage extends StatefulWidget {
  const MostRecentPage({Key? key}) : super(key: key);

  @override
  _MostRecentPageState createState() => _MostRecentPageState();
}

class _MostRecentPageState extends State<MostRecentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Center(
        child: Text(
          'MOST RECENT PAGE',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
