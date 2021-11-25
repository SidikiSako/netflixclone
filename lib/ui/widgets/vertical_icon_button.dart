import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/repositories/index_provider.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';

class VerticalIconButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final int index;
  const VerticalIconButton(
      {Key? key, required this.icon, required this.label, required this.index})
      : super(key: key);

  @override
  _VerticalIconButtonState createState() => _VerticalIconButtonState();
}

class _VerticalIconButtonState extends State<VerticalIconButton> {
  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return GestureDetector(
      onTap: () {
        indexProvider.updateCurrentIndex(newIdex: widget.index);
      },
      child: Column(
        children: [
          Icon(
            widget.icon,
            color: widget.index == indexProvider.currentIndex
                ? kPrimaryColor
                : Colors.grey,
            size: 25,
          ),
          Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: widget.index == indexProvider.currentIndex
                  ? kPrimaryColor
                  : Colors.grey,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
