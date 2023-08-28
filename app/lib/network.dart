import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:http/http.dart' as http;

import 'package:rfw/rfw.dart';

import 'rfw/material.dart' as m;
import 'rfw/core.dart' as c;

class NetworkExample extends StatefulWidget {
  const NetworkExample({super.key});

  @override
  State<NetworkExample> createState() => _NetworkExampleState();
}

class _NetworkExampleState extends State<NetworkExample> {
  final _runtime = Runtime();
  final _data = DynamicContent();
  final _logic = getJavascriptRuntime();
  bool loaded = false;
  static const remoteName = LibraryName(['remote']);

  @override
  void initState() {
    super.initState();
    _runtime.update(
      const LibraryName(['widgets']),
      c.createCoreWidgets(),
    );
    _runtime.update(
      const LibraryName(['material']),
      m.createMaterialWidgets(),
    );
    _update();
  }

  @override
  void reassemble() {
    super.reassemble();
    _update();
  }

  void _update() async {
    const url = 'http://localhost:8080';
    final results = await Future.wait([
      http.get(Uri.parse('$url/counter.js')),
      http.get(Uri.parse('$url/counter.rfw')),
    ]);
    final logicRes = results[0];
    final uiRes = results[1];
    if (logicRes.statusCode != 200 || uiRes.statusCode != 200) {
      return;
    }
    _logic.evaluate(logicRes.body, sourceUrl: 'script.js');
    $state();
    _runtime.update(remoteName, decodeLibraryBlob(uiRes.bodyBytes));
    if (mounted) setState(() => loaded = true);
  }

  void $state() {
    final local = _logic.jsonStringify(_logic.evaluate('state'));
    _data.update('state', jsonDecode(local));
  }

  void onEvent(String name, DynamicMap arguments) async {
    debugPrint('event $name($arguments)');
    _logic.evaluate('$name()');
    $state();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return const Center(child: CircularProgressIndicator());
    }
    final colors = Theme.of(context).colorScheme;
    _data.update('colorScheme', <String, Object>{
      'inversePrimary': colors.inversePrimary.value,
      'inverseSurface': colors.inverseSurface.value,
      'onInverseSurface': colors.onInverseSurface.value,
      'primary': colors.primary.value,
      'onPrimary': colors.onPrimary.value,
      'primaryContainer': colors.primaryContainer.value,
      'onPrimaryContainer': colors.onPrimaryContainer.value,
      'secondary': colors.secondary.value,
      'onSecondary': colors.onSecondary.value,
      'secondaryContainer': colors.secondaryContainer.value,
      'onSecondaryContainer': colors.onSecondaryContainer.value,
      'tertiary': colors.tertiary.value,
      'onTertiary': colors.onTertiary.value,
      'tertiaryContainer': colors.tertiaryContainer.value,
      'onTertiaryContainer': colors.onTertiaryContainer.value,
      'error': colors.error.value,
      'onError': colors.onError.value,
      'errorContainer': colors.errorContainer.value,
      'onErrorContainer': colors.onErrorContainer.value,
      'background': colors.background.value,
      'onBackground': colors.onBackground.value,
      'surface': colors.surface.value,
      'onSurface': colors.onSurface.value,
      'outline': colors.outline.value,
      'outlineVariant': colors.outlineVariant.value,
      'scrim': colors.scrim.value,
      'shadow': colors.shadow.value,
    });
    return Container(
      color: colors.background,
      child: RemoteWidget(
        runtime: _runtime,
        data: _data,
        widget: const FullyQualifiedWidgetName(remoteName, 'root'),
        onEvent: onEvent,
      ),
    );
  }
}
