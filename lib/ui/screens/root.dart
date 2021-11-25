import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/ui/widgets/vertical_icon_button.dart';
import 'package:netflix_clone/utils/constant.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;
  Widget getBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      color: kBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          VerticalIconButton(
            icon: Icons.home,
            label: 'Accueil',
            index: 0,
          ),
          VerticalIconButton(
            icon: Icons.video_library,
            label: 'Nouveau',
            index: 1,
          ),
          VerticalIconButton(
            icon: Icons.send,
            label: 'Bientôt',
            index: 2,
          ),
          VerticalIconButton(
            icon: Icons.search,
            label: 'Recherche',
            index: 3,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        bottomNavigationBar: getBottomNavigationBar());
  }
}


// BottomNavigationBar(
//         backgroundColor: kBackgroundColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: kPrimaryColor,
//         selectedFontSize: 11,
//         unselectedFontSize: 11,
//         iconSize: 20,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Accueil',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Accueil',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Accueil',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Accueil',
//           ),
//         ],
//       ),