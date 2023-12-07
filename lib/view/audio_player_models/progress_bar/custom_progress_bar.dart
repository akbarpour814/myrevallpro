//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';

//------/view/audio_player_models/progress_bar
import '/view/audio_player_models/progress_bar/progress_bar_state.dart';
import '/view/audio_player_models/progress_bar/progress_notifier.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class CustomProgressBar extends StatefulWidget {
  late AudioPlayer audioPlayer;
  late TimeLabelLocation timeLabelLocation;
  Color? baseBarColor;
  Color? progressBarColor;
  Color? bufferedBarColor;
  Color? thumbColor;
  Color? thumbGlowColor;

  CustomProgressBar({
    Key? key,
    required this.audioPlayer,
    required this.timeLabelLocation,
    this.baseBarColor,
    this.progressBarColor,
    this.bufferedBarColor,
    this.thumbColor,
    this.thumbGlowColor,
  }) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  final ProgressNotifier _progressNotifier = ProgressNotifier();

  void seek(Duration position) {
    widget.audioPlayer.seek(position);
  }

  void _listenForChangesInPlayerPosition() {
    widget.audioPlayer.positionStream.listen((position) {
      final ProgressBarState oldState = _progressNotifier.value;
      _progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    widget.audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final ProgressBarState oldState = _progressNotifier.value;
      _progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    widget.audioPlayer.durationStream.listen((totalDuration) {
      final ProgressBarState oldState = _progressNotifier.value;
      _progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  @override
  void initState() {
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: seek,
          timeLabelLocation: widget.timeLabelLocation,
          baseBarColor: widget.baseBarColor,
          progressBarColor: widget.progressBarColor,
          bufferedBarColor: widget.bufferedBarColor,
          thumbColor: widget.thumbColor,
          thumbGlowColor: widget.thumbGlowColor,
          thumbGlowRadius: 20.0,
          barHeight: 2.5,
          timeLabelTextStyle: TextStyle(
              color: Theme.of(context).primaryColor, fontFamily: fontFamily),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CustomProgressBarBottom extends StatefulWidget {
  late AudioPlayer audioPlayer;
  late TimeLabelLocation timeLabelLocation;
  Color? baseBarColor;
  Color? progressBarColor;
  Color? bufferedBarColor;
  Color? thumbColor;
  Color? thumbGlowColor;

  CustomProgressBarBottom({
    Key? key,
    required this.audioPlayer,
    required this.timeLabelLocation,
    this.baseBarColor,
    this.progressBarColor,
    this.bufferedBarColor,
    this.thumbColor,
    this.thumbGlowColor,
  }) : super(key: key);

  @override
  _CustomProgressBarBottomState createState() =>
      _CustomProgressBarBottomState();
}

class _CustomProgressBarBottomState extends State<CustomProgressBarBottom> {
  final ProgressNotifier _progressNotifier = ProgressNotifier();

  void seek(Duration position) {
    widget.audioPlayer.seek(position);
  }

  void _listenForChangesInPlayerPosition() {
    widget.audioPlayer.positionStream.listen((position) {
      final ProgressBarState oldState = _progressNotifier.value;
      _progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    widget.audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final ProgressBarState oldState = _progressNotifier.value;
      _progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    widget.audioPlayer.durationStream.listen((totalDuration) {
      final ProgressBarState oldState = _progressNotifier.value;
      _progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  @override
  void initState() {
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: seek,
          timeLabelLocation: widget.timeLabelLocation,
          baseBarColor: widget.baseBarColor,
          progressBarColor: widget.progressBarColor,
          bufferedBarColor: widget.bufferedBarColor,
          thumbColor: widget.thumbColor,
          thumbGlowColor: widget.thumbGlowColor,
          thumbGlowRadius: 20.0,
          barHeight: 2.5,
          timeLabelTextStyle: TextStyle(
              color: Theme.of(context).primaryColor, fontFamily: fontFamily),
        );
      },
    );
  }
}
