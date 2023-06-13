import 'package:zeder/core/core.dart';
import 'package:zeder/domain/domain.dart';

import '../../../../design_system/widgets/footer_padrao/footer_padrao_controller.dart';

class FooterPadraoServicoController extends FooterPadraoController {
  final ServicoEntity servico;

  FooterPadraoServicoController({required this.servico});

  @override
  String get descricao => servico.descricao;

  @override
  String get valor => servico.servicePrice == servico.servicePrice ? servico.servicePrice.toString() : "${servico.servicePrice} - ${servico.servicePrice}";

  @override
  String get data => 'Amanhã'; // servico.dataInicial.isAtSameMomentAs(servico.dataFinal) ? servico.dataInicial.toString() : "${servico.dataInicial.toString()} - ${servico.dataFinal.toString()}";

  @override
  String? get urlAudio => 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'; // servico.urlAudio;

  @override
  List<String> get urlsFotos => [
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      ]; // servico.urlsFotos;

  @override
  List<String> get urlsVideos => [
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ]; // servico.urlsVideos;

  @override
  void onEnviarAudio() {}

  @override
  void onEnviarFotos() {}

  @override
  void onEnviarVideos() {}

  @override
  void onExcluirAudio(String urlAudio) {}

  @override
  void onExcluirFoto(String urlFoto) {}

  @override
  void onExcluirVideo(String urlVideo) {}

  @override
  bool get permiteEnviarAudio => true; // servico.permiteEnviarAudio??

  @override
  bool get permiteEnviarFotos => true; // servico.permiteEnviarFotos??

  @override
  bool get permiteEnviarVideos => true; // servico.permiteEnviarVideos??
}
