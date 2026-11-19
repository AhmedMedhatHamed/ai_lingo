import 'package:ai_lingo/feature/home/cubit/home_state.dart';
import 'package:ai_lingo/feature/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepository}) : super(HomeInitialState());

  final HomeRepository homeRepository;

  Future<void> getUser() async {
    try {
      final user = await homeRepository.getUser();
      emit(HomeUserSuccessState(user: user));
    } catch (e) {
      emit(HomeUserErrorState(message: e.toString()));
    }
  }

  Future<void> updateStreak() async {
    await homeRepository.updateStreak();
  }
}
