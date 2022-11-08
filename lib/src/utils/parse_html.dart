import 'package:html/parser.dart';

class ParserHtml{
  String parserHtml(String input){
    final document = parse(input);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}