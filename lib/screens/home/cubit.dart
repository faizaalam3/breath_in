import 'package:breathin/database/collectionPath.dart';
import 'package:breathin/models/audio_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/enums.dart';
import '../../database/db.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Db db;
  HomeCubit(this.db) : super(const HomeState()) {
    _fetchAudio();
  }
  Future<void> _fetchAudio() async {
    try {
      emit(state.copyWith(status: CrudStatus.reading));
      List<AudioModel> audios = await db.getDocuments(collectionPath: CollectionPath.audios, fromList: AudioModel.fromList);
      emit(state.copyWith(status: CrudStatus.done, audios: audios, message: ""));
    } catch (e) {
      emit(state.copyWith(status: CrudStatus.error, message: e.toString()));
    }
  }
}
