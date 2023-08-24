import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

LocalWidgetLibrary createCoreWidgets() =>
    LocalWidgetLibrary(_coreWidgetsDefinitions);

Map<String, LocalWidgetBuilder> get _coreWidgetsDefinitions =>
    <String, LocalWidgetBuilder>{
      'AnimationDefaults': (BuildContext context, DataSource source) {
        return AnimationDefaults(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          child: source.child(['child']),
        );
      },
      'Align': (BuildContext context, DataSource source) {
        return AnimatedAlign(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          alignment: ArgumentDecoders.alignment(source, ['alignment']) ??
              Alignment.center,
          widthFactor: source.v<double>(['widthFactor']),
          heightFactor: source.v<double>(['heightFactor']),
          onEnd: source.voidHandler(['onEnd']),
          child: source.optionalChild(['child']),
        );
      },
      'AspectRatio': (BuildContext context, DataSource source) {
        return AspectRatio(
          aspectRatio: source.v<double>(['aspectRatio']) ?? 1.0,
          child: source.optionalChild(['child']),
        );
      },
      'Center': (BuildContext context, DataSource source) {
        return Center(
          widthFactor: source.v<double>(['widthFactor']),
          heightFactor: source.v<double>(['heightFactor']),
          child: source.optionalChild(['child']),
        );
      },
      'ColoredBox': (BuildContext context, DataSource source) {
        return ColoredBox(
          color: ArgumentDecoders.color(source, ['color']) ??
              const Color(0xFF000000),
          child: source.optionalChild(['child']),
        );
      },
      'Column': (BuildContext context, DataSource source) {
        return Column(
          mainAxisAlignment: ArgumentDecoders.enumValue<MainAxisAlignment>(
                  MainAxisAlignment.values, source, ['mainAxisAlignment']) ??
              MainAxisAlignment.start,
          mainAxisSize: ArgumentDecoders.enumValue<MainAxisSize>(
                  MainAxisSize.values, source, ['mainAxisSize']) ??
              MainAxisSize.max,
          crossAxisAlignment: ArgumentDecoders.enumValue<CrossAxisAlignment>(
                  CrossAxisAlignment.values, source, ['crossAxisAlignment']) ??
              CrossAxisAlignment.center,
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
          verticalDirection: ArgumentDecoders.enumValue<VerticalDirection>(
                  VerticalDirection.values, source, ['verticalDirection']) ??
              VerticalDirection.down,
          textBaseline: ArgumentDecoders.enumValue<TextBaseline>(
              TextBaseline.values, source, ['textBaseline']),
          children: source.childList(['children']),
        );
      },
      'Container': (BuildContext context, DataSource source) {
        return AnimatedContainer(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          alignment: ArgumentDecoders.alignment(source, ['alignment']),
          padding: ArgumentDecoders.edgeInsets(source, ['padding']),
          color: ArgumentDecoders.color(source, ['color']),
          decoration: ArgumentDecoders.decoration(source, ['decoration']),
          foregroundDecoration:
              ArgumentDecoders.decoration(source, ['foregroundDecoration']),
          width: source.v<double>(['width']),
          height: source.v<double>(['height']),
          constraints: ArgumentDecoders.boxConstraints(source, ['constraints']),
          margin: ArgumentDecoders.edgeInsets(source, ['margin']),
          transform: ArgumentDecoders.matrix(source, ['transform']),
          transformAlignment:
              ArgumentDecoders.alignment(source, ['transformAlignment']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          onEnd: source.voidHandler(['onEnd']),
          child: source.optionalChild(['child']),
        );
      },
      'DefaultTextStyle': (BuildContext context, DataSource source) {
        return AnimatedDefaultTextStyle(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          style: ArgumentDecoders.textStyle(source, ['style']) ??
              const TextStyle(),
          textAlign: ArgumentDecoders.enumValue<TextAlign>(
              TextAlign.values, source, ['textAlign']),
          softWrap: source.v<bool>(['softWrap']) ?? true,
          overflow: ArgumentDecoders.enumValue<TextOverflow>(
                  TextOverflow.values, source, ['overflow']) ??
              TextOverflow.clip,
          maxLines: source.v<int>(['maxLines']),
          textWidthBasis: ArgumentDecoders.enumValue<TextWidthBasis>(
                  TextWidthBasis.values, source, ['textWidthBasis']) ??
              TextWidthBasis.parent,
          textHeightBehavior: ArgumentDecoders.textHeightBehavior(
              source, ['textHeightBehavior']),
          onEnd: source.voidHandler(['onEnd']),
          child: source.child(['child']),
        );
      },
      'Directionality': (BuildContext context, DataSource source) {
        return Directionality(
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
                  TextDirection.values, source, ['textDirection']) ??
              TextDirection.ltr,
          child: source.child(['child']),
        );
      },
      'Expanded': (BuildContext context, DataSource source) {
        return Expanded(
          flex: source.v<int>(['flex']) ?? 1,
          child: source.child(['child']),
        );
      },
      'FittedBox': (BuildContext context, DataSource source) {
        return FittedBox(
          fit: ArgumentDecoders.enumValue<BoxFit>(
                  BoxFit.values, source, ['fit']) ??
              BoxFit.contain,
          alignment: ArgumentDecoders.alignment(source, ['alignment']) ??
              Alignment.center,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          child: source.optionalChild(['child']),
        );
      },
      'FractionallySizedBox': (BuildContext context, DataSource source) {
        return FractionallySizedBox(
          alignment: ArgumentDecoders.alignment(source, ['alignment']) ??
              Alignment.center,
          widthFactor: source.v<double>(['widthFactor']),
          heightFactor: source.v<double>(['heightFactor']),
          child: source.child(['child']),
        );
      },
      'GestureDetector': (BuildContext context, DataSource source) {
        return GestureDetector(
          onTap: source.voidHandler(['onTap']),
          onTapDown: source.handler(['onTapDown'],
              (VoidCallback trigger) => (TapDownDetails details) => trigger()),
          onTapUp: source.handler(['onTapUp'],
              (VoidCallback trigger) => (TapUpDetails details) => trigger()),
          onTapCancel: source.voidHandler(['onTapCancel']),
          onDoubleTap: source.voidHandler(['onDoubleTap']),
          onLongPress: source.voidHandler(['onLongPress']),
          behavior: ArgumentDecoders.enumValue<HitTestBehavior>(
              HitTestBehavior.values, source, ['behavior']),
          child: source.optionalChild(['child']),
        );
      },
      'GridView': (BuildContext context, DataSource source) {
        return GridView.builder(
          scrollDirection: ArgumentDecoders.enumValue<Axis>(
                  Axis.values, source, ['scrollDirection']) ??
              Axis.vertical,
          reverse: source.v<bool>(['reverse']) ?? false,
          primary: source.v<bool>(['primary']),
          shrinkWrap: source.v<bool>(['shrinkWrap']) ?? false,
          padding: ArgumentDecoders.edgeInsets(source, ['padding']),
          gridDelegate:
              ArgumentDecoders.gridDelegate(source, ['gridDelegate']) ??
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) =>
              source.child(['children', index]),
          itemCount: source.length(['children']),
          addAutomaticKeepAlives:
              source.v<bool>(['addAutomaticKeepAlives']) ?? true,
          addRepaintBoundaries:
              source.v<bool>(['addRepaintBoundaries']) ?? true,
          addSemanticIndexes: source.v<bool>(['addSemanticIndexes']) ?? true,
          cacheExtent: source.v<double>(['cacheExtent']),
          semanticChildCount: source.v<int>(['semanticChildCount']),
          dragStartBehavior: ArgumentDecoders.enumValue<DragStartBehavior>(
                  DragStartBehavior.values, source, ['dragStartBehavior']) ??
              DragStartBehavior.start,
          keyboardDismissBehavior:
              ArgumentDecoders.enumValue<ScrollViewKeyboardDismissBehavior>(
                      ScrollViewKeyboardDismissBehavior.values,
                      source,
                      ['keyboardDismissBehavior']) ??
                  ScrollViewKeyboardDismissBehavior.manual,
          restorationId: source.v<String>(['restorationId']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.hardEdge,
        );
      },
      'Icon': (BuildContext context, DataSource source) {
        return Icon(
          ArgumentDecoders.iconData(source, []) ?? Icons.flutter_dash,
          size: source.v<double>(['size']),
          color: ArgumentDecoders.color(source, ['color']),
          semanticLabel: source.v<String>(['semanticLabel']),
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
        );
      },
      'IconTheme': (BuildContext context, DataSource source) {
        return IconTheme(
          data: ArgumentDecoders.iconThemeData(source, []) ??
              const IconThemeData(),
          child: source.child(['child']),
        );
      },
      'IntrinsicHeight': (BuildContext context, DataSource source) {
        return IntrinsicHeight(
          child: source.optionalChild(['child']),
        );
      },
      'IntrinsicWidth': (BuildContext context, DataSource source) {
        return IntrinsicWidth(
          stepWidth: source.v<double>(['width']),
          stepHeight: source.v<double>(['height']),
          child: source.optionalChild(['child']),
        );
      },
      'Image': (BuildContext context, DataSource source) {
        return Image(
          image: ArgumentDecoders.imageProvider(source, []) ??
              const AssetImage('error.png'),
          semanticLabel: source.v<String>(['semanticLabel']),
          excludeFromSemantics:
              source.v<bool>(['excludeFromSemantics']) ?? false,
          width: source.v<double>(['width']),
          height: source.v<double>(['height']),
          color: ArgumentDecoders.color(source, ['color']),
          colorBlendMode: ArgumentDecoders.enumValue<BlendMode>(
              BlendMode.values, source, ['blendMode']),
          fit: ArgumentDecoders.enumValue<BoxFit>(
              BoxFit.values, source, ['fit']),
          alignment: ArgumentDecoders.alignment(source, ['alignment']) ??
              Alignment.center,
          repeat: ArgumentDecoders.enumValue<ImageRepeat>(
                  ImageRepeat.values, source, ['repeat']) ??
              ImageRepeat.noRepeat,
          centerSlice: ArgumentDecoders.rect(source, ['centerSlice']),
          matchTextDirection: source.v<bool>(['matchTextDirection']) ?? false,
          gaplessPlayback: source.v<bool>(['gaplessPlayback']) ?? false,
          isAntiAlias: source.v<bool>(['isAntiAlias']) ?? false,
          filterQuality: ArgumentDecoders.enumValue<FilterQuality>(
                  FilterQuality.values, source, ['filterQuality']) ??
              FilterQuality.low,
        );
      },
      'ListBody': (BuildContext context, DataSource source) {
        return ListBody(
          mainAxis: ArgumentDecoders.enumValue<Axis>(
                  Axis.values, source, ['mainAxis']) ??
              Axis.vertical,
          reverse: source.v<bool>(['reverse']) ?? false,
          children: source.childList(['children']),
        );
      },
      'ListView': (BuildContext context, DataSource source) {
        return ListView.builder(
          scrollDirection: ArgumentDecoders.enumValue<Axis>(
                  Axis.values, source, ['scrollDirection']) ??
              Axis.vertical,
          reverse: source.v<bool>(['reverse']) ?? false,
          primary: source.v<bool>(['primary']),
          shrinkWrap: source.v<bool>(['shrinkWrap']) ?? false,
          padding: ArgumentDecoders.edgeInsets(source, ['padding']),
          itemExtent: source.v<double>(['itemExtent']),
          prototypeItem: source.optionalChild(['prototypeItem']),
          itemCount: source.length(['children']),
          itemBuilder: (BuildContext context, int index) =>
              source.child(['children', index]),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.hardEdge,
          addAutomaticKeepAlives:
              source.v<bool>(['addAutomaticKeepAlives']) ?? true,
          addRepaintBoundaries:
              source.v<bool>(['addRepaintBoundaries']) ?? true,
          addSemanticIndexes: source.v<bool>(['addSemanticIndexes']) ?? true,
          cacheExtent: source.v<double>(['cacheExtent']),
          semanticChildCount: source.v<int>(['semanticChildCount']),
          dragStartBehavior: ArgumentDecoders.enumValue<DragStartBehavior>(
                  DragStartBehavior.values, source, ['dragStartBehavior']) ??
              DragStartBehavior.start,
          keyboardDismissBehavior:
              ArgumentDecoders.enumValue<ScrollViewKeyboardDismissBehavior>(
                      ScrollViewKeyboardDismissBehavior.values,
                      source,
                      ['keyboardDismissBehavior']) ??
                  ScrollViewKeyboardDismissBehavior.manual,
          restorationId: source.v<String>(['restorationId']),
        );
      },
      'Opacity': (BuildContext context, DataSource source) {
        return AnimatedOpacity(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          opacity: source.v<double>(['opacity']) ?? 0.0,
          onEnd: source.voidHandler(['onEnd']),
          alwaysIncludeSemantics:
              source.v<bool>(['alwaysIncludeSemantics']) ?? true,
        );
      },
      'Padding': (BuildContext context, DataSource source) {
        return AnimatedPadding(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          padding: ArgumentDecoders.edgeInsets(source, ['padding']) ??
              EdgeInsets.zero,
          onEnd: source.voidHandler(['onEnd']),
          child: source.optionalChild(['child']),
        );
      },
      'Placeholder': (BuildContext context, DataSource source) {
        return Placeholder(
          color: ArgumentDecoders.color(source, ['color']) ??
              const Color(0xFF455A64),
          strokeWidth: source.v<double>(['strokeWidth']) ?? 2.0,
          fallbackWidth: source.v<double>(['placeholderWidth']) ?? 400.0,
          fallbackHeight: source.v<double>(['placeholderHeight']) ?? 400.0,
        );
      },
      'Positioned': (BuildContext context, DataSource source) {
        return AnimatedPositionedDirectional(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          start: source.v<double>(['start']),
          top: source.v<double>(['top']),
          end: source.v<double>(['end']),
          bottom: source.v<double>(['bottom']),
          width: source.v<double>(['width']),
          height: source.v<double>(['height']),
          onEnd: source.voidHandler(['onEnd']),
          child: source.child(['child']),
        );
      },
      'Rotation': (BuildContext context, DataSource source) {
        return AnimatedRotation(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          turns: source.v<double>(['turns']) ?? 0.0,
          alignment: (ArgumentDecoders.alignment(source, ['alignment']) ??
                  Alignment.center)
              .resolve(Directionality.of(context)),
          filterQuality: ArgumentDecoders.enumValue<FilterQuality>(
              FilterQuality.values, source, ['filterQuality']),
          onEnd: source.voidHandler(['onEnd']),
          child: source.optionalChild(['child']),
        );
      },
      'Row': (BuildContext context, DataSource source) {
        return Row(
          mainAxisAlignment: ArgumentDecoders.enumValue<MainAxisAlignment>(
                  MainAxisAlignment.values, source, ['mainAxisAlignment']) ??
              MainAxisAlignment.start,
          mainAxisSize: ArgumentDecoders.enumValue<MainAxisSize>(
                  MainAxisSize.values, source, ['mainAxisSize']) ??
              MainAxisSize.max,
          crossAxisAlignment: ArgumentDecoders.enumValue<CrossAxisAlignment>(
                  CrossAxisAlignment.values, source, ['crossAxisAlignment']) ??
              CrossAxisAlignment.center,
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
          verticalDirection: ArgumentDecoders.enumValue<VerticalDirection>(
                  VerticalDirection.values, source, ['verticalDirection']) ??
              VerticalDirection.down,
          textBaseline: ArgumentDecoders.enumValue<TextBaseline>(
              TextBaseline.values, source, ['textBaseline']),
          children: source.childList(['children']),
        );
      },
      'SafeArea': (BuildContext context, DataSource source) {
        return SafeArea(
          left: source.v<bool>(['left']) ?? true,
          top: source.v<bool>(['top']) ?? true,
          right: source.v<bool>(['right']) ?? true,
          bottom: source.v<bool>(['bottom']) ?? true,
          minimum: (ArgumentDecoders.edgeInsets(source, ['minimum']) ??
                  EdgeInsets.zero)
              .resolve(Directionality.of(context)),
          maintainBottomViewPadding:
              source.v<bool>(['maintainBottomViewPadding']) ?? false,
          child: source.child(['child']),
        );
      },
      'Scale': (BuildContext context, DataSource source) {
        return AnimatedScale(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          scale: source.v<double>(['scale']) ?? 1.0,
          alignment: (ArgumentDecoders.alignment(source, ['alignment']) ??
                  Alignment.center)
              .resolve(Directionality.of(context)),
          filterQuality: ArgumentDecoders.enumValue<FilterQuality>(
              FilterQuality.values, source, ['filterQuality']),
          onEnd: source.voidHandler(['onEnd']),
          child: source.optionalChild(['child']),
        );
      },
      'SingleChildScrollView': (BuildContext context, DataSource source) {
        return SingleChildScrollView(
          scrollDirection: ArgumentDecoders.enumValue<Axis>(
                  Axis.values, source, ['scrollDirection']) ??
              Axis.vertical,
          reverse: source.v<bool>(['reverse']) ?? false,
          padding: ArgumentDecoders.edgeInsets(source, ['padding']),
          primary: source.v<bool>(['primary']) ?? true,
          dragStartBehavior: ArgumentDecoders.enumValue<DragStartBehavior>(
                  DragStartBehavior.values, source, ['dragStartBehavior']) ??
              DragStartBehavior.start,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.hardEdge,
          restorationId: source.v<String>(['restorationId']),
          keyboardDismissBehavior:
              ArgumentDecoders.enumValue<ScrollViewKeyboardDismissBehavior>(
                      ScrollViewKeyboardDismissBehavior.values,
                      source,
                      ['keyboardDismissBehavior']) ??
                  ScrollViewKeyboardDismissBehavior.manual,
          child: source.optionalChild(['child']),
        );
      },
      'SizedBox': (BuildContext context, DataSource source) {
        return SizedBox(
          width: source.v<double>(['width']),
          height: source.v<double>(['height']),
          child: source.optionalChild(['child']),
        );
      },
      'SizedBoxExpand': (BuildContext context, DataSource source) {
        return SizedBox.expand(
          child: source.optionalChild(['child']),
        );
      },
      'SizedBoxShrink': (BuildContext context, DataSource source) {
        return SizedBox.shrink(
          child: source.optionalChild(['child']),
        );
      },
      'Spacer': (BuildContext context, DataSource source) {
        return Spacer(
          flex: source.v<int>(['flex']) ?? 1,
        );
      },
      'Stack': (BuildContext context, DataSource source) {
        return Stack(
          alignment: ArgumentDecoders.alignment(source, ['alignment']) ??
              AlignmentDirectional.topStart,
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
          fit: ArgumentDecoders.enumValue<StackFit>(
                  StackFit.values, source, ['fit']) ??
              StackFit.loose,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.hardEdge,
          children: source.childList(['children']),
        );
      },
      'Text': (BuildContext context, DataSource source) {
        String? text = source.v<String>(['text']);
        if (text == null) {
          final StringBuffer builder = StringBuffer();
          final int count = source.length(['text']);
          for (int index = 0; index < count; index += 1) {
            builder.write(source.v<String>(['text', index]) ?? '');
          }
          text = builder.toString();
        }
        return Text(
          text,
          style: ArgumentDecoders.textStyle(source, ['style']),
          strutStyle: ArgumentDecoders.strutStyle(source, ['strutStyle']),
          textAlign: ArgumentDecoders.enumValue<TextAlign>(
              TextAlign.values, source, ['textAlign']),
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
          locale: ArgumentDecoders.locale(source, ['locale']),
          softWrap: source.v<bool>(['softWrap']),
          overflow: ArgumentDecoders.enumValue<TextOverflow>(
              TextOverflow.values, source, ['overflow']),
          textScaleFactor: source.v<double>(['textScaleFactor']),
          maxLines: source.v<int>(['maxLines']),
          semanticsLabel: source.v<String>(['semanticsLabel']),
          textWidthBasis: ArgumentDecoders.enumValue<TextWidthBasis>(
              TextWidthBasis.values, source, ['textWidthBasis']),
          textHeightBehavior: ArgumentDecoders.textHeightBehavior(
              source, ['textHeightBehavior']),
        );
      },
      'Wrap': (BuildContext context, DataSource source) {
        return Wrap(
          direction: ArgumentDecoders.enumValue<Axis>(
                  Axis.values, source, ['direction']) ??
              Axis.horizontal,
          alignment: ArgumentDecoders.enumValue<WrapAlignment>(
                  WrapAlignment.values, source, ['alignment']) ??
              WrapAlignment.start,
          spacing: source.v<double>(['spacing']) ?? 0.0,
          runAlignment: ArgumentDecoders.enumValue<WrapAlignment>(
                  WrapAlignment.values, source, ['runAlignment']) ??
              WrapAlignment.start,
          runSpacing: source.v<double>(['runSpacing']) ?? 0.0,
          crossAxisAlignment: ArgumentDecoders.enumValue<WrapCrossAlignment>(
                  WrapCrossAlignment.values, source, ['crossAxisAlignment']) ??
              WrapCrossAlignment.start,
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
          verticalDirection: ArgumentDecoders.enumValue<VerticalDirection>(
                  VerticalDirection.values, source, ['verticalDirection']) ??
              VerticalDirection.down,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          children: source.childList(['children']),
        );
      },
    };
