//------/packages
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class TextFormat {
  static String textFormat({required String text}) {
    Document document = parse(text);

    text = parse(document.body!.text).documentElement!.text;

    text = text.replaceAll('  ', '');

    return text;
  }
}