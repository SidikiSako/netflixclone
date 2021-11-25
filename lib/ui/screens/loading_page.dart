import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/repositories/data_provider.dart';
import 'package:netflix_clone/ui/screens/root.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    await dataProvider.initData();
    // on va sur root après qu'on ait fini l'initialisation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Root();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/netflix_logo_1.png'),
          const SpinKitFadingCircle(
            color: kPrimaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
