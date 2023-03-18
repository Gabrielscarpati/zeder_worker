import 'package:flutter/material.dart';

import '../../../design_system/widgets/buttons.dart';
import 'player_audio.dart';
import 'player_fotos.dart';
import 'player_videos.dart';

class BarraBotoesMedia extends StatelessWidget {
  final BarraBotoesMediaController controller;

  const BarraBotoesMedia({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.urlAudio != null ? PlayerAudio(urlAudio: controller.urlAudio!, onExcluirAudio: controller.onExcluirAudio) : BotaoEnviaMedia.audio(isEnabled: controller.permiteEnviarAudio, onPressed: controller.onEnviarAudio),
        const SizedBox(height: 20),
        controller.urlsFotos.isNotEmpty ? PlayerFotos(urlsFotos: controller.urlsFotos!, onExcluirFoto: controller.onExcluirFoto, onAdicionarFoto: controller.onEnviarFotos) : BotaoEnviaMedia.foto(isEnabled: controller.permiteEnviarFotos, onPressed: controller.onEnviarFotos),
        const SizedBox(height: 20),
        controller.urlsVideos.isNotEmpty ? PlayerVideos(urlsVideos: controller.urlsVideos!, onExcluirVideo: controller.onExcluirVideo, onAdicionarVideo: controller.onEnviarVideos) : BotaoEnviaMedia.video(isEnabled: controller.permiteEnviarVideos, onPressed: controller.onEnviarVideos),
      ],
    );
  }
}

mixin BarraBotoesMediaController {
  String? get urlAudio;
  void onEnviarAudio();
  void onExcluirAudio(String urlAudio);
  bool get permiteEnviarAudio;

  List<String> get urlsFotos;
  void onEnviarFotos();
  void onExcluirFoto(String urlFoto);
  bool get permiteEnviarFotos;

  List<String> get urlsVideos;
  void onEnviarVideos();
  void onExcluirVideo(String urlVideo);
  bool get permiteEnviarVideos;
}

class BotaoEnviaMedia extends StatelessWidget {
  final String texto;
  final String icone;
  final bool isEnabled;
  final VoidCallback onPressed;

  const BotaoEnviaMedia._({
    super.key,
    required this.texto,
    required this.icone,
    required this.isEnabled,
    required this.onPressed,
  });

  factory BotaoEnviaMedia.audio({required VoidCallback onPressed, required bool isEnabled}) {
    return BotaoEnviaMedia._(
      texto: 'MANDAR AUDIO',
      icone: 'microphone',
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  factory BotaoEnviaMedia.foto({required VoidCallback onPressed, required bool isEnabled}) {
    return BotaoEnviaMedia._(
      texto: 'MANDAR FOTO',
      icone: 'camera-party-mode',
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  factory BotaoEnviaMedia.video({required VoidCallback onPressed, required bool isEnabled}) {
    return BotaoEnviaMedia._(
      texto: 'MANDAR VIDEO',
      icone: 'video',
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isEnabled
        ? DSButtonWithIconLargeSecondary(
            text: texto,
            iconName: icone,
            onPressed: onPressed,
          )
        : DSButtonWithIconLargeTertiary(
            text: texto,
            iconName: icone,
            onPressed: onPressed,
          );
  }
}
