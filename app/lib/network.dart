import 'package:flutter/material.dart';
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
  bool loaded = false;
  int count = 0;
  final route = Uri.parse('http://localhost:8080/');

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  void reassemble() {
    super.reassemble();
    _update();
  }

  static const coreName = LibraryName(['widgets']);
  static const materialName = LibraryName(['material']);
  static const remoteName = LibraryName(['remote']);

  void _update() async {
    _runtime.update(coreName, c.createCoreWidgets());
    _runtime.update(materialName, m.createMaterialWidgets());
    await fetchWidget();
    if (mounted) setState(() => loaded = true);
  }

  Future<void> fetchWidget() async {
    final res = await http.get(route, headers: {
      'COUNTER_VALUE': count.toString(),
    });
    if (res.statusCode == 200) {
      count = int.tryParse(res.headers['counter_value'].toString()) ?? count;
      _data.update('counter', <String, Object>{'value': '$count'});
      _runtime.update(remoteName, decodeLibraryBlob(res.bodyBytes));
    }
  }

  void onEvent(String name, DynamicMap arguments) async {
    debugPrint('user triggered event "$name" with data: $arguments');
    if (name == 'click') {
      final res = await http.post(route, headers: {
        'COUNTER_VALUE': count.toString(),
      });
      if (res.statusCode == 200) {
        count = int.tryParse(res.headers['counter_value'].toString()) ?? count;
        _data.update('counter', <String, Object>{'value': '$count'});
        _runtime.update(remoteName, decodeLibraryBlob(res.bodyBytes));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
    if (!loaded) {
      return const Center(child: CircularProgressIndicator());
    }
    const root = FullyQualifiedWidgetName(remoteName, 'root');
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: RemoteWidget(
        runtime: _runtime,
        data: _data,
        widget: root,
        onEvent: onEvent,
      ),
    );
  }
}
