import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

class MugglesTitle extends StatelessWidget {
  const MugglesTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(secondaryColor),
          ),
          children: [
            TextSpan(text: 'Air'),
            TextSpan(
                text: 'Power',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Color(primaryColor),
                ))
          ]),
    );
  }
}
