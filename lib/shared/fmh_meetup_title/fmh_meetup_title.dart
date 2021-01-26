import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/theme.dart';

class FMHMeetupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Flutter Hamburg',
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64.0),
          child: SelectableText(
            'and Beyond',
            style: Theme.of(context)
                .textTheme
                .headline4
                .apply(fontFamily: kFontFamilyAntipasto),
          ),
        ),
      ],
    );
  }
}
