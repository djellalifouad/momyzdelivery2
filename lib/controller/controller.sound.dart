import 'package:assets_audio_player/assets_audio_player.dart';

class SoundController {
  var assetsAudioPlayer = AssetsAudioPlayer();

  play() {
    try {
      assetsAudioPlayer.open(
        Audio("assets/sound/awesome.mp3"),
      );
    } catch (e) {}
  }

  stop() {
    try {
      assetsAudioPlayer.stop();
    } catch (e) {}
  }
}
