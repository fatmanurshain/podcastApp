import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_waveforms/audio_waveforms.dart' as audio;
import 'player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(controller.image, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              controller.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              controller.subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            audio.AudioFileWaveforms(
              size: const Size(double.infinity, 70),
              playerController: controller.audioPlayerController,
              enableSeekGesture: true,
              waveformType: audio.WaveformType.long,
              playerWaveStyle: const audio.PlayerWaveStyle(
                waveThickness: 2,
                fixedWaveColor: Colors.white,
                liveWaveColor: Colors.blueAccent,
                spacing: 4.0,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Obx(() => IconButton(
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    iconSize: 48,
                    onPressed: controller.playPause,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
