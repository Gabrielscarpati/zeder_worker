import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

/// titleBold

class DSTextTitleBoldPrimary extends _DSTextTitleBold {
  const DSTextTitleBoldPrimary({super.key, required super.text});

  @override
  Color get textColor => DSColors.primary;
}

class DSTextTitleBoldSecondary extends _DSTextTitleBold {
  const DSTextTitleBoldSecondary({super.key, required super.text});

  @override
  Color get textColor => DSColors.secondary;
}

class DSTextTitleBoldTertiary extends _DSTextTitleBold {
  const DSTextTitleBoldTertiary({super.key, required super.text});

  @override
  Color get textColor => DSColors.tertiary;
}

/// title

class DSTextTitlePrimary extends _DSTextTitle {
  const DSTextTitlePrimary({super.key, required super.text});

  @override
  Color get textColor => DSColors.primary;
}

class DSTextTitleSecondary extends _DSTextTitle {
  const DSTextTitleSecondary({super.key, required super.text});

  @override
  Color get textColor => DSColors.secondary;
}

class DSTextTitleTertiary extends _DSTextTitle {
  const DSTextTitleTertiary({super.key, required super.text});

  @override
  Color get textColor => DSColors.tertiary;
}

/// subtitle Bold

class DSTextSubtitleBoldPrimary extends _DSTextSubtitleBold {
  const DSTextSubtitleBoldPrimary({super.key, required super.text});

  @override
  Color get textColor => DSColors.primary;
}

class DSTextSubtitleBoldPrimaryUnderline extends _DSTextSubtitleBoldUnderline {
  const DSTextSubtitleBoldPrimaryUnderline({super.key, required super.text});

  @override
  Color get textColor => DSColors.primary;
}

class DSTextSubtitleBoldSecondary extends _DSTextSubtitleBold {
  const DSTextSubtitleBoldSecondary({super.key, required super.text});

  @override
  Color get textColor => DSColors.secondary;
}

class DSTextSubtitleBoldTertiary extends _DSTextSubtitleBold {
  const DSTextSubtitleBoldTertiary({super.key, required super.text});

  @override
  Color get textColor => DSColors.tertiary;
}

/// subtitle

class DSTextSubtitlePrimary extends _DSTextSubtitle {
  const DSTextSubtitlePrimary({super.key, required super.text});

  @override
  Color get textColor => DSColors.primary;
}

class DSTextSubtitleSecondary extends _DSTextSubtitle {
  const DSTextSubtitleSecondary({super.key, required super.text, super.maxLines});

  @override
  Color get textColor => DSColors.secondary;
}

class DSTextSubtitleTertiary extends _DSTextSubtitle {
  const DSTextSubtitleTertiary({super.key, required super.text});

  @override
  Color get textColor => DSColors.tertiary;
}

///body
class DSTextButton extends _DSTextBodyLarge {
  const DSTextButton({super.key, required super.text});

  @override
  TextStyle? textStyle(BuildContext context) => super.textStyle(context)?.copyWith(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: DSFonts.buttonTextFontFamily);

  @override
  Color get textColor => DSColors.textButtonColor;
}

/// abtract classes

abstract class _DSTextTitleBold extends _DSTextTitleMedium {
  const _DSTextTitleBold({super.key, required super.text});

  @override
  TextStyle? textStyle(BuildContext context) => super.textStyle(context)?.copyWith(fontWeight: FontWeight.bold);
}

abstract class _DSTextTitle extends _DSTextTitleMedium {
  const _DSTextTitle({super.key, required super.text});
}

abstract class _DSTextSubtitle extends _DSTextLabelMedium {
  const _DSTextSubtitle({super.key, required super.text, super.maxLines});
}

abstract class _DSTextSubtitleBold extends _DSTextLabelMedium {
  const _DSTextSubtitleBold({super.key, required super.text});
  @override
  TextStyle? textStyle(BuildContext context) => super.textStyle(context)?.copyWith(fontWeight: FontWeight.bold);
}

abstract class _DSTextSubtitleBoldUnderline extends _DSTextLabelMedium {
  const _DSTextSubtitleBoldUnderline({super.key, required super.text});
  @override
  TextStyle? textStyle(BuildContext context) => super.textStyle(context)?.copyWith(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationThickness: 4);
}

abstract class _DSText extends StatelessWidget {
  final String text;
  final int? maxLines;

  const _DSText({
    super.key,
    required this.text,
    this.maxLines,
  });

  TextStyle? textStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle(context), maxLines: maxLines);
  }
}

/// display

abstract class _DSTextDisplayLarge extends _DSText {
  const _DSTextDisplayLarge({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.displayLarge?.copyWith(color: textColor);
}

abstract class _DSTextDisplayMedium extends _DSText {
  const _DSTextDisplayMedium({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.displayMedium?.copyWith(color: textColor);
}

abstract class _DSTextDisplaySmall extends _DSText {
  const _DSTextDisplaySmall({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.displaySmall?.copyWith(color: textColor);
}

/// headline

abstract class _DSTextHeadlineLarge extends _DSText {
  const _DSTextHeadlineLarge({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.headlineLarge?.copyWith(color: textColor);
}

abstract class _DSTextHeadlineMedium extends _DSText {
  const _DSTextHeadlineMedium({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.headlineMedium?.copyWith(color: textColor);
}

abstract class _DSTextHeadlineSmall extends _DSText {
  const _DSTextHeadlineSmall({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.headlineSmall?.copyWith(color: textColor);
}

/// title

abstract class _DSTextTitleLarge extends _DSText {
  const _DSTextTitleLarge({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.titleLarge?.copyWith(color: textColor);
}

abstract class _DSTextTitleMedium extends _DSText {
  const _DSTextTitleMedium({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.titleMedium?.copyWith(color: textColor);
}

abstract class _DSTextTitleSmall extends _DSText {
  const _DSTextTitleSmall({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.titleSmall?.copyWith(color: textColor);
}

/// label

abstract class _DSTextLabelLarge extends _DSText {
  const _DSTextLabelLarge({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor);
}

abstract class _DSTextLabelMedium extends _DSText {
  const _DSTextLabelMedium({super.key, required super.text, super.maxLines});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.labelMedium?.copyWith(color: textColor);
}

abstract class _DSTextLabelSmall extends _DSText {
  const _DSTextLabelSmall({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor);
}

/// body

abstract class _DSTextBodyLarge extends _DSText {
  const _DSTextBodyLarge({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor);
}

abstract class _DSTextBodyMedium extends _DSText {
  const _DSTextBodyMedium({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor);
}

abstract class _DSTextBodySmall extends _DSText {
  const _DSTextBodySmall({super.key, required super.text});

  Color get textColor;

  @override
  TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor);
}
