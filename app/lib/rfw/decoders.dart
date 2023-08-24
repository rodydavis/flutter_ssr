import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

class CustomArgumentDecoders {
  static ButtonStyle? outlinedButtonStyle(
    DataSource source,
    List<Object> key,
    BuildContext context,
  ) {
    if (!source.isMap(key)) {
      return null;
    }
    return OutlinedButton.styleFrom(
      foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
      backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
      disabledForegroundColor:
          ArgumentDecoders.color(source, [...key, 'disabledForegroundColor']),
      disabledBackgroundColor:
          ArgumentDecoders.color(source, [...key, 'disabledBackgroundColor']),
      shadowColor: ArgumentDecoders.color(source, [...key, 'shadowColor']),
      surfaceTintColor:
          ArgumentDecoders.color(source, [...key, 'surfaceTintColor']),
      elevation: source.v<double>(['elevation']),
      textStyle: ArgumentDecoders.textStyle(source, [...key, 'textStyle']),
      padding: ArgumentDecoders.edgeInsets(source, [...key, 'padding']),
      minimumSize: CustomArgumentDecoders.size(source, [...key, 'minimumSize']),
      fixedSize: CustomArgumentDecoders.size(source, [...key, 'fixedSize']),
      maximumSize: CustomArgumentDecoders.size(source, [...key, 'maximumSize']),
      side: ArgumentDecoders.borderSide(source, [...key, 'side']),
      shape: CustomArgumentDecoders.outlinedBorder(source, [...key, 'shape']),
      enabledMouseCursor: CustomArgumentDecoders.mouseCursor(
          source, [...key, 'enabledMouseCursor']),
      disabledMouseCursor: CustomArgumentDecoders.mouseCursor(
          source, [...key, 'disabledMouseCursor']),
      visualDensity:
          ArgumentDecoders.visualDensity(source, [...key, 'visualDensity']),
      tapTargetSize: ArgumentDecoders.enumValue<MaterialTapTargetSize>(
              MaterialTapTargetSize.values,
              source,
              [...key, 'tapTargetSize']) ??
          MaterialTapTargetSize.shrinkWrap,
      animationDuration: ArgumentDecoders.duration(
          source, [...key, 'animationDuration'], context),
      enableFeedback: source.v<bool>([...key, 'enableFeedback']),
      alignment: ArgumentDecoders.alignment(source, [...key, 'alignment']),
    );
  }

  static ButtonStyle? filledButtonStyle(
    DataSource source,
    List<Object> key,
    BuildContext context,
  ) {
    if (!source.isMap(key)) {
      return null;
    }
    return FilledButton.styleFrom(
      foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
      backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
      disabledForegroundColor:
          ArgumentDecoders.color(source, [...key, 'disabledForegroundColor']),
      disabledBackgroundColor:
          ArgumentDecoders.color(source, [...key, 'disabledBackgroundColor']),
      shadowColor: ArgumentDecoders.color(source, [...key, 'shadowColor']),
      surfaceTintColor:
          ArgumentDecoders.color(source, [...key, 'surfaceTintColor']),
      elevation: source.v<double>(['elevation']),
      textStyle: ArgumentDecoders.textStyle(source, [...key, 'textStyle']),
      padding: ArgumentDecoders.edgeInsets(source, [...key, 'padding']),
      minimumSize: CustomArgumentDecoders.size(source, [...key, 'minimumSize']),
      fixedSize: CustomArgumentDecoders.size(source, [...key, 'fixedSize']),
      maximumSize: CustomArgumentDecoders.size(source, [...key, 'maximumSize']),
      side: ArgumentDecoders.borderSide(source, [...key, 'side']),
      shape: CustomArgumentDecoders.outlinedBorder(source, [...key, 'shape']),
      enabledMouseCursor: CustomArgumentDecoders.mouseCursor(
          source, [...key, 'enabledMouseCursor']),
      disabledMouseCursor: CustomArgumentDecoders.mouseCursor(
          source, [...key, 'disabledMouseCursor']),
      visualDensity:
          ArgumentDecoders.visualDensity(source, [...key, 'visualDensity']),
      tapTargetSize: ArgumentDecoders.enumValue<MaterialTapTargetSize>(
              MaterialTapTargetSize.values,
              source,
              [...key, 'tapTargetSize']) ??
          MaterialTapTargetSize.shrinkWrap,
      animationDuration: ArgumentDecoders.duration(
          source, [...key, 'animationDuration'], context),
      enableFeedback: source.v<bool>([...key, 'enableFeedback']),
      alignment: ArgumentDecoders.alignment(source, [...key, 'alignment']),
    );
  }

