import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';

/// This class defines the variables used in the [faq_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FaqModel {
   static Widget Acordian( headerStyle,
      loremIpsum,
      contentStyle,
      headingText,
      contentText,
      verticalpadding,){
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalpadding),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(40, 0, 0, 0),
              offset: Offset(0, 0), // Specify the offset of the shadow
              blurRadius: 5, // Specify the blur radius of the shadow
              spreadRadius: 2, // Specify the spread radius of the shadow
            ),
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),

          ),
          border: Border(
              bottom: BorderSide(
                  color: ColorSchemes.primaryColorScheme.secondary,
                  width: 2,
                  style: BorderStyle.solid))),
      child: Accordion(
        contentBorderRadius: 5,
        contentVerticalPadding: 0,
        contentHorizontalPadding: 0,
        paddingBetweenClosedSections: 0,
        paddingBetweenOpenSections: 10,
        paddingListBottom: 10,
        paddingListHorizontal: 10,
        paddingListTop: 0,

        //headerBorderColorOpened: Colors.transparent,
        // headerBorderWidth: 1,
        headerBackgroundColor: Colors.white,
        contentBackgroundColor: Colors.white,
        contentBorderColor: Colors.white,
        contentBorderWidth: 3,

        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding:
        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: false,
            contentBorderRadius: 10,
            headerBorderWidth: 2,
            header:  Text(headingText, style: headerStyle),
            content:  Text(contentText, style: contentStyle),
            rightIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
