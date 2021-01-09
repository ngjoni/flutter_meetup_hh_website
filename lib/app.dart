import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_meetup_hh_website/shared/fmh_drawer/fmh_drawer.dart';
import 'package:flutter_meetup_hh_website/shared/fmh_responsive_wrapper/fmh_responsive_wrapper.dart';

import 'shared/fmh_constrained_container/fmh_constrained_container.dart';
import 'shared/fmh_content_card/fmh_content_card.dart';
import 'shared/fmh_meetup_title/fmh_meetup_title.dart';
import 'shared/fmh_navigation/fmh_navigation.dart';
import 'types/enums/content_padding.dart';
import 'views/landing.dart';

const kContentPadding = ContentPadding.normal;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget view = Padding(
      padding: EdgeInsets.symmetric(horizontal: kContentPadding.value),
      child: SizedBox(
        height: min(MediaQuery.of(context).size.height, 700.0),
        child: FMHContentCard(
          child: LandingView(),
        ),
      ),
    );

    return FMHResponsiveWrapper(
      responsiveBuilder: (display) => Scaffold(
        appBar: display == Display.mobile
            ? AppBar(
                title: Text('Flutter and Beyond'),
              )
            : null,
        drawer: display == Display.mobile ? FMHDrawer() : null,
        body: FMHConstraintedContainer(
          child: display == Display.mobile
              ? view
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350.0,
                      child: Transform.translate(
                        offset: Offset(0, -120.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: FMHMeetupTitle()),
                                  FMHNavigation(),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.0),
                            VerticalDivider(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: view),
                  ],
                ),
        ),
      ),
    );
  }
}