  static ButtonStyle? textButtonStyle(
    DataSource source,
    List<Object> key,
    BuildContext context,
  ) {
    if (!source.isMap(key)) {
      return null;
    }
    return TextButton.styleFrom(
      foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
      backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
      disabledForegroundColor:
          ArgumentDecoders.color(source, [...key, 'disabledForegroundColor']),
      disabledBackgroundColor:
          ArgumentDecoders.color(source, [...key, 'disabledBackgroundColor']),
      shadowColor: ArgumentDecoders.color(source, [...key, 'shadowColor']),
      surfaceTintColor:
          ArgumentDecoders.color(source, [...key, 'surfaceTintColor']),
      elevation: source.v<double>(['elevation']),
      textStyle: ArgumentDecoders.textStyle(source, [...key, 'textStyle']),
      padding: ArgumentDecoders.edgeInsets(source, [...key, 'padding']),
      minimumSize: CustomArgumentDecoders.size(source, [...key, 'minimumSize']),
      fixedSize: CustomArgumentDecoders.size(source, [...key, 'fixedSize']),
      maximumSize: CustomArgumentDecoders.size(source, [...key, 'maximumSize']),
      side: ArgumentDecoders.borderSide(source, [...key, 'side']),
      shape: CustomArgumentDecoders.outlinedBorder(source, [...key, 'shape']),
      enabledMouseCursor: CustomArgumentDecoders.mouseCursor(
          source, [...key, 'enabledMouseCursor']),
      disabledMouseCursor: CustomArgumentDecoders.mouseCursor(
          source, [...key, 'disabledMouseCursor']),
      visualDensity:
          ArgumentDecoders.visualDensity(source, [...key, 'visualDensity']),
      tapTargetSize: ArgumentDecoders.enumValue<MaterialTapTargetSize>(
              MaterialTapTargetSize.values,
              source,
              [...key, 'tapTargetSize']) ??
          MaterialTapTargetSize.shrinkWrap,
      animationDuration: ArgumentDecoders.duration(
          source, [...key, 'animationDuration'], context),
      enableFeedback: source.v<bool>([...key, 'enableFeedback']),
      alignment: ArgumentDecoders.alignment(source, [...key, 'alignment']),
    );
  }

  static EdgeInsets? edgeInsets(DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    final all = source.v<double>([...key, 'all']);
    if (all != null) return EdgeInsets.all(all);
    final vertical = source.v<double>([...key, 'vertical']);
    final horizontal = source.v<double>([...key, 'horizontal']);
    if (vertical != null || horizontal != null) {
      return EdgeInsets.symmetric(
        vertical: vertical ?? 0,
        horizontal: horizontal ?? 0,
      );
    }
    final top = source.v<double>([...key, 'top']);
    final bottom = source.v<double>([...key, 'bottom']);
    final left = source.v<double>([...key, 'left']);
    final right = source.v<double>([...key, 'right']);
    return EdgeInsets.only(
      top: top ?? 0,
      bottom: bottom ?? 0,
      left: left ?? 0,
      right: right ?? 0,
    );
  }

  static Size? size(DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    return Size(
      source.v<double>([...key, 'width']) ?? 0.0,
      source.v<double>([...key, 'height']) ?? 0.0,
    );
  }

