import 'package:translator/translator.dart';


class Translator {

  final translator = new GoogleTranslator();

 Future<String> translate(String lang, String originText) async{
   var translation = await translator.translate(originText, to: lang, from: 'en');
   print("value trans: "+translation);
   return translation;
 }

}