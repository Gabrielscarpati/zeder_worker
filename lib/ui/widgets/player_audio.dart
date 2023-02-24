import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerAudio extends StatefulWidget {
  final String urlAudio;
  final Function(String) onExcluirAudio;
  const PlayerAudio({
    super.key,
    required this.urlAudio,
    required this.onExcluirAudio,
  });

  @override
  _PlayerAudioState createState() => _PlayerAudioState();
  }

class _PlayerAudioState extends State<PlayerAudio> {

  bool _isPlaying = false;
  String iconPlay = "play";

   final audioPlayer =  AudioPlayer();
  Duration duration = Duration(minutes: 10);
  Duration position = Duration.zero;
  Future<void>? isAudioBuild;

  @override
  void initState(){
    isAudioBuild = audioPlayer.setSourceUrl(widget.urlAudio);
    
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state){
        setState((){
          _isPlaying = state == PlayerState.playing;
          if(_isPlaying){
            iconPlay = "pause";
          }else{
            iconPlay = "play";
          }
          
    });

    });
    audioPlayer.onDurationChanged.listen((event) { 
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) { 
      setState(() {
        position = event;
      });  
    });
    audioPlayer.onPlayerStateChanged.listen(( event) {
      setState((){
        
        
        duration = duration;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((newPosition){
      setState((){
        position = position;
      });
    });
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder(
      future: isAudioBuild,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return Row(children: [
      
      IconButton(onPressed: (){
        setState((){
          if(_isPlaying){
            audioPlayer.pause();
          }else{
            audioPlayer.resume();
          }
          
        });
      }, icon: DSIconFilledPrimary(iconName: iconPlay)),
     
      Slider(min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {

              },
            ),
    IconButton(onPressed: (){}, icon: DSIconFilledPrimary(iconName: "delete")),
    ],) ;
        }else{
          return Container();
        }

    },);
    
  }
}

