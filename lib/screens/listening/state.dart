part of 'cubit.dart';

class ListeningState extends Equatable {
  final int duration;
  final AudioModel audio;
  final bool refreshed;
  final bool isPaused;
  const ListeningState({required this.audio, this.isPaused = false, this.refreshed = false, this.duration = 0});

  ListeningState copyWith({AudioModel? audio, bool? isPaused, bool? refreshed, int? duration}) {
    return ListeningState(
      audio: audio ?? this.audio,
      refreshed: refreshed ?? this.refreshed,
      isPaused: isPaused ?? this.isPaused,
      duration: duration ?? this.duration,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isPaused, audio, refreshed, duration];
}
