import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoItem extends StatelessWidget {
  String info;
  String title;
   InfoItem({required this.title,required this.info,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:",style: GoogleFonts.getFont("IBM Plex Serif",fontWeight: FontWeight.w700,fontSize: 16)),
        SizedBox(
            width: 200,
            child: Text(info,style: GoogleFonts.getFont("IBM Plex Serif",fontWeight: FontWeight.w700,fontSize: 16),))

      ],
    );

  }
}
