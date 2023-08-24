import 'package:dart_frog/dart_frog.dart';
import 'package:rfw/formats.dart';

Response onRequest(RequestContext context) {
  var count = context.request.headers['COUNTER_VALUE'] ?? '0';

  if (context.request.method == HttpMethod.post) {
    count = (int.parse(count) + 1).toString();
  }

  return Response.bytes(
    body: encodeLibraryBlob(parseLibraryFile(template)),
    headers: {'COUNTER_VALUE': count},
  );
}

const template = '''
import widgets;
import material;

widget root = Scaffold(
  appBar: AppBar(
    title: Text(text: ['Counter Example']),
    centerTitle: true,
    backgroundColor: data.colorScheme.inversePrimary,
  ),
  body: Center(
    child: Column(
      mainAxisAlignment: "center",
      children: [
        Text(text: ["You have pushed the button this many times:"]),
        Text(
          text: [data.counter.value],
          style: {
            fontSize: 20.0,
          },
        ),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
     onPressed: event "click" {},
     tooltip: ["Increment"],
     child: Icon(
        icon: 0xe047,
        fontFamily: 'MaterialIcons',
     ),
  ),
);
''';