  static MouseCursor? mouseCursor(DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    final type = source.v<String>([...key, 'type']);
    final value = source.v<String>([...key, 'value']);
    if (type == 'system') {
      switch (value) {
        case 'alias':
          return SystemMouseCursors.alias;
        case 'none':
          return SystemMouseCursors.none;
        case 'basic':
          return SystemMouseCursors.basic;
        case 'click':
          return SystemMouseCursors.click;
        case 'forbidden':
          return SystemMouseCursors.forbidden;
        case 'wait':
          return SystemMouseCursors.wait;
        case 'progress':
          return SystemMouseCursors.progress;
        case 'contextMenu':
          return SystemMouseCursors.contextMenu;
        case 'help':
          return SystemMouseCursors.help;
        case 'text':
          return SystemMouseCursors.text;
        case 'verticalText':
          return SystemMouseCursors.verticalText;
        case 'cell':
          return SystemMouseCursors.cell;
        case 'precise':
          return SystemMouseCursors.precise;
        case 'move':
          return SystemMouseCursors.move;
        case 'grab':
          return SystemMouseCursors.grab;
        case 'grabbing':
          return SystemMouseCursors.grabbing;
        case 'noDrop':
          return SystemMouseCursors.noDrop;
        case 'alias':
          return SystemMouseCursors.alias;
        case 'copy':
          return SystemMouseCursors.copy;
        case 'disappearing':
          return SystemMouseCursors.disappearing;
        case 'allScroll':
          return SystemMouseCursors.allScroll;
        case 'resizeLeftRight':
          return SystemMouseCursors.resizeLeftRight;
        case 'resizeUpDown':
          return SystemMouseCursors.resizeUpDown;
        case 'resizeUpLeftDownRight':
          return SystemMouseCursors.resizeUpLeftDownRight;
        case 'resizeUpRightDownLeft':
          return SystemMouseCursors.resizeUpRightDownLeft;
        case 'resizeUp':
          return SystemMouseCursors.resizeUp;
        case 'resizeDown':
          return SystemMouseCursors.resizeDown;
        case 'resizeLeft':
          return SystemMouseCursors.resizeLeft;
        case 'resizeRight':
          return SystemMouseCursors.resizeRight;
        case 'resizeUpLeft':
          return SystemMouseCursors.resizeUpLeft;
        case 'resizeUpRight':
          return SystemMouseCursors.resizeUpRight;
        case 'resizeDownLeft':
          return SystemMouseCursors.resizeDownLeft;
        case 'resizeDownRight':
          return SystemMouseCursors.resizeDownRight;
        case 'resizeColumn':
          return SystemMouseCursors.resizeColumn;
        case 'resizeRow':
          return SystemMouseCursors.resizeRow;
        case 'zoomIn':
          return SystemMouseCursors.zoomIn;
        case 'zoomOut':
          return SystemMouseCursors.zoomOut;
        default:
      }
    }
    return null;
  }

  static LinearBorderEdge? linearBorderEdge(
      DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    return LinearBorderEdge(
      size: source.v<double>([...key, 'size']) ?? 1.0,
      alignment: source.v<double>([...key, 'alignment']) ?? 0.0,
    );
  }

  static OutlinedBorder? outlinedBorder(DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    final type = source.v<String>([...key, 'type']);
    switch (type) {
      case "RoundedRectangleBorder":
        return RoundedRectangleBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          borderRadius:
              ArgumentDecoders.borderRadius(source, [...key, 'borderRadius']) ??
                  BorderRadius.zero,
        );
      case "BeveledRectangleBorder":
        return BeveledRectangleBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          borderRadius:
              ArgumentDecoders.borderRadius(source, [...key, 'borderRadius']) ??
                  BorderRadius.zero,
        );
      case "ContinuousRectangleBorder":
        return ContinuousRectangleBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          borderRadius:
              ArgumentDecoders.borderRadius(source, [...key, 'borderRadius']) ??
                  BorderRadius.zero,
        );
      case "CircleBorder":
        return CircleBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          eccentricity: source.v<double>([...key, 'eccentricity']) ?? 0.0,
        );
      case "LinearBorder":
        return LinearBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          start: CustomArgumentDecoders.linearBorderEdge(
              source, [...key, 'start']),
          end: CustomArgumentDecoders.linearBorderEdge(source, [...key, 'end']),
          top: CustomArgumentDecoders.linearBorderEdge(source, [...key, 'top']),
          bottom: CustomArgumentDecoders.linearBorderEdge(
              source, [...key, 'bottom']),
        );
      case "OvalBorder":
        return OvalBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          eccentricity: source.v<double>([...key, 'eccentricity']) ?? 0.0,
        );
      case "StadiumBorder":
        return StadiumBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
        );
      case "StarBorder":
        return StarBorder(
          side: ArgumentDecoders.borderSide(source, [...key, 'side']) ??
              BorderSide.none,
          points: source.v<double>([...key, 'points']) ?? 5.0,
          innerRadiusRatio:
              source.v<double>([...key, 'innerRadiusRatio']) ?? 0.4,
          pointRounding: source.v<double>([...key, 'pointRounding']) ?? 0.0,
          valleyRounding: source.v<double>([...key, 'valleyRounding']) ?? 0.0,
          rotation: source.v<double>([...key, 'rotation']) ?? 0.0,
          squash: source.v<double>([...key, 'squash']) ?? 0.0,
        );
      default:
        break;
    }
    return null;
  }
}
