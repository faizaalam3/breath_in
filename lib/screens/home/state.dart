part of 'cubit.dart';

class HomeState extends Equatable {
  final List<AudioModel> audios;
  final CrudStatus status;
  final String message;
  const HomeState({this.message = "", this.status = CrudStatus.initial, this.audios = const []});
  HomeState copyWith({String? message, List<AudioModel>? audios, CrudStatus? status}) {
    return HomeState(audios: audios ?? this.audios, status: status ?? this.status, message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [audios, status, message];
}
