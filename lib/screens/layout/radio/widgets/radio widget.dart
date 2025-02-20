import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../api manager/models/radio_model.dart';
import '../../../../core/theme/app_colors.dart';

class Radiowidget extends StatefulWidget {
  final List<RadioModel> radios;

  const Radiowidget({Key? key, required this.radios}) : super(key: key);

  @override
  _RadiowidgetState createState() => _RadiowidgetState();
}

class _RadiowidgetState extends State<Radiowidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentPlayingIndex;
  bool isPlaying = false;
  bool isMuted = false;

  Future<void> _play(int index) async {
    try {
      if (_currentPlayingIndex == index && isPlaying) {
        _pause();
        return;
      }

      await _audioPlayer.stop();

      setState(() {
        _currentPlayingIndex = index;
        isPlaying = true;
      });

      await _audioPlayer.setUrl(widget.radios[index].url);
      await _audioPlayer.play();
    } catch (e) {
      setState(() {
        isPlaying = false;
        _currentPlayingIndex = null;
      });
      print("something wrong try again later");
    }
  }

  void _pause() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
      _audioPlayer.setVolume(isMuted ? 0 : 1);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.radios.length,
      itemBuilder: (context, index) {
        bool isSelected = _currentPlayingIndex == index && isPlaying;

        return Container(
          margin: EdgeInsets.all(7),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.coffee,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.radios[index].name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        isSelected ? Icons.pause : Icons.play_arrow_rounded,
                        size: 35,
                      ),
                      onPressed: () => _play(index),
                    ),
                    IconButton(
                      icon: Icon(
                        isMuted ? Icons.volume_off : Icons.volume_up,
                        size: 30,
                      ),
                      onPressed: _toggleMute,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
