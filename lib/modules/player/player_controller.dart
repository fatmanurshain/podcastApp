import 'package:get/get.dart';
import 'package:audio_waveforms/audio_waveforms.dart' as audio;

class PlayerController extends GetxController {
  late final audio.PlayerController audioPlayerController;
  late final String title;
  late final String image;
  late final String subtitle;
  late final String audioPath;

  final isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    title = arguments['title'];
    image = arguments['image'];
    subtitle = arguments['subtitle'];
    audioPath = arguments['audioPath'];

    audioPlayerController = audio.PlayerController();
    _preparePlayer();
  }

  Future<void> _preparePlayer() async {
    await audioPlayerController.preparePlayer(
      path: audioPath,
      shouldExtractWaveform: true,
      volume: 1.0,
    );
  }

  void playPause() {
    if (audioPlayerController.playerState == audio.PlayerState.playing) {
      audioPlayerController.pausePlayer();
      isPlaying.value = false;
    } else {
      audioPlayerController.startPlayer(finishMode: audio.FinishMode.pause);
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    audioPlayerController.dispose();
    super.onClose();
  }
}
