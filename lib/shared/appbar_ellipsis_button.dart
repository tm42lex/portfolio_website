import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;

class EllipsisOptions {
  static const choices = [
    paragraph.license,
  ];
}

class EllipsisButton extends StatelessWidget {
  final ThemeData theme;
  EllipsisButton({required this.theme, Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        height: 30,
        child: Center(
          child: PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: theme.colorScheme.onBackground, size: 30,),
            color: theme.colorScheme.onBackground,
            onSelected: (value) {
              showLicensePage(context: context);
            },
            itemBuilder: (BuildContext context) {
              return List.generate(EllipsisOptions.choices.length, (index)  {
                return PopupMenuItem<String>(
                  value: EllipsisOptions.choices[index],
                  child: Text( EllipsisOptions.choices[index],
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: theme.colorScheme.background,
                    ).copyWith(
                      fontFamilyFallback: [
                        'NotoSansJP',
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        )
    );
  }
}
