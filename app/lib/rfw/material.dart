import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

import 'decoders.dart';

LocalWidgetLibrary createMaterialWidgets() =>
    LocalWidgetLibrary(_materialWidgetsDefinitions);

Map<String, LocalWidgetBuilder> get _materialWidgetsDefinitions =>
    <String, LocalWidgetBuilder>{
      'AboutListTile': (context, source) {
        return AboutListTile(
          icon: source.optionalChild(['icon']),
          applicationName: source.v<String>(['applicationName']),
          applicationVersion: source.v<String>(['applicationVersion']),
          applicationIcon: source.optionalChild(['applicationIcon']),
          applicationLegalese: source.v<String>(['applicationLegalese']),
          aboutBoxChildren: source.childList(['aboutBoxChildren']),
          dense: source.v<bool>(['dense']),
          child: source.optionalChild(['child']),
        );
      },
      'AppBar': (context, source) {
        return AppBar(
          leading: source.optionalChild(['leading']),
          automaticallyImplyLeading:
              source.v<bool>(['automaticallyImplyLeading']) ?? true,
          title: source.optionalChild(['title']),
          actions: source.childList(['actions']),
          elevation: source.v<double>(['elevation']),
          shadowColor: ArgumentDecoders.color(source, ['shadowColor']),
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
          iconTheme: ArgumentDecoders.iconThemeData(source, ['iconTheme']),
          actionsIconTheme:
              ArgumentDecoders.iconThemeData(source, ['actionsIconTheme']),
          primary: source.v<bool>(['primary']) ?? true,
          centerTitle: source.v<bool>(['centerTitle']),
          excludeHeaderSemantics:
              source.v<bool>(['excludeHeaderSemantics']) ?? false,
          titleSpacing: source.v<double>(['titleSpacing']),
          toolbarOpacity: source.v<double>(['toolbarOpacity']) ?? 1.0,
          toolbarHeight: source.v<double>(['toolbarHeight']),
          leadingWidth: source.v<double>(['leadingWidth']),
          toolbarTextStyle:
              ArgumentDecoders.textStyle(source, ['toolbarTextStyle']),
          titleTextStyle:
              ArgumentDecoders.textStyle(source, ['titleTextStyle']),
        );
      },
      'ButtonBar': (context, source) {
        return ButtonBar(
          alignment: ArgumentDecoders.enumValue<MainAxisAlignment>(
                  MainAxisAlignment.values, source, ['alignment']) ??
              MainAxisAlignment.start,
          mainAxisSize: ArgumentDecoders.enumValue<MainAxisSize>(
                  MainAxisSize.values, source, ['mainAxisSize']) ??
              MainAxisSize.max,
          buttonMinWidth: source.v<double>(['buttonMinWidth']),
          buttonHeight: source.v<double>(['buttonHeight']),
          buttonPadding: ArgumentDecoders.edgeInsets(source, ['buttonPadding']),
          buttonAlignedDropdown:
              source.v<bool>(['buttonAlignedDropdown']) ?? false,
          layoutBehavior: ArgumentDecoders.enumValue<ButtonBarLayoutBehavior>(
              ButtonBarLayoutBehavior.values, source, ['layoutBehavior']),
          overflowDirection: ArgumentDecoders.enumValue<VerticalDirection>(
              VerticalDirection.values, source, ['overflowDirection']),
          overflowButtonSpacing: source.v<double>(['overflowButtonSpacing']),
          children: source.childList(['children']),
        );
      },
      'Card': (context, source) {
        return Card(
          color: ArgumentDecoders.color(source, ['color']),
          shadowColor: ArgumentDecoders.color(source, ['shadowColor']),
          elevation: source.v<double>(['elevation']),
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          borderOnForeground: source.v<bool>(['borderOnForeground']) ?? true,
          margin: ArgumentDecoders.edgeInsets(source, ['margin']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          semanticContainer: source.v<bool>(['semanticContainer']) ?? true,
          child: source.optionalChild(['child']),
        );
      },
      'CircularProgressIndicator': (context, source) {
        return CircularProgressIndicator(
          value: source.v<double>(['value']),
          color: ArgumentDecoders.color(source, ['color']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          strokeWidth: source.v<double>(['strokeWidth']) ?? 4.0,
          semanticsLabel: source.v<String>(['semanticsLabel']),
          semanticsValue: source.v<String>(['semanticsValue']),
        );
      },
      'Divider': (context, source) {
        return Divider(
          height: source.v<double>(['height']),
          thickness: source.v<double>(['thickness']),
          indent: source.v<double>(['indent']),
          endIndent: source.v<double>(['endIndent']),
          color: ArgumentDecoders.color(source, ['color']),
        );
      },
      'Drawer': (context, source) {
        return Drawer(
          elevation: source.v<double>(['elevation']) ?? 16.0,
          semanticLabel: source.v<String>(['semanticLabel']),
          child: source.optionalChild(['child']),
        );
      },
      'DrawerHeader': (context, source) {
        return DrawerHeader(
          duration: ArgumentDecoders.duration(source, ['duration'], context),
          curve: ArgumentDecoders.curve(source, ['curve'], context),
          decoration: ArgumentDecoders.decoration(source, ['decoration']),
          margin: ArgumentDecoders.edgeInsets(source, ['margin']) ??
              const EdgeInsets.only(bottom: 8.0),
          padding: ArgumentDecoders.edgeInsets(source, ['padding']) ??
              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: source.optionalChild(['child']),
        );
      },
      'ElevatedButton': (context, source) {
        return ElevatedButton(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          child: source.child(['child']),
        );
      },
      'InkWell': (context, source) {
        return InkWell(
          onTap: source.voidHandler(['onTap']),
          onDoubleTap: source.voidHandler(['onDoubleTap']),
          onLongPress: source.voidHandler(['onLongPress']),
          onTapDown: source.handler(['onTapDown'],
              (VoidCallback trigger) => (TapDownDetails details) => trigger()),
          onTapCancel: source.voidHandler(['onTapCancel']),
          radius: source.v<double>(['radius']),
          borderRadius: ArgumentDecoders.borderRadius(source, ['borderRadius'])
              ?.resolve(Directionality.of(context)),
          customBorder: ArgumentDecoders.shapeBorder(source, ['customBorder']),
          enableFeedback: source.v<bool>(['enableFeedback']) ?? true,
          excludeFromSemantics:
              source.v<bool>(['excludeFromSemantics']) ?? false,
          autofocus: source.v<bool>(['autofocus']) ?? false,
          child: source.optionalChild(['child']),
        );
      },
      'LinearProgressIndicator': (context, source) {
        return LinearProgressIndicator(
          value: source.v<double>(['value']),
          color: ArgumentDecoders.color(source, ['color']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          minHeight: source.v<double>(['minHeight']),
          semanticsLabel: source.v<String>(['semanticsLabel']),
          semanticsValue: source.v<String>(['semanticsValue']),
        );
      },
      'ListTile': (context, source) {
        return ListTile(
          leading: source.optionalChild(['leading']),
          title: source.optionalChild(['title']),
          subtitle: source.optionalChild(['subtitle']),
          trailing: source.optionalChild(['trailing']),
          isThreeLine: source.v<bool>(['isThreeLine']) ?? false,
          dense: source.v<bool>(['dense']),
          visualDensity:
              ArgumentDecoders.visualDensity(source, ['visualDensity']),
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          contentPadding:
              ArgumentDecoders.edgeInsets(source, ['contentPadding']),
          enabled: source.v<bool>(['enabled']) ?? true,
          onTap: source.voidHandler(['onTap']),
          onLongPress: source.voidHandler(['onLongPress']),
          selected: source.v<bool>(['selected']) ?? false,
          focusColor: ArgumentDecoders.color(source, ['focusColor']),
          hoverColor: ArgumentDecoders.color(source, ['hoverColor']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          tileColor: ArgumentDecoders.color(source, ['tileColor']),
          selectedTileColor:
              ArgumentDecoders.color(source, ['selectedTileColor']),
          enableFeedback: source.v<bool>(['enableFeedback']),
          horizontalTitleGap: source.v<double>(['horizontalTitleGap']),
          minVerticalPadding: source.v<double>(['minVerticalPadding']),
          minLeadingWidth: source.v<double>(['minLeadingWidth']),
        );
      },
      'Scaffold': (context, source) {
        final Widget? appBarWidget = source.optionalChild(['appBar']);
        final List<Widget> persistentFooterButtons =
            source.childList(['persistentFooterButtons']);
        return Scaffold(
          appBar: appBarWidget == null
              ? null
              : PreferredSize(
                  preferredSize: Size.fromHeight(
                      source.v<double>(['bottomHeight']) ?? 56.0),
                  child: appBarWidget,
                ),
          body: source.optionalChild(['body']),
          floatingActionButton: source.optionalChild(['floatingActionButton']),
          persistentFooterButtons:
              persistentFooterButtons.isEmpty ? null : persistentFooterButtons,
          drawer: source.optionalChild(['drawer']),
          endDrawer: source.optionalChild(['endDrawer']),
          bottomNavigationBar: source.optionalChild(['bottomNavigationBar']),
          bottomSheet: source.optionalChild(['bottomSheet']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          resizeToAvoidBottomInset:
              source.v<bool>(['resizeToAvoidBottomInset']),
          primary: source.v<bool>(['primary']) ?? true,
          drawerDragStartBehavior:
              ArgumentDecoders.enumValue<DragStartBehavior>(
                      DragStartBehavior.values,
                      source,
                      ['drawerDragStartBehavior']) ??
                  DragStartBehavior.start,
          extendBody: source.v<bool>(['extendBody']) ?? false,
          extendBodyBehindAppBar:
              source.v<bool>(['extendBodyBehindAppBar']) ?? false,
          drawerScrimColor:
              ArgumentDecoders.color(source, ['drawerScrimColor']),
          drawerEdgeDragWidth: source.v<double>(['drawerEdgeDragWidth']),
          drawerEnableOpenDragGesture:
              source.v<bool>(['drawerEnableOpenDragGesture']) ?? true,
          endDrawerEnableOpenDragGesture:
              source.v<bool>(['endDrawerEnableOpenDragGesture']) ?? true,
          restorationId: source.v<String>(['restorationId']),
        );
      },
      'VerticalDivider': (context, source) {
        return VerticalDivider(
          width: source.v<double>(['width']),
          thickness: source.v<double>(['thickness']),
          indent: source.v<double>(['indent']),
          endIndent: source.v<double>(['endIndent']),
          color: ArgumentDecoders.color(source, ['color']),
        );
      },
      'FilledButton': (context, source) {
        return FilledButton(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.filledButtonStyle(
              source, ['style'], context),
          child: source.child(['child']),
        );
      },
      'FilledButtonIcon': (context, source) {
        return FilledButton.icon(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.filledButtonStyle(
              source, ['style'], context),
          icon: source.child(['icon']),
          label: source.child(['label']),
        );
      },
      'FilledButtonTonal': (context, source) {
        return FilledButton.tonal(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.filledButtonStyle(
              source, ['style'], context),
          child: source.child(['child']),
        );
      },
      'FilledButtonTonalIcon': (context, source) {
        return FilledButton.tonalIcon(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.filledButtonStyle(
              source, ['style'], context),
          icon: source.child(['icon']),
          label: source.child(['label']),
        );
      },
      'TextButton': (context, source) {
        return TextButton(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.textButtonStyle(
              source, ['style'], context),
          child: source.child(['child']),
        );
      },
      'TextButtonIcon': (context, source) {
        return TextButton.icon(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.textButtonStyle(
              source, ['style'], context),
          icon: source.child(['icon']),
          label: source.child(['label']),
        );
      },
      'OutlinedButton': (context, source) {
        return OutlinedButton(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.outlinedButtonStyle(
              source, ['style'], context),
          child: source.child(['child']),
        );
      },
      'OutlinedButtonIcon': (context, source) {
        return OutlinedButton.icon(
          onPressed: source.voidHandler(['onPressed']),
          onLongPress: source.voidHandler(['onLongPress']),
          autofocus: source.v<bool>(['autofocus']) ?? false,
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          style: CustomArgumentDecoders.outlinedButtonStyle(
              source, ['style'], context),
          icon: source.child(['icon']),
          label: source.child(['label']),
        );
      },
      'FloatingActionButton': (context, source) {
        return FloatingActionButton(
          onPressed: source.voidHandler(['onPressed']),
          tooltip: source.v<String>(['tooltip']),
          foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          focusColor: ArgumentDecoders.color(source, ['focusColor']),
          hoverColor: ArgumentDecoders.color(source, ['hoverColor']),
          splashColor: ArgumentDecoders.color(source, ['splashColor']),
          heroTag: source.v<String>(['heroTag']),
          elevation: source.v<double>(['elevation']),
          focusElevation: source.v<double>(['focusElevation']),
          hoverElevation: source.v<double>(['hoverElevation']),
          highlightElevation: source.v<double>(['highlightElevation']),
          disabledElevation: source.v<double>(['disabledElevation']),
          mini: source.v<bool>(['mini']) ?? false,
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          autofocus: source.v<bool>(['autofocus']) ?? false,
          mouseCursor:
              CustomArgumentDecoders.mouseCursor(source, ['mouseCursor']),
          materialTapTargetSize:
              ArgumentDecoders.enumValue<MaterialTapTargetSize>(
                  MaterialTapTargetSize.values,
                  source,
                  ['materialTapTargetSize']),
          isExtended: source.v<bool>(['isExtended']) ?? false,
          enableFeedback: source.v<bool>(['enableFeedback']),
          child: source.child(['child']),
        );
      },
      'FloatingActionButtonExtended': (context, source) {
        return FloatingActionButton.extended(
          onPressed: source.voidHandler(['onPressed']),
          tooltip: source.v<String>(['tooltip']),
          foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          focusColor: ArgumentDecoders.color(source, ['focusColor']),
          hoverColor: ArgumentDecoders.color(source, ['hoverColor']),
          splashColor: ArgumentDecoders.color(source, ['splashColor']),
          heroTag: source.v<String>(['heroTag']),
          elevation: source.v<double>(['elevation']),
          focusElevation: source.v<double>(['focusElevation']),
          hoverElevation: source.v<double>(['hoverElevation']),
          highlightElevation: source.v<double>(['highlightElevation']),
          disabledElevation: source.v<double>(['disabledElevation']),
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          autofocus: source.v<bool>(['autofocus']) ?? false,
          mouseCursor:
              CustomArgumentDecoders.mouseCursor(source, ['mouseCursor']),
          materialTapTargetSize:
              ArgumentDecoders.enumValue<MaterialTapTargetSize>(
                  MaterialTapTargetSize.values,
                  source,
                  ['materialTapTargetSize']),
          isExtended: source.v<bool>(['isExtended']) ?? true,
          enableFeedback: source.v<bool>(['enableFeedback']),
          label: source.child(['label']),
          icon: source.child(['icon']),
        );
      },
      'FloatingActionButtonSmall': (context, source) {
        return FloatingActionButton.small(
          onPressed: source.voidHandler(['onPressed']),
          tooltip: source.v<String>(['tooltip']),
          foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          focusColor: ArgumentDecoders.color(source, ['focusColor']),
          hoverColor: ArgumentDecoders.color(source, ['hoverColor']),
          splashColor: ArgumentDecoders.color(source, ['splashColor']),
          heroTag: source.v<String>(['heroTag']),
          elevation: source.v<double>(['elevation']),
          focusElevation: source.v<double>(['focusElevation']),
          hoverElevation: source.v<double>(['hoverElevation']),
          highlightElevation: source.v<double>(['highlightElevation']),
          disabledElevation: source.v<double>(['disabledElevation']),
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          autofocus: source.v<bool>(['autofocus']) ?? false,
          mouseCursor:
              CustomArgumentDecoders.mouseCursor(source, ['mouseCursor']),
          materialTapTargetSize:
              ArgumentDecoders.enumValue<MaterialTapTargetSize>(
                  MaterialTapTargetSize.values,
                  source,
                  ['materialTapTargetSize']),
          enableFeedback: source.v<bool>(['enableFeedback']),
          child: source.child(['child']),
        );
      },
      'FloatingActionButtonLarge': (context, source) {
        return FloatingActionButton.large(
          onPressed: source.voidHandler(['onPressed']),
          tooltip: source.v<String>(['tooltip']),
          foregroundColor: ArgumentDecoders.color(source, ['foregroundColor']),
          backgroundColor: ArgumentDecoders.color(source, ['backgroundColor']),
          focusColor: ArgumentDecoders.color(source, ['focusColor']),
          hoverColor: ArgumentDecoders.color(source, ['hoverColor']),
          splashColor: ArgumentDecoders.color(source, ['splashColor']),
          heroTag: source.v<String>(['heroTag']),
          elevation: source.v<double>(['elevation']),
          focusElevation: source.v<double>(['focusElevation']),
          hoverElevation: source.v<double>(['hoverElevation']),
          highlightElevation: source.v<double>(['highlightElevation']),
          disabledElevation: source.v<double>(['disabledElevation']),
          shape: ArgumentDecoders.shapeBorder(source, ['shape']),
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          autofocus: source.v<bool>(['autofocus']) ?? false,
          mouseCursor:
              CustomArgumentDecoders.mouseCursor(source, ['mouseCursor']),
          materialTapTargetSize:
              ArgumentDecoders.enumValue<MaterialTapTargetSize>(
                  MaterialTapTargetSize.values,
                  source,
                  ['materialTapTargetSize']),
          enableFeedback: source.v<bool>(['enableFeedback']),
          child: source.child(['child']),
        );
      },
      'InteractiveViewer': (context, source) {
        return InteractiveViewer(
          clipBehavior: ArgumentDecoders.enumValue<Clip>(
                  Clip.values, source, ['clipBehavior']) ??
              Clip.none,
          alignPanAxis: source.v<bool>(['alignPanAxis']) ?? false,
          panAxis: ArgumentDecoders.enumValue<PanAxis>(
                  PanAxis.values, source, ['panAxis']) ??
              PanAxis.free,
          boundaryMargin:
              CustomArgumentDecoders.edgeInsets(source, ['boundaryMargin']) ??
                  EdgeInsets.zero,
          constrained: source.v<bool>(['constrained']) ?? true,
          maxScale: source.v<double>(['maxScale']) ?? 2.5,
          minScale: source.v<double>(['minScale']) ?? 0.8,
          interactionEndFrictionCoefficient:
              source.v<double>(['interactionEndFrictionCoefficient']) ??
                  0.0000135,
          panEnabled: source.v<bool>(['panEnabled']) ?? true,
          scaleEnabled: source.v<bool>(['scaleEnabled']) ?? true,
          scaleFactor: source.v<double>(['scaleFactor']) ?? 0.8,
          alignment:
              ArgumentDecoders.alignment(source, ['alignment']) as Alignment?,
          trackpadScrollCausesScale:
              source.v<bool>(['trackpadScrollCausesScale']) ?? false,
          child: source.child(['child']),
        );
      },
    };
