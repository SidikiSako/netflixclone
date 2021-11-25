import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalIconButton extends StatefulWidget {
  final IconData icon;
  final String label;
  const VerticalIconButton({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  _VerticalIconButtonState createState() => _VerticalIconButtonState();
}

class _VerticalIconButtonState extends State<VerticalIconButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          widget.icon,
          color: Colors.white,
          size: 25,
        ),
        Text(
          widget.label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}
