import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Center(
        child: Text(
          'HOME PAGE',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
