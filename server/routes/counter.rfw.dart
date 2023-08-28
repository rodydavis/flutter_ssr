import 'package:dart_frog/dart_frog.dart';
import 'package:rfw/formats.dart';

Response onRequest(RequestContext context) {
  return Response.bytes(
    body: encodeLibraryBlob(parseLibraryFile(template)),
    headers: {'Content-Type': 'text/rfw'},
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
          text: [data.state.value],
          style: {
            fontSize: 20.0,
          },
        ),
      ],
    ),
  ),
  floatingActionButton: Row(
    mainAxisSize: "min",
    children: [
      IconButton(
        onPressed: event "decrement" {},
        tooltip: ["Decrement"],
        icon: Icon(
            icon: 0xe516,
            fontFamily: 'MaterialIcons',
        ),
      ),
      IconButton(
        onPressed: event "increment" {},
        tooltip: ["Increment"],
        icon: Icon(
            icon: 0xe047,
            fontFamily: 'MaterialIcons',
        ),
      ),
    ],
  ),
);
''';
