import 'package:ai_lingo/feature/home/cubit/home_state.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:ai_lingo/feature/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepository}) : super(HomeInitialState());

  final HomeRepository homeRepository;

  Future<void> getUser() async {
    emit(HomeLoadingState());
    try {
      final user = await homeRepository.getUser();
      emit(HomeUserSuccessState(user: user));
    } catch (e) {
      emit(HomeUserErrorState(message: e.toString()));
    }
  }

  Future<void> updateStreak() async {
    await homeRepository.updateStreak();
    await getUser();
  }

  Future<void> checkStreak() async {
    await homeRepository.checkStreak();
  }

  Future<void> addToHistory(HistoryModel historyItem) async {
    await homeRepository.addToHistory(historyItem);
  }
}
