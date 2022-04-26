import 'package:assets_audio_player/assets_audio_player.dart';

class SoundController {
  play() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audios/song1.mp3"),
    );
  }

}