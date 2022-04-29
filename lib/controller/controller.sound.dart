import 'package:assets_audio_player/assets_audio_player.dart';

class SoundController {
  var assetsAudioPlayer = AssetsAudioPlayer();

  play() {
    assetsAudioPlayer.open(
      Audio("assets/sound/awesome.mp3"),
    );
  }

  stop() {
    assetsAudioPlayer.stop();
  }
}
