import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Center(
        child: Text(
          'RECHERCHE',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
