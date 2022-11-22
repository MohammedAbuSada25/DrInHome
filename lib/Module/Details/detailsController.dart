import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart' ;
import 'package:text_to_speech/text_to_speech.dart';
class DetailsController extends GetxController{

  // SpeechToText speechToText = SpeechToText();
  // bool speechEnabled = false;
  // String lastWords = '';
  //
  //
  // /// This has to happen only once per app
  // void _initSpeech() async {
  //   speechEnabled = await speechToText.initialize();
  //   update();
  // }
  //
  // /// Each time to start a speech recognition session
  // void startListening() async {
  //   await speechToText.listen(onResult: onSpeechResult);
  //   update();
  // }
  //
  // /// Manually stop the active speech recognition session
  // /// Note that there are also timeouts that each platform enforces
  // /// and the SpeechToText plugin supports setting timeouts on the
  // /// listen method.
  // void stopListening() async {
  //   await speechToText.stop();
  //   update();
  // }
  //
  // /// This is the callback that the SpeechToText plugin calls when
  // /// the platform returns recognized words.
  // void onSpeechResult(SpeechRecognitionResult result) {
  //   lastWords = result.recognizedWords;
  //   update();
  // }


  TextToSpeech tts = TextToSpeech();
  // String text = "Hello";

  void speak(String text) {
    tts.getLanguages();
    String language = 'ar';
    tts.setLanguage(language);
    tts.speak(text);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // _initSpeech();
  }
}