// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../models/audio_model.dart';

part 'state.dart';

class ListeningCubit extends Cubit<ListeningState> {
  AudioModel audio;
  ListeningCubit({required this.audio}) : super(ListeningState(audio: audio)) {
    onPlay();
  }

  final player = AudioPlayer();
  final adPlayer = AudioPlayer();
  Timer? timer;
  startTimer() async {
    emit(state.copyWith(duration: 0));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!state.isPaused) {
        try {
          if (state.duration < (state.audio.length)) {
            emit(state.copyWith(duration: state.duration + 1));
          } else {
            stopTimer();
          }
        } catch (e) {
          stopTimer();
        }
      }
    });
  }

  Future<void> setPlayer({Duration? position}) async {
    if (position == null) {
      await player.setUrl(audio.link);
    } else {
      await player.seek(position);
    }
    player.play();
  }

  onPlay() async {
    if (timer == null) {
      await setPlayer();
      await startTimer();
    } else {
      if (state.isPaused) {
        await setPlayer(position: Duration(seconds: state.duration));
      } else {
        await player.pause();
      }
      emit(state.copyWith(isPaused: !state.isPaused));
    }
  }

  stopTimer() {
    timer?.cancel();
    player.stop();
    adPlayer.stop();
    try {
      emit(state.copyWith(refreshed: !state.refreshed));
    } catch (e) {
      //
    }
    timer = null;
  }
}
