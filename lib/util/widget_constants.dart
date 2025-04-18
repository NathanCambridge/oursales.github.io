
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

const double kWidgetFontSize = 13;

TextStyle kDefaultFont(BuildContext context) {
  return GoogleFonts.inter(
    color: shadcn.Theme.of(context).colorScheme.cardForeground,
    fontSize: 13,
    fontWeight: FontWeight.w400
  );
}

TextStyle kBoldedDefaultFont(BuildContext context) {
  return GoogleFonts.inter(
      color: shadcn.Theme.of(context).colorScheme.cardForeground,
      fontSize: 13,
      fontWeight: FontWeight.w600
  );
}

TextStyle kHeaderDefaultFont(BuildContext context) {
  return GoogleFonts.spaceGrotesk(
    color: shadcn.Theme.of(context).colorScheme.cardForeground,
    fontSize: 20, fontWeight: FontWeight.w600
  );
